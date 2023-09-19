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

import study.spring.aesoop.helper.PageData;
import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.Order_List;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.OrderService;

@Controller
public class AdminOrderController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	OrderService orderService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 관리자 주문 목록 */
	@RequestMapping(value = "/admin/order_list", method = RequestMethod.GET)
	public ModelAndView admin_order_list(Model model, HttpServletRequest request,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "orderstatus", defaultValue = "") String orderstatus,
			@RequestParam(value = "prod_view", required = false) String prodview,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Order_List input = new Order_List();
		input.setOrderstatus(orderstatus);

		if (prodview == null) {
			input.setUsername(keyword);
		} else if (prodview.equals("username")) {
			input.setUsername(keyword);
		} else if (prodview.equals("userid")) {
			input.setUserid(keyword);

		} else if (prodview.equals("orderno")) {
			if (!regexHelper.isNum(keyword)) {
				return webHelper.redirect(null, "주문번호는 숫자만 검색 가능합니다.");
			}
			input.setOrderno(Integer.parseInt(keyword));

		} else if (prodview.equals("orderstatus")) {
			input.setOrderstatus(keyword);
		}

		List<Order_List> output = null;
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = orderService.getOrderCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Order_List.setOffset(pageData.getOffset());
			Order_List.setListCount(pageData.getListCount());

			output = orderService.getOrderList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("orderstatus", orderstatus);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("prod_view", prodview);

		return new ModelAndView("admin/admin_order_list");
	}

	/** 관리자 주문 상세 */
	@RequestMapping(value = "/admin/order_view", method = RequestMethod.GET)
	public ModelAndView admin_order_view(Model model, HttpServletRequest request,
			@RequestParam(value = "orderno", defaultValue = "0") int orderno) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 1) 파라미터 유효성 검사 */
		if (orderno == 0) {
			return webHelper.redirect(null, "주문번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Order_List input = new Order_List();
		input.setOrderno(orderno);

		// 조회결과를 저장할 객체 선언
		Order_List output = null;

		List<Order_List> output_prod = null;

		try {
			// 주문 상세 정보
			output = orderService.getOrderItem(input);
			// 주문 제품 상세 정보
			output_prod = orderService.getOrderProdList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 2) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("output_prod", output_prod);
		return new ModelAndView("admin/admin_order_view");
	}

	/** 관리자 주문 수정 */
	@RequestMapping(value = "/admin/order_edit_ok", method = RequestMethod.POST)
	public ModelAndView admin_order_edit(Model model, HttpServletRequest request,
			@RequestParam(value = "orderno", defaultValue = "0") int orderno,
			@RequestParam(value = "paid", defaultValue = "") String paid,
			@RequestParam(value = "orderstatus", defaultValue = "") String orderstatus,
			@RequestParam(value = "requirement", defaultValue = "") String requirement,
			@RequestParam(value = "username", defaultValue = "") String username,
			@RequestParam(value = "usertel") String usertel,
			@RequestParam(value = "postno", defaultValue = "") String postno,
			@RequestParam(value = "address1", defaultValue = "") String address1,
			@RequestParam(value = "address2", defaultValue = "") String address2,
			@RequestParam(value = "address3", defaultValue = "") String address3) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}
		if (!regexHelper.isValue(username)) {
			return webHelper.redirect(null, "이름을 입력하세요.");
		}
		if (!regexHelper.isValue(postno)) {
			return webHelper.redirect(null, "우편번호를 입력하세요.");
		}
		if (!regexHelper.isValue(postno)) {
			return webHelper.redirect(null, "우편번호는 숫자만 입력할 수 있습니다.");
		}
		if (!regexHelper.isValue(usertel)) {
			return webHelper.redirect(null, "연락처를 입력하세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Order_List input = new Order_List();
		input.setOrderno(orderno);
		input.setPaid(paid);
		input.setOrderstatus(orderstatus);
		input.setRequirement(requirement);
		input.setUsername(username);
		input.setUsertel(usertel);
		input.setPostno(postno);
		input.setAddress1(address1);
		input.setAddress2(address2);
		input.setAddress3(address3);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			orderService.editOrder(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/admin/order_view?orderno=" + input.getOrderno();
		return webHelper.redirect(redirectUrl, "수정되었습니다.");
	}

	/** 관리자 주문 수정 */
	@RequestMapping(value = "/admin/order_status_edit_ok", method = RequestMethod.POST)
	public ModelAndView admin_order_edit(Model model, HttpServletRequest request,
			@RequestParam(value = "orderno", defaultValue = "0") int orderno,
			@RequestParam(value = "orderstatus", defaultValue = "") String orderstatus) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Order_List input = new Order_List();
		input.setOrderno(orderno);
		input.setOrderstatus(orderstatus);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			orderService.addDate(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/admin/order_list";
		return webHelper.redirect(redirectUrl, "수정되었습니다.");
	}

	/** 관리자 주문 삭제 */
	@RequestMapping(value = "/admin/order_delete_ok")
	public String ajaxTest(HttpServletRequest request) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return "redirect:order_list";
		}

		String[] ajaxMsg = request.getParameterValues("valueArr");

		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			orderService.deleteOrder(ajaxMsg[i]);
		}

		return "redirect:order_list";
	}
}
