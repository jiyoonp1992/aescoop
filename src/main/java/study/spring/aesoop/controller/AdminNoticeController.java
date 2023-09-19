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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.aesoop.helper.PageData;
import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.UploadItem;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.Notice;
import study.spring.aesoop.model.Qna;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.NoticeService;

@Controller
public class AdminNoticeController {

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
	// --> import study.spring.aesoop.service.NoticeService;
	@Autowired
	NoticeService noticeService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "/admin/admin_notice_list.do", method = RequestMethod.GET)
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
		Notice input = new Notice();
		input.setTitle(keyword);

		List<Notice> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = noticeService.getNoticeCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Notice.setOffset(pageData.getOffset());
			Notice.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = noticeService.getNoticeList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("admin/admin_notice_list");
	}

	/** 작성 폼 페이지 */
	@RequestMapping(value = "/admin/admin_notice_write.do", method = RequestMethod.GET)
	public ModelAndView admin_notice_write(Model model) {

		return new ModelAndView("admin/admin_notice_write");
	}

	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/admin/admin_notice_write_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "file", defaultValue = "") String file,
			@RequestParam(required = false) MultipartFile[] photo,
			@RequestParam(value = "view", defaultValue = "1") Integer view) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (!regexHelper.isValue(title)) {
			return webHelper.redirect(null, "제목을 입력하세요.");
		}
		if (!regexHelper.isValue(content)) {
			return webHelper.redirect(null, "내용을 입력하세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Notice input = new Notice();
		input.setTitle(title);
		input.setContent(content);
		input.setView(view);

		if (photo != null) {
			/** 1) 업로드 처리 */
			List<UploadItem> list = null;
			try {
				list = webHelper.saveMultipartFile(photo);
			} catch (NullPointerException e) {
				e.printStackTrace();
				return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
			} catch (Exception e) {
				e.printStackTrace();
				return webHelper.redirect(null, "업로드에 실패했습니다.");
			}

			/** 2) 업로드 된 항목 수 만큼 반복을 수행하면서 원본 파일 경로와 썸네일 이미지의 경로를 설정한다. */
			for (int i = 0; i < list.size(); i++) {
				UploadItem item = list.get(i);

				// 원본 파일의 경로를 웹상에 노출 가능한 형태로 보정
				String fileUrl = webHelper.getUploadUrl(item.getFilePath());
				item.setFileUrl(fileUrl);
				if (i == 0) {
					input.setFile(fileUrl);
				}
			}
		} else {
			input.setFile(file);
		}

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			noticeService.addNotice(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/admin/admin_notice_list.do";
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}

	/** 삭제 처리 */
	@RequestMapping(value = "/admin/admin_notice_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "notino", defaultValue = "0") int notino) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (notino == 0) {
			return webHelper.redirect(null, "게시물 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Notice input = new Notice();
		input.setNotino(notino);

		try {
			noticeService.deleteNotice(input); // 데이터 삭제
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/admin/admin_notice_list.do", "삭제되었습니다.");
	}

	@RequestMapping(value = "/ask/notice", method = RequestMethod.GET)
	public ModelAndView list2(Model model,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 5; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Notice input = new Notice();
		input.setTitle(keyword);

		List<Notice> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = noticeService.getNoticeCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Notice.setOffset(pageData.getOffset());
			Notice.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = noticeService.getNoticeList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("/ask/notice");
	}

	/** 수정 폼 페이지 */
	@RequestMapping(value = "/admin/admin_notice_edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "notino") int notino) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Notice input = new Notice();
		input.setNotino(notino);

		// 수정할 데이터의 원본 조회하기
		Notice output = null;

		try {
			output = noticeService.getNoticeItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		return new ModelAndView("admin/admin_notice_edit");
	}

	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/admin/admin_notice_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView editOk(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "notino") int notino, @RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			try {
				response.sendRedirect(contextPath + "/admin/admin_notice_edit.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		if (!regexHelper.isValue(title)) {
			return webHelper.redirect(null, "제목을 입력하세요.");
		}
		if (!regexHelper.isValue(content)) {
			return webHelper.redirect(null, "내용을 입력하세요.");
		}
		// 수정할 값들을 Beans에 담는다.
		Notice input = new Notice();
		input.setNotino(notino);
		input.setTitle(title);
		input.setContent(content);

		try {
			// 데이터 수정
			noticeService.editNotice(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다.
		String redirectUrl = contextPath + "/admin/admin_notice_list.do";

		return webHelper.redirect(redirectUrl, "수정 되었습니다");
	}

	@RequestMapping(value = "/admin/notice_delete_ok.do")
	public String ajaxTest(HttpServletRequest request) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return "redirect:admin_notice_list.do";
		}

		String[] ajaxMsg = request.getParameterValues("valueArr");

		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			noticeService.deleteNotice(ajaxMsg[i]);
		}

		return "redirect:admin_notice_list.do";
	}

}
