package study.spring.aesoop.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

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

import study.spring.aesoop.helper.PageData;
import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.Notice;
import study.spring.aesoop.model.Qna;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.QnaService;

@Controller
public class AdminQnaController {

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
	// --> import study.spring.aesoop.service.QnaService;
	@Autowired
	QnaService qnaService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "/admin/admin_qna_list.do", method = RequestMethod.GET)
	public ModelAndView list(Model model, HttpServletRequest request,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 5; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Qna input = new Qna();
		input.setTitle(keyword);

		List<Qna> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = qnaService.getQnaCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Qna.setOffset(pageData.getOffset());
			Qna.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = qnaService.getQnaList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("admin/admin_qna_list");
	}

	/*
	 * @RequestMapping(value = "/admin/admin_qna_list.do", method =
	 * RequestMethod.GET) public String admin_qna_list(Model model) {
	 * 
	 * return "admin/admin_qna_list"; }
	 */

	/** 작성 폼 페이지 */
	@RequestMapping(value = "/admin/admin_qna_write.do", method = RequestMethod.GET)
	public ModelAndView admin_qna_write(Model model) {

		return new ModelAndView("admin/admin_qna_write");
	}

	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/admin/admin_qna_write_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "email", defaultValue = "") String email,
			@RequestParam(value = "tel", defaultValue = "") String tel,
			@RequestParam(value = "username", defaultValue = "") String username,
			@RequestParam(value = "file", defaultValue = "") String file) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (!regexHelper.isValue(title)) {
			return webHelper.redirect(null, "질문 사항을 선택하세요.");
		}
		if (!regexHelper.isValue(content)) {
			return webHelper.redirect(null, "내용을 입력하세요.");
		}
		if (!regexHelper.isTel(tel)) {
			return webHelper.redirect(null, "전화번호를 형식에 맞게 입력하세요.(\"-\"없이 숫자만 입력)");
		}
		if (!regexHelper.isValue(username)) {
			return webHelper.redirect(null, "이름을 입력하세요.");
		}
		if (!regexHelper.isEmail(email)) {
			return webHelper.redirect(null, "이메일을 형식에 맞게 입력하세요.");
		}

		// 숫자형으로 선언된 파라미터()
		/*
		 * if (sal == 0) { return webHelper.redirect(null, "급여를 입력하세요."); } if (sal < 0)
		 * { return webHelper.redirect(null, "급여는 0보다 작을 수 없습니다."); } if (comm < 0) {
		 * return webHelper.redirect(null, "보직수당은 0보다 작을 수 없습니다."); } if (deptno == 0) {
		 * return webHelper.redirect(null, "소속 학과 번호를 입력하세요."); }
		 */

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Qna input = new Qna();
		input.setTitle(title);
		input.setContent(content);
		input.setTel(tel);
		input.setUsername(username);
		input.setFile(file);
		input.setEmail(email);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			qnaService.addQna(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/ask/qna.do";
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}

	@RequestMapping(value = "/ask/qna.do", method = RequestMethod.GET)
	public String store_search_list(Model model) {

		return "/ask/qna";
	}

	/** 삭제 처리 */
	@RequestMapping(value = "/admin/admin_qna_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "qnano", defaultValue = "0") int qnano) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (qnano == 0) {
			return webHelper.redirect(null, "게시물 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Qna input = new Qna();
		input.setQnano(qnano);

		try {
			qnaService.deleteQna(input); // 데이터 삭제
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/admin/admin_qna_list.do", "삭제되었습니다.");
	}

	   /** 수정 폼 페이지 */
	   @RequestMapping(value = "/admin/admin_qna_edit.do", method = RequestMethod.GET)
	   public ModelAndView edit(Model model, HttpServletRequest request, HttpServletResponse response,
	         @RequestParam(value = "qnano") int qnano) {

	      HttpSession session = request.getSession();
	      User mySession = (User) session.getAttribute("user");

	      if (mySession == null) {
	         return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
	      }

	      // 데이터 조회에 필요한 조건값을 Beans에 저장하기
	      Qna input = new Qna();
	      input.setQnano(qnano);

	      // 수정할 데이터의 원본 조회하기
	      Qna output = null;

	      try {
	         output = qnaService.getQnaItem(input);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      // View 처리
	      model.addAttribute("output", output);
	      return new ModelAndView("admin/admin_qna_edit");
	   }
	   /** 수정 폼에 대한 action 페이지 
	     * @return */
	    @RequestMapping(value = "/admin/admin_qna_edit_ok.do", method = RequestMethod.POST)
	    public ModelAndView editOk(
	    	Model model, 
	    	  @RequestParam(value="qnano") int qnano,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "email", defaultValue = "") String email,
			@RequestParam(value = "tel", defaultValue = "") String tel,
			  @RequestParam(value="memo") String memo,
			@RequestParam(value = "username", defaultValue = "") String username,
			@RequestParam(value = "file", defaultValue = "") String file) {
	    
	    	if (!regexHelper.isValue(title)) {
				return webHelper.redirect(null, "제목 입력하세요.");
			}if (!regexHelper.isValue(content)) {
				return webHelper.redirect(null, "내용을 입력하세요.");
			}
	        // 수정할 값들을 Beans에 담는다.
	        Qna input = new Qna();
	        input.setQnano(qnano);
	        input.setTitle(title);
	        input.setContent(content);
	        input.setMemo(memo);

	        try {
	            // 데이터 수정
	            qnaService.editQna(input);
	        } catch (Exception e) { e.printStackTrace(); }

	        // 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다. 
	        String redirectUrl = contextPath + "/admin/admin_qna_list.do";
	        	return webHelper.redirect(redirectUrl,"수정되었습니다.");
	    }

	@RequestMapping(value = "/admin/qna_delete_ok.do")
	public String ajaxTest(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("valueArr");

		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			qnaService.deleteQna(ajaxMsg[i]);
		}

		return "redirect:admin_qna_list.do";
	}

	/** 상세 페이지 */
	@RequestMapping(value = "/admin/admin_qna_view.do", method = RequestMethod.GET)
	public ModelAndView view(Model model,
			HttpServletRequest request,
			@RequestParam(value = "qnano", defaultValue = "0") int qnano) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}
		
		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (qnano == 0) {
			return webHelper.redirect(null, "게시물번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Qna input = new Qna();
		input.setQnano(qnano);

		// 조회결과를 저장할 객체 선언
		Qna output = null;

		try {
			// 데이터 조회
			output = qnaService.getQnaItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("admin/admin_qna_view");
	}
}
