package study.spring.aesoop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.Cart;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.CartService;


@Controller
public class CartController {

	@Autowired WebHelper webHelper;
	
	@Autowired RegexHelper regexHelper;
	
	@Autowired CartService cartService;
	
	@Value("#{servletContext.contextPath}") String contextPath;
	
	
	/** 카트 목록 다중 조회 */
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView cart(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");
		
		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		int userno = mySession.getUserno();
		
		
		Cart cart = new Cart();
		cart.setUserno(userno);
		
		List<Cart> output = null;
		
		try {
			output = cartService.getCartList(cart);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		
		
		return new ModelAndView("common/cart");
	}
	
	
	/** 카트 주문하기 */
	@RequestMapping(value="/cart_order_ok", method = RequestMethod.POST)
	public ModelAndView edit(Model model,
		HttpServletRequest request,
		@RequestParam(value = "amount", defaultValue = "0") int[] amount,
		@RequestParam(value = "cartno", defaultValue = "0") int[] cartno,
		@RequestParam(value="totalprice", defaultValue = "") String totalprice) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");
		
		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}

		// 레코드의 갯수 만큼 반복문 실행
        for(int i=0; i<cartno.length; i++){
    		
            /** 1) 파라미터 유효성 검사 */
    		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
    		if(cartno[i] == 0) {
    			return webHelper.redirect(null, "카트가 비었습니다.");
    		} else if(amount[i] == 0) {
    			return webHelper.redirect(null, "카트가 비었습니다.");
    		}

    		/** 2) 데이터 조회하기 */
    		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
    		Cart input = new Cart();
            input.setAmount(amount[i]);
            input.setCartno(cartno[i]);
            
    		try {
    			cartService.UpdateCart(input);
    		} catch (Exception e) {
    			return webHelper.redirect(null, e.getLocalizedMessage());
    		}

        }
        
        
        String tprice1 = totalprice.trim();
        String tprice2 = tprice1.replace(",","");

        int tprice = Integer.parseInt(tprice2);
        
        model.addAttribute("tprice", tprice);


		return new ModelAndView("/common/order");
	}

}
