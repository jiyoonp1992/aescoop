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
import study.spring.aesoop.model.Cart;
import study.spring.aesoop.model.Review;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.CartService;
import study.spring.aesoop.service.ReviewService;


@Controller
public class ReviewController {
	/** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    // --> import study.spring.springhelper.service.UserService;
    @Autowired  ReviewService reviewService;
    
    @Autowired  CartService cartService;
    

    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 마이페이지 리뷰페이지 */
	@RequestMapping(value = "/mypage/review", method = RequestMethod.GET)
	public ModelAndView mypage_review(Model model,
			HttpServletRequest request,
			@RequestParam(value = "userno", defaultValue = "0") int userno,
			@RequestParam(value="page", defaultValue = "1") int nowPage) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		/** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 5;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Review input = new Review();
		input.setUserno(userno);
		
		List<Review> output = null;
		PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
            totalCount = reviewService.getMyReviewCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Review.setOffset(pageData.getOffset());
            Review.setListCount(pageData.getListCount());
            
			output=reviewService.getMyReivewList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("userno", userno);
		
		return new ModelAndView("mypage/mypage_review");
	}
	
	/** 리뷰 상세 */
	@RequestMapping(value = "/mypage/review_view", method = RequestMethod.GET)
	public ModelAndView review_view(Model model,
			HttpServletRequest request,
			@RequestParam(value="reviewno", defaultValue = "0") int reviewno,
			@RequestParam(value = "userno", defaultValue = "0") int userno) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		/** 1) 파라미터 유효성 검사 */
		if (reviewno == 0) { return webHelper.redirect(null, "리뷰번호가 없습니다."); }
		
		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Review input = new Review();
		input.setReviewno(reviewno);

		// 조회결과를 저장할 객체 선언
		Review output = null;

		try {
			// 주문 상세 정보
			output = reviewService.getReviewItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 2) View 처리 */
		model.addAttribute("output", output);	
		model.addAttribute("userno", userno);
		return new ModelAndView("mypage/mypage_review_view");
	}
	
	/** 리뷰 수정 */
	@RequestMapping(value = "/mypage/review_edit_ok", method = RequestMethod.POST)
	public ModelAndView review_edit(Model model,
			HttpServletRequest request,
			@RequestParam(value="reviewno", defaultValue="0") int reviewno,
            @RequestParam(value="rate", defaultValue="0") int rate,
            @RequestParam(value="userno", defaultValue="0") int userno,
            @RequestParam(value="content", defaultValue="") String content,
            @RequestParam(value="userid", defaultValue="") String userid) {
        
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		// 문자열
		 if (!regexHelper.isValue(content)) { return webHelper.redirect(null, "내용을 입력하세요."); }
		 
		
        /** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
		Review input = new Review();
        input.setRate(rate);
        input.setReviewno(reviewno);
        input.setContent(content);

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            reviewService.editReview(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.	
		model.addAttribute("userno", userno);
        String redirectUrl = contextPath + "/mypage/review_view?reviewno=" + input.getReviewno();
        return webHelper.redirect(redirectUrl, "수정되었습니다.");
	}
    
    /** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/add_review", method = RequestMethod.GET)
	public ModelAndView add_ok(Model model, HttpServletRequest request,
			@RequestParam(value="prodno", defaultValue="0") int prodno,
			@RequestParam(value="rate", defaultValue="0") int rate,
			@RequestParam(value="content", defaultValue="") String content) {

			
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");
		
		if (mySession == null) {
			return webHelper.redirect(null, "로그인해주세요.");
		}
		
		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터 가 선언되어 있는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (!regexHelper.isValue(content)) { return webHelper.redirect(null, "후기 내용을 입력하세요."); }
		
		// 숫자형으로 선언된 파라미터()
		if (rate == 0) { return webHelper.redirect(null, "별점을 선택해주세요"); }
		if (prodno == 0) { return webHelper.redirect(null, "상품 번호가 없습니다."); }
		
		int userno = mySession.getUserno();
			
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Review input = new Review();
		input.setUserno(userno);
        input.setProdno(prodno);
        input.setRate(rate);
        input.setContent(content);
        
        Cart input2 = new Cart();
		input2.setUserno(userno);
        input2.setProdno(prodno);
        
        int orderCount = 0;
		
        orderCount = cartService.getOrderComplete(input2);
        
        if (orderCount == 0) {
        	return webHelper.redirect(null, "주문완료 후 작성이 가능합니다.");
		}
        
        try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
        	reviewService.addReview(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/product_view?prodno=" + input.getProdno();
		return webHelper.redirect(redirectUrl, "리뷰 작성이 완료되었습니다.");
	}
	
	/** 리뷰 삭제 */
	@RequestMapping(value="/mypage/review_del")
	public ModelAndView del_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value="reviewno", defaultValue="0") int reviewno,
			@RequestParam(value="userno", defaultValue="0") int userno) {
        
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath, "로그인해주세요.");
		}
		
		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		if (reviewno == 0) { return webHelper.redirect(null, "별점을 선택해주세요"); }

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Review input = new Review();
		input.setReviewno(reviewno);
        
        try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
        	reviewService.deleteReview(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/mypage/review?userno=" + userno;
		return webHelper.redirect(redirectUrl, "리뷰 삭제가 완료되었습니다.");
    }
	
}