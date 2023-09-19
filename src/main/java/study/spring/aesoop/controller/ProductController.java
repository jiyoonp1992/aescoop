package study.spring.aesoop.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.aesoop.helper.PageData;
import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.Category;
import study.spring.aesoop.model.Product;
import study.spring.aesoop.model.Review;
import study.spring.aesoop.service.CategoryService;
import study.spring.aesoop.service.ProductService;
import study.spring.aesoop.service.ReviewService;

@Controller
public class ProductController {
	
	@Autowired WebHelper webHelper;
	
	@Autowired RegexHelper regexHelper;
	
	@Autowired ProductService productService;
	
	@Autowired CategoryService categoryService;
	
	@Autowired ReviewService reviewService;
	

	/** 상세 페이지 */
    @RequestMapping(value = "/product_view", method = RequestMethod.GET)
    public ModelAndView view(Model model, HttpServletResponse response, HttpServletRequest request,
            @RequestParam(value="prodno", defaultValue="0") int prodno,
            @RequestParam(value = "file", required = false) String file,
			@RequestParam(value = "file2", required = false) String file2,
            @RequestParam(value="page", defaultValue = "1") int nowPage) {
        
        /** 1) 유효성 검사 */
        // 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (prodno == 0) {
            return webHelper.redirect(null, "제품번호가 없습니다.");
        }

        /** 2) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        Product input = new Product();
        input.setProdno(prodno);
        
        /** 3) 리뷰 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Review input2 = new Review();
		input2.setProdno(prodno);
        
        
        /** 4) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 2;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수
        

        // 조회결과를 저장할 객체 선언
        Product output = null;
        List<Review> output2 = null;
		PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = reviewService.getReviewCountUser(input2);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Review.setOffset(pageData.getOffset());
            Review.setListCount(pageData.getListCount());
            
            output2 = reviewService.getReviewList(input2);
            
            // 데이터 조회
            output = productService.getProductItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        String cookieNo = Integer.toString(prodno);
        
        Cookie cookie = new Cookie("name"+prodno, cookieNo);

        cookie.setMaxAge(60*60);//1시간동안 유지

    	response.addCookie(cookie);
        
        /** 4) View 처리 */
        model.addAttribute("output", output);
        model.addAttribute("output2", output2);
		model.addAttribute("pageData", pageData);
		model.addAttribute("file", file);
        model.addAttribute("file2", file2);
        return new ModelAndView("product/product");
    }
    
    
    /** 검색 리스트 */
    @RequestMapping(value = "/product/product_list", method = RequestMethod.POST)
    public ModelAndView product_list(Model model,
    		@RequestParam(value="prod_search", defaultValue = "") String pname,
    		@RequestParam(value = "cateno", defaultValue = "0") int cateno,
    		@RequestParam(value = "subcateno", defaultValue = "0") int subcateno
    		) {
    	
    	Product input = new Product();
    	input.setPname(pname);
    	input.setCateno(cateno);
    	input.setSubcateno(subcateno);
    	
    	List<Product> output = null;
    	
    	try {
			output = productService.getProductList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	model.addAttribute("output", output);
    	model.addAttribute("cateno", cateno);
    	model.addAttribute("subcateno", subcateno);
    	model.addAttribute("prod_search", pname);
    	
		return new ModelAndView("product/prod_list");
    	
    }
    
    
    /** 유저페이지 제품 목록 */
    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView user_product_list(Model model,
    		@RequestParam(value="cateno", defaultValue = "0") int cateno,
    		@RequestParam(value = "file", required = false) String file,
			@RequestParam(value = "file2", required = false) String file2,
    		@RequestParam(value="subcateno", defaultValue = "0") int subcateno
    		) {
    	
    	Product input = new Product();
    	input.setCateno(cateno);
    	input.setSubcateno(subcateno);
    	
    	List<Product> output = null;
    	
    	
    	Category input2 = new Category();
    	input2.setCateno(cateno);
    	input2.setSubcateno(subcateno);
    	List<Category> output2 = null;
    	
    	try {
			output = productService.getUserProductList(input);
			output2 = categoryService.getUserListCate(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	model.addAttribute("output", output);
    	model.addAttribute("output2", output2);
    	model.addAttribute("cateno", cateno);
    	model.addAttribute("subcateno", subcateno);
    	model.addAttribute("file", file);
		model.addAttribute("file2", file2);
    	
		return new ModelAndView("product/prod_list");
    	
    }
}
