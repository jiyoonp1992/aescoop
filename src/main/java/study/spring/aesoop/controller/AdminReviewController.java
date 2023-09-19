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
import study.spring.aesoop.model.Notice;
import study.spring.aesoop.model.Review;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.ReviewService;

@Controller
public class AdminReviewController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	ReviewService reviewService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/admin/admin_review_list.do", method = RequestMethod.GET)
	public ModelAndView admin_review_list(Model model, HttpServletRequest request,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "review_view", defaultValue = "") String review_view,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}
		
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;

		Review input = new Review();

		if (review_view.equals("pname")) {
			input.setPname(keyword);
		} else if (review_view.equals("userid")) {
			input.setUserid(keyword);
		} else if (review_view.equals("content")) {
			input.setContent(keyword);
		}

		List<Review> output = null;
		PageData pageData = null;

		try {
			totalCount = reviewService.getReviewCount(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			Review.setOffset(pageData.getOffset());
			Review.setListCount(pageData.getListCount());

			output = reviewService.getAdminReviewList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("admin/admin_review_list");
	}

	

	@RequestMapping(value = "/admin/admin_review_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model, @RequestParam(value = "reviewno", defaultValue = "0") int reviewno
			, HttpServletRequest request) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		if (reviewno == 0) {
			return webHelper.redirect(null, "게시물 번호가 없습니다.");
		}

		Review input = new Review();
		input.setReviewno(reviewno);

		try {
			reviewService.deleteReview(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/admin/admin_review_list.do", "삭제되었습니다.");

	}

	
}
