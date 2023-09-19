package study.spring.aesoop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.aesoop.helper.MailHelper;
import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.Outuser;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.UserService;


@Controller
public class UserController {
	/** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;
    @Autowired  MailHelper mailHelper;

    /** Service 패턴 구현체 주입 */
    // --> import study.spring.springhelper.service.UserService;
    @Autowired  UserService userService;
    

    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 회원가입 폼 페이지 */
    @RequestMapping(value={"/admin/admin_register.do","/register"}, method = RequestMethod.GET)
	public ModelAndView add(Model model) {

		return new ModelAndView("admin/admin_register");

	}
	
	/** 회원가입 폼에 대한 action 페이지 */
	@RequestMapping(value="/register_ok", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model,
			@RequestParam(value="userno", defaultValue="0") int userno,
			@RequestParam(value="userid", defaultValue="") String userid,
			@RequestParam(value="userpw", defaultValue="") String userpw,
			@RequestParam(value="userpwconfirm", defaultValue = "") String userpwconfirm,
			@RequestParam(value="username", defaultValue="") String username,
			@RequestParam(value="usermail", defaultValue="") String usermail,
			@RequestParam(value="usertel", defaultValue="") String usertel,
			@RequestParam(value="birthdate", defaultValue="") String birthdate,                 
			@RequestParam(value="regdate", defaultValue="") String regdate,
			@RequestParam(value="postno", defaultValue="") String postno,
			@RequestParam(value="address1", defaultValue="") String address1,
			@RequestParam(value="address2", defaultValue="") String address2,
			@RequestParam(value="address3", defaultValue="") String address3) {
		
		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터 가 선언되어 있는 값이 입력되지 않으면 빈 문자열로 처리된다.
		
		if (!regexHelper.isValue(userid)) { return webHelper.redirect(null, "아이디를 입력하세요."); }
		if (!regexHelper.isEngNum(userid)) { return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
		if (!regexHelper.isValue(userpw)) { return webHelper.redirect(null, "비밀번호를 입력하세요."); }
        if (!regexHelper.isPassword(userpw)) { return webHelper.redirect(null, "비밀번호를 형식에 맞게 입력하세요."); }
		if (!regexHelper.isValue(userpwconfirm)) { return webHelper.redirect(null, "비밀번호 확인을 입력하세요."); }
		if (!userpw.equals(userpwconfirm)) { return webHelper.redirect(null, "비밀번호 확인이 올바르지 않습니다."); }
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
			
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		User input = new User();
		input.setUserno(userno);
        input.setUserid(userid);
        input.setUserpw(userpw);
        input.setUsername(username);
        input.setUsermail(usermail);
        input.setUsertel(usertel);
        input.setBirthdate(birthdate);
        input.setRegdate(regdate);
        input.setAddress1(address1);
        input.setAddress2(address2);
        input.setAddress3(address3);
        input.setPostno(postno);
        
        try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			userService.idChk(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			userService.addUserInfo(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 로그인 페이지로 이동 */
		String redirectUrl = contextPath;
		return webHelper.redirect(redirectUrl, "가입되었습니다.");
	}
	
	/** 이름 수정 폼 페이지 */
	@RequestMapping(value="/mypage/name_edit", method = RequestMethod.GET)
	public ModelAndView name_edit(Model model,
			HttpServletRequest request,
			@RequestParam(value="userno") int userno) {
		
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
		return new ModelAndView("/mypage/mypage_main");
	}
	
	/** 이름 수정 폼에 대한 action 페이지 */
	@RequestMapping(value="/mypage/name_edit_ok", method = RequestMethod.POST)
	public ModelAndView name_edit_ok(Model model, HttpServletRequest request,
			@RequestParam(value="userno", defaultValue="0") int userno,
			@RequestParam(value="username", defaultValue="") String username,
			@RequestParam(value="birthdate", defaultValue="") String birthdate) {
		
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
        /** 1) 사용자가 입력한 파라미터 유효성 검사 */
		
		if (userno == 0) { return webHelper.redirect(null, "회원정보가 없습니다."); }
        // 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
        if (!regexHelper.isValue(username))     { return webHelper.redirect(null, "이름을 입력하세요."); }
        if (!regexHelper.isKor(username))       { return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
        if (!regexHelper.isValue(birthdate))  { return webHelper.redirect(null, "생년월일을 입력하세요."); }

        /** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        User input = new User();
        input.setUserno(userno);
        input.setUsername(username);
        input.setBirthdate(birthdate);

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
        	 userService.editUserNameInfo(input);
        	 } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

		session.invalidate();
		
        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
        return webHelper.redirect("/aesoop", "회원정보가 수정되었습니다. 다시 로그인하세요.");
    }
	
	/** 비번 수정 폼 페이지 */
	@RequestMapping(value="/mypage/pw_edit", method = RequestMethod.GET)
	public ModelAndView pw_edit(Model model,
			HttpServletRequest request,
			@RequestParam(value="userno") int userno) {
		
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
		return new ModelAndView("/mypage/mypage_main");
	}
	
	/** 비번 수정 폼에 대한 action 페이지 */
	@RequestMapping(value="/mypage/pw_edit_ok", method = RequestMethod.POST)
	public ModelAndView pw_edit_ok(Model model, HttpServletRequest request,
			@RequestParam(value="userno", defaultValue="0") int userno,
			@RequestParam(value="userpw", defaultValue="") String userpw,
			@RequestParam(value="new_pw", defaultValue="") String new_pw,
			@RequestParam(value="userpwconfirm", defaultValue = "") String userpwconfirm) {
        
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
        /** 1) 사용자가 입력한 파라미터 유효성 검사 */
		
		if (userno == 0) { return webHelper.redirect(null, "회원정보가 없습니다."); }
        // 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (!regexHelper.isValue(userpw)) { return webHelper.redirect(null, "현재 비밀번호를 입력하세요."); }
		if (!regexHelper.isValue(new_pw)) { return webHelper.redirect(null, "새 비밀번호를 입력하세요."); }
		if (!regexHelper.isValue(userpwconfirm)) { return webHelper.redirect(null, "비밀번호 확인을 입력하세요."); }
		if (!new_pw.equals(userpwconfirm)) { return webHelper.redirect(null, "비밀번호 확인이 올바르지 않습니다."); }
		User input = new User();
		
		try {
			input.setUserpw(userpw);
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			userService.pwChk(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
        /** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        
        input.setUserno(userno);
        input.setUserpw(new_pw);
       
        

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
        	 userService.editUserPwInfo(input);
        	 } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

		session.invalidate();
		
        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
        return webHelper.redirect("/aesoop", "회원정보가 수정되었습니다. 다시 로그인하세요.");
    }
	
	/** 주소 수정 폼 페이지 */
	@RequestMapping(value="/mypage/addr_edit", method = RequestMethod.GET)
	public ModelAndView addr_edit(Model model,
			HttpServletRequest request,
			@RequestParam(value="userno") int userno) {
		
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
	
	/** 주소 수정 폼에 대한 action 페이지 */
	@RequestMapping(value="/mypage/addr_edit_ok", method = RequestMethod.POST)
	public ModelAndView addr_edit_ok(Model model, HttpServletRequest request,
			@RequestParam(value="userno", defaultValue="0") int userno,
			@RequestParam(value="postno", defaultValue="") String postno,
			@RequestParam(value="address1", defaultValue="") String address1,
			@RequestParam(value="address2", defaultValue="") String address2,
			@RequestParam(value="address3", defaultValue="") String address3) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
        /** 1) 사용자가 입력한 파라미터 유효성 검사 */
		
		if (userno == 0) { return webHelper.redirect(null, "회원정보가 없습니다."); }

        /** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        User input = new User();
        input.setUserno(userno);
        input.setPostno(postno);
        input.setAddress1(address1);
        input.setAddress2(address2);
        input.setAddress3(address3);

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
        	 userService.editUserAddrInfo(input);
        	 } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

		session.invalidate();
		
        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
        return webHelper.redirect("/aesoop", "회원정보가 수정되었습니다. 다시 로그인하세요.");
    }
	
	/** 아이디 찾기 폼 */
	@RequestMapping(value = {"/admin/id_find", "/id_find"}, method = RequestMethod.GET)
		public ModelAndView idfind(Model model, HttpServletResponse response, HttpServletRequest request) {
			
		return new ModelAndView("/admin/admin_id_find");
	}
	
	/** 비밀번호 찾기 폼 */
	@RequestMapping(value = {"/admin/pw_find", "/pw_find"}, method = RequestMethod.GET)
		public ModelAndView pwfind(Model model, HttpServletResponse response, HttpServletRequest request) {
			
		return new ModelAndView("/admin/admin_pw_find");
	}
	
	/** 아이디 찾기 action폼 */
	@RequestMapping(value = {"/admin/id_find_ok", "/id_find_ok"}, method = RequestMethod.POST)
		public ModelAndView idfind_ok(Model model, HttpServletResponse response, HttpServletRequest request,
				@RequestParam(value="username", defaultValue="") String username,
				@RequestParam(value="usermail", defaultValue="") String usermail) {
		
		if (!regexHelper.isValue(username))     { return webHelper.redirect(null, "이름을 입력하세요."); }
		if (!regexHelper.isKor(username))       { return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
		if (!regexHelper.isValue(usermail))   { return webHelper.redirect(null, "이메일 주소를 입력하세요.");}

			User output = null;
			
			User input = new User();
			input.setUsername(username);
			input.setUsermail(usermail);
			
			
			try {
	            // 데이터 저장
	            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
				output = userService.idFind(input);
	        } catch (Exception e) {
	            return webHelper.redirect(null, e.getLocalizedMessage());
	        }
			
			/* 결과처리 */
			model.addAttribute("output", output);
			
		return webHelper.redirect(contextPath, input.getUsername() + " 님의 아이디는 " + output.getUserid() + " 입니다.");
		}
	
	/** 비밀번호 찾기 action폼 */
	@RequestMapping(value = {"/admin/pw_find_ok", "/pw_find_ok"}, method = RequestMethod.POST)
		public ModelAndView pwfind_ok(Model model, HttpServletResponse response, HttpServletRequest request,
				@RequestParam(value="userid", defaultValue="") String userid,
				@RequestParam(value="usermail", defaultValue="") String usermail) {
		
		if (!regexHelper.isValue(userid)) { return webHelper.redirect(null, "아이디를 입력하세요."); }
		if (!regexHelper.isValue(usermail))   { return webHelper.redirect(null, "이메일 주소를 입력하세요.");}
			
			String pw = "";
			
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
		
			User input = new User();
			input.setUserpw(pw);
			input.setUserid(userid);
			input.setUsermail(usermail);
			
			try {
	            // 데이터 저장
	            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
				userService.pwUpItem(input);
	        } catch (Exception e) {
	            return webHelper.redirect(null, e.getLocalizedMessage());
	        }
			
			try {
				// 데이터 저장
				// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
				
				userService.pwFind(input);

				String to = input.getUsermail();
				String subjct = "aesoop 임시 비밀번호 입니다.";
				String content = "임시 비밀번호는 " + input.getUserpw() + " 입니다.";
				mailHelper.sendMail(to, subjct, content);
				
			} catch (Exception e) {
				return webHelper.redirect(null, "메일 발송에 실패했습니다.");
			}
	
			/* 결과처리 */
			String redirectUrl = contextPath;
		return webHelper.redirect(redirectUrl, "임시 비밀번호가 발급 되었습니다.");
		}
	
	
	/** 탈퇴 폼에 대한 action 페이지 */
	@RequestMapping(value = "/out_ok", method = RequestMethod.POST)
    public ModelAndView userLogout(Model model, HttpServletResponse response, HttpServletRequest request,
    		@RequestParam(value="checkbox1", defaultValue="false") boolean checkbox1,
    		@RequestParam(value="checkbox2", defaultValue="false") boolean checkbox2,
			@RequestParam(value="reason", defaultValue="") String reason,
			@RequestParam(value="reason2", defaultValue = "") String reason2
			) {
		
		if (checkbox1 == false) { return webHelper.redirect(null, "회원 정보 및 구매 내역 삭제에 관한 약관에 동의해주세요."); }
		if (checkbox2 == false) { return webHelper.redirect(null, "탈퇴 후 정보보관에 대한 안내에 관한 약관에 동의해주세요."); }
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		int userno = mySession.getUserno();
		
		/** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        User input = new User();
        input.setUserno(userno);
        
        if(reason2.equals(null) || reason2.equals("")) {
			input.setReason(reason);
		} else {
			input.setReason(reason2);
		}
        
        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
        	userService.doOut(input);

        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
		session.invalidate();

        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
        String redirectUrl = contextPath;
        return webHelper.redirect(redirectUrl, "회원 탈퇴되었습니다.");
    }

}