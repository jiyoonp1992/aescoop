package study.spring.aesoop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.aesoop.helper.PageData;
import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.Cart;
import study.spring.aesoop.model.Order_List;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.CartService;
import study.spring.aesoop.service.MyOrderService;
import study.spring.aesoop.service.OrderService;
import study.spring.aesoop.service.UserService;

@Controller
public class MypageController {
	@Autowired WebHelper webHelper;
	
	@Autowired RegexHelper regexHelper;
	
	@Autowired MyOrderService myOrderService;
	
	@Autowired OrderService orderService;
	
	@Autowired CartService cartService;
	
	@Autowired UserService userService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/mypage/address", method = RequestMethod.GET)
	public ModelAndView addr_edit(Model model,
			HttpServletRequest request,
			@RequestParam(value="userno", defaultValue = "0") int userno) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if(userno == 0) {
			return webHelper.redirect(null, "회원정보가 없습니다.");
		}
		
		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		User input = new User();
		input.setUserno(userno);
		
		User output = null;
		
		
		try {
			// 회원 기본 정보 조회
			output = userService.getUserItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("output", output);	
		return new ModelAndView("/mypage/mypage_address");
	}
	
	@RequestMapping(value = "/mypage/main", method = RequestMethod.GET)
	public String mypage_main(Model model, HttpServletResponse response) {

		return "/mypage/mypage_main";
	}
	
	/** 마이페이지 주문 목록 */
	@RequestMapping(value = "/mypage/order", method = RequestMethod.GET)
	public ModelAndView mypage_order(Model model,
			HttpServletRequest request,
			@RequestParam(value = "userno") int userno,
			@RequestParam(value="page", defaultValue = "1") int nowPage) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Order_List input = new Order_List();
		input.setUserno(userno);
		
		List<Order_List> output = null;
		PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
            totalCount = myOrderService.getMyOrderCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Order_List.setOffset(pageData.getOffset());
            Order_List.setListCount(pageData.getListCount());
            
			output=myOrderService.getMyOrderList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("userno", userno);
		
		return new ModelAndView("mypage/mypage_order");
	}
	
	/** 마이페이지 주문 상세 */
	@RequestMapping(value = "/mypage/order_view", method = RequestMethod.GET)
	public ModelAndView admin_order_view(Model model,
			HttpServletRequest request,
			@RequestParam(value="orderno", defaultValue = "0") int orderno) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		/** 1) 파라미터 유효성 검사 */
		if (orderno == 0) { return webHelper.redirect(null, "주문번호가 없습니다."); }
		
		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Order_List input = new Order_List();
		input.setOrderno(orderno);

		// 조회결과를 저장할 객체 선언
		Order_List output = null;
		
		List<Order_List> output_prod = null;

		try {
			// 주문 상세 정보
			output = myOrderService.getMyOrderItem(input);
			// 주문 제품 상세 정보
			output_prod = myOrderService.getMyOrderProdList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 2) View 처리 */
		model.addAttribute("output", output);	
		model.addAttribute("output_prod", output_prod);	
		return new ModelAndView("mypage/mypage_order_view");
	}
	
	/** 마이페이지 주문 취소 */
	@RequestMapping(value = "/admin/order_list_cancel", method = RequestMethod.POST)
	public ModelAndView admin_order_cancel(Model model,
			HttpServletRequest request,
			@RequestParam(value="orderno", defaultValue = "0") int orderno) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		/** 1) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        Order_List input = new Order_List();
        input.setOrderno(orderno);

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            myOrderService.cancelMyOrder(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
        String redirectUrl = contextPath + "/mypage/order_view?orderno=" + input.getOrderno();
        return webHelper.redirect(redirectUrl, "주문 취소되었습니다.");
	}
	
	@RequestMapping(value = "/mypage/recent", method = RequestMethod.GET)
	public String mypage_recent(Model model, HttpServletResponse response) {

		return "/mypage/mypage_recent";
	}
	
	@RequestMapping(value = "/mypage/withdrawal", method = RequestMethod.GET)
	public String mypage_withdrawal(Model model, HttpServletResponse response) {

		return "/mypage/mypage_withdrawal";
	}
	
	
	/** 마이페이지 주문하기 */
	@RequestMapping(value = "/order_add", method = RequestMethod.POST)
	public ModelAndView admin_order_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "tprice", defaultValue = "0") int tprice,
			@RequestParam(value = "user_name", defaultValue = "") String username,
			@RequestParam(value = "tel", defaultValue = "") String tel,
			@RequestParam(value = "postno", defaultValue = "") String postno,
			@RequestParam(value = "address1", defaultValue = "") String address1,
			@RequestParam(value = "address2", defaultValue = "") String address2,
			@RequestParam(value = "address3", defaultValue = "") String address3,
			@RequestParam(value = "requirement", defaultValue = "") String requirement,
			@RequestParam(value = "order_check", defaultValue = "false") boolean order_check
			) {

		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		
		if (order_check == false) { return webHelper.redirect(null, "이용 약관에 동의해주세요."); }
		
		int userno = mySession.getUserno();
		
		Order_List input = new Order_List();
		input.setTprice(tprice);
		input.setRequirement(requirement);
		input.setUsername(username);
		input.setUsertel(tel);
		input.setPostno(postno);
		input.setAddress1(address1);
		input.setAddress2(address2);
		input.setAddress3(address3);
		input.setUserno(userno);

		
		try {
			orderService.addOrder(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int orderno = input.getOrderno();
		
		Cart input2 = new Cart();
		input2.setUserno(userno);
		input2.setHas_orderno(orderno);
		
		try {
			cartService.updateCartOrderno(input2);
		} catch (Exception e1) {
			return webHelper.redirect(null, e1.getLocalizedMessage());
		}
		
		Order_List input3 = new Order_List();
		input3.setOrderno(orderno);
		
		Order_List output = null;
		List<Order_List> output_prod = null;
		
		try {
			output = myOrderService.getMyOrderItem(input3);
			output_prod = myOrderService.getMyOrderProdList(input3);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);
		model.addAttribute("output_prod", output_prod);	
		
		return new ModelAndView("common/order_view");
	}
	
}
