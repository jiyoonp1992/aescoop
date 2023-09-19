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
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.UserService;

@Controller
public class AdminMemController {

	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.aesoop.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.aesoop.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	// --> import study.spring.aesoop.service.ProductService;
	@Autowired
	UserService userService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "/admin/mem_list", method = RequestMethod.GET)
	public ModelAndView list(Model model, HttpServletRequest request,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "mem_list", required = false) String memlist,
			// 페이지 구현에서 사용할 현재 페이지 번호
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
		User input = new User();

		if (memlist == null) {
			input.setUsername(keyword);
		} else if (memlist.equals("username")) {
			input.setUsername(keyword);
		} else if (memlist.equals("userid")) {
			input.setUserid(keyword);
		} else if (memlist.equals("userno")) {
			if (!regexHelper.isNum(keyword)) {
				return webHelper.redirect(null, "회원번호는 숫자만 검색 가능합니다.");
			}
			input.setUserno(Integer.parseInt(keyword));

		} else if (memlist.equals("usertel")) {
			input.setUsertel(keyword);
		}

		List<User> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = userService.getUserCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			User.setOffset(pageData.getOffset());
			User.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = userService.getUserList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("mem_list", memlist);

		return new ModelAndView("admin/admin_mem_list");
	}

	/** 관리자 탈퇴 회원 목록 */
	@RequestMapping(value = "/admin/mem_out", method = RequestMethod.GET)
	public ModelAndView admin_mem_out(Model model, HttpServletRequest request,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "mem_out", required = false) String memout,
			@RequestParam(value = "min_date", required = false) String mindate,
			@RequestParam(value = "max_date", required = false) String maxdate,
			// 페이지 구현에서 사용할 현재 페이지 번호
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
		User input = new User();

		if (memout == null) {
			input.setUsername(keyword);
		} else if (memout.equals("username")) {
			input.setUsername(keyword);
		} else if (memout.equals("userid")) {
			input.setUserid(keyword);

		} else if (memout.equals("reason")) {
			input.setReason(keyword);

		} else if (memout.equals("regdate")) {
			input.setRegdate(keyword);
		}

		List<User> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = userService.getOutUserCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			User.setOffset(pageData.getOffset());
			User.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = userService.getOutUserList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("mem_out", memout);

		return new ModelAndView("admin/admin_mem_out");
	}

	/** 관리자 join 목록 */
	@RequestMapping(value = "/admin/join", method = RequestMethod.GET)
	public String admin_mem_join(Model model) {

		return "admin/admin_join";
	}

	/** 관리자 privacy 목록 */
	@RequestMapping(value = "/admin/privacy", method = RequestMethod.GET)
	public String admin_mem_privacy(Model model) {

		return "admin/admin_privacy";
	}

	/** 관리자 회원 수정 */
	@RequestMapping(value = "/admin/mem_edit", method = RequestMethod.GET)
	public ModelAndView admin_mem_edit(Model model,
			HttpServletRequest request,
			@RequestParam(value = "userno", defaultValue = "0") int userno) {
		


		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (userno == 0) {
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
		return new ModelAndView("/admin/admin_mem_edit");
	}

	/** 관리자 회원 수정 액션 */
	@RequestMapping(value = "/admin/mem_edit_ok", method = RequestMethod.POST)
	public ModelAndView admin_mem_edit(Model model, HttpServletRequest request,
			@RequestParam(value = "userno", defaultValue = "0") int userno,
			@RequestParam(value = "userid", defaultValue = "") String userid,
			@RequestParam(value = "username", defaultValue = "") String username,
			@RequestParam(value = "usertel", defaultValue = "") String usertel,
			@RequestParam(value = "usermail", defaultValue = "") String usermail,
			@RequestParam(value = "birthdate", defaultValue = "") String birthdate,
			@RequestParam(value = "postno", defaultValue = "") String postno,
			@RequestParam(value = "address1", defaultValue = "") String address1,
			@RequestParam(value = "address2", defaultValue = "") String address2,
			@RequestParam(value = "address3", defaultValue = "") String address3,
			@RequestParam(value = "is_out", defaultValue = "") String is_out,
			@RequestParam(value = "is_admin", defaultValue = "") String is_admin) {
		
		if (!regexHelper.isValue(userid)) { return webHelper.redirect(null, "아이디를 입력하세요."); }
		if (!regexHelper.isEngNum(userid)) { return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
        if (!regexHelper.isValue(username)) { return webHelper.redirect(null, "이름을 입력하세요."); }
        if (!regexHelper.isKor(username)) { return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
        if (!regexHelper.isValue(usermail)) { return webHelper.redirect(null, "이메일 주소를 입력하세요."); }
        if (!regexHelper.isEmail(usermail)) { return webHelper.redirect(null, "이메일을 형식에 맞게 입력하세요."); }
        if (!regexHelper.isValue(usertel)) { return webHelper.redirect(null, "전화번호를 입력하세요."); }
        if (!regexHelper.isTel(usertel)) { return webHelper.redirect(null, "전화번호를 형식에 맞게 입력하세요."); }
        if (!regexHelper.isValue(address1)) { return webHelper.redirect(null, "주소를 입력하세요."); }
        if (!regexHelper.isValue(postno)) { return webHelper.redirect(null, "우편번호를 입력하세요."); }
        if (!regexHelper.isNum(postno)) { return webHelper.redirect(null, "우편번호는 숫자만 입력하세요."); }
        if (!regexHelper.isValue(birthdate)) { return webHelper.redirect(null, "생년월일을 입력하세요."); }
			


		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}


		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (userno == 0) {
			return webHelper.redirect(null, "회원정보가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		User input = new User();
		input.setUserno(userno);
		input.setUserid(userid);
		input.setUsername(username);
		input.setUsertel(usertel);
		input.setUsermail(usermail);
		input.setBirthdate(birthdate);
		input.setPostno(postno);
		input.setAddress1(address1);
		input.setAddress2(address2);
		input.setAddress3(address3);
		input.setIs_out(is_out);
		input.setIs_admin(is_admin);

		try {
			// 회원 기본 정보 조회
			userService.editAdminUser(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		return webHelper.redirect(null, "정보가 수정되었습니다.");
	}

	/** 관리자 탈퇴 회원 상세보기 */
	@RequestMapping(value = "/admin/mem_view", method = RequestMethod.GET)
	public ModelAndView admin_mem_view(Model model,
			HttpServletRequest request,
			@RequestParam(value = "userno", defaultValue = "0") int userno) {
		

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (userno == 0) {
			return webHelper.redirect(null, "회원정보가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		User input = new User();
		input.setUserno(userno);

		User output = null;

		try {
			// 회원 기본 정보 조회
			output = userService.getOutUserItem(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("/admin/admin_mem_view");
	}
}