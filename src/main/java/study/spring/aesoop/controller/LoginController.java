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

import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.UserService;


@Controller
public class LoginController {
	
	@Autowired UserService userService;
	
	@Autowired WebHelper webHelper;
	
	@Autowired RegexHelper regexHelper;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;

	/**
	 * 로그인 세션 저장을 위한 페이지
	 * 이페이지를 URL에 GET 방식으로 노출시킨다.
	 */
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login(Model model, HttpServletResponse response) {

		return new ModelAndView("/common/modal-login");
	} 
	
	/**
	 * 세션를 저장하기 위한 페이지
	 */
	@RequestMapping(value = "/login_ok", method = RequestMethod.POST)
	private ModelAndView login_ok(Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "userid") String userid, 
			@RequestParam(value = "userpw") String userpw) {
		
		if (!regexHelper.isValue(userid)) { return webHelper.redirect(null, "아이디를 입력하세요."); }
		if (!regexHelper.isValue(userpw)) { return webHelper.redirect(null, "비밀번호를 입력하세요."); }

		User input = new User();
		input.setUserid(userid);
		input.setUserpw(userpw);

		User output = null;
		
		try {
			// 특정 아이디에 대한 결과 조회
			output = userService.doLogin(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("user", output);
		
		String redirectUrl = contextPath;
		
		return webHelper.redirect(redirectUrl, output.getUsername() + "님 로그인 되었습니다.");
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView userLogout(Model model, HttpServletResponse response, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
        
        
        String redirectUrl = contextPath;
        
        return webHelper.redirect(redirectUrl, "안녕히가세요.");
    }
}