package study.spring.aesoop.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.Cart;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.CartService;



@RestController
public class CartRestController {

	@Autowired WebHelper webHelper;
	
	@Autowired RegexHelper regexHelper;
	
	@Autowired CartService cartService;
	
	@Value("#{servletContext.contextPath}") String contextPath;
	
	/** 카트 담기 */
    @RequestMapping(value = "/add_cart", method = RequestMethod.GET)
    public Map<String, Object> add_cart(Model model,
			HttpServletRequest request,
			@RequestParam(value="prodno", defaultValue="0") int prodno) {
    	
    	HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");
		
		if (mySession == null) {
			return webHelper.getJsonWarning("로그인해주세요.");
		}
		
		int userno = mySession.getUserno();
		
		
		Cart cart = new Cart();
		cart.setUserno(userno);
		cart.setProdno(prodno);
		
		int cartCount = 0;
		
		cartCount = cartService.getCartCount(cart);
		
		if (cartCount > 0) {
			return webHelper.getJsonWarning("이미 담겨진 상품입니다.");
		}
		
		try {
			cartService.addCartItem(cart);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

        /** 3) 결과를 확인하기 위한 JSON 출력 */
        // 확인할 대상이 삭제된 결과값만 OK로 전달
        return webHelper.getJsonData();
    }

	/** 삭제 처리 */
    @RequestMapping(value = "/cart_delete", method = RequestMethod.DELETE)
    public Map<String, Object> delete(
            @RequestParam(value="cartno", defaultValue="0") int cartno) {
        
        /** 1) 파라미터 유효성 검사 */
        // 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (cartno == 0) {
            return webHelper.getJsonWarning("카트 번호가 없습니다.");
        }

        /** 2) 데이터 삭제하기 */
        // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
        Cart input = new Cart();
        input.setCartno(cartno);

        try {
            cartService.deleteCart(input); // 데이터 삭제
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 JSON 출력 */
        // 확인할 대상이 삭제된 결과값만 OK로 전달
        return webHelper.getJsonData();
    }
	
}
