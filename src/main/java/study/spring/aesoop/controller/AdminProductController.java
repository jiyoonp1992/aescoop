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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.aesoop.helper.PageData;
import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.UploadItem;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.model.Category;
import study.spring.aesoop.model.Product;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.CategoryService;
import study.spring.aesoop.service.ProductService;

@Controller
public class AdminProductController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 제품 목록 */
	@RequestMapping(value = "/admin/product", method = RequestMethod.GET)
	public ModelAndView admin_prod_list(Model model, HttpServletRequest request,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "category", defaultValue = "") String category,
			@RequestParam(value = "prod_view", required = false) String prodview,
			@RequestParam(value = "prod_view2", required = false) String prodview2,
			@RequestParam(value = "file", required = false) String file,
			@RequestParam(value = "file2", required = false) String file2,
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
		Product input = new Product();
		input.setCategory(category);
		input.setIs_view(prodview2);

		if (prodview == null) {
			input.setPname(keyword);
		} else if (prodview.equals("pname")) {
			input.setPname(keyword);
		} else if (prodview.equals("prodno")) {
			if (!regexHelper.isNum(keyword)) {
				return webHelper.redirect(null, "상품번호는 숫자만 검색 가능합니다.");
			}
			input.setProdno(Integer.parseInt(keyword));
		}

		List<Product> output = null;
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = productService.getProductCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());

			output = productService.getProductList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("prod_view", prodview);
		model.addAttribute("prod_view2", prodview2);
		model.addAttribute("file", file);
		model.addAttribute("file2", file2);

		return new ModelAndView("admin/admin_prod_list");
	}

	/** 작성 폼 페이지 */
	@RequestMapping(value = "/admin/admin_prod_register.do", method = RequestMethod.GET)
	public ModelAndView admin_prod_register(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 제품 목록 조회하기 */
		// 조회결과를 저장할 객체 선언
		List<Product> output = null;

		try {
			// 데이터 조회 --> 검색조건 없이 모든 제품 조회
			output = productService.getProductList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		List<Category> output2 = null;

		try {
			output2 = categoryService.getCategoryList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// View에 추가
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);

		return new ModelAndView("admin/admin_prod_register");
	}

	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/admin/admin_prod_register_ok.do", method = RequestMethod.POST)
	public ModelAndView admin_prod_register_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "prodno", defaultValue = "0") int prodno,
			@RequestParam(value = "pname", defaultValue = "") String pname,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "price", defaultValue = "0") int price, @RequestParam(value = "size") String size,
			@RequestParam(value = "stock", defaultValue = "0") int stock,
			@RequestParam(value = "skintype", defaultValue = "") String skintype,
			@RequestParam(value = "feels", defaultValue = "") String feels,
			@RequestParam(value = "amount", defaultValue = "") String amount,
			@RequestParam(value = "texture", defaultValue = "") String texture,
			@RequestParam(value = "ingredient", defaultValue = "") String ingredient,
			@RequestParam(value = "scent", defaultValue = "") String scent,
			@RequestParam(value = "directions", defaultValue = "") String directions,
			@RequestParam(value = "is_view", defaultValue = "") String is_view,
			@RequestParam(value = "sub_category", defaultValue = "0") int subcateno,
			@RequestParam(required = false) MultipartFile[] photo) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (!regexHelper.isValue(pname)) {
			return webHelper.redirect(null, "제품 이름을 입력하세요.");
		}
		if (subcateno == 0) {
			return webHelper.redirect(null, "카테고리를 선택해주세요.");
		}

		// 숫자형으로 선언된 파라미터()
		if (price == 0) {
			return webHelper.redirect(null, "제품 가격을 입력하세요.");
		}
		if (price < 0) {
			return webHelper.redirect(null, "제품 가격은 0보다 작을 수 없습니다.");
		}
		if (stock < 0) {
			return webHelper.redirect(null, "재고는 0보다 작을 수 없습니다.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.

		Product input = new Product();
		input.setProdno(prodno);
		input.setPname(pname);
		input.setContent(content);
		input.setPrice(price);
		input.setSize(size);
		input.setStock(stock);
		input.setSkintype(skintype);
		input.setFeels(feels);
		input.setAmount(amount);
		input.setTexture(texture);
		input.setIngredient(ingredient);
		input.setScent(scent);
		input.setDirections(directions);
		input.setIs_view(is_view);
		input.setSubcateno(subcateno);

		if (photo != null) {
			/** 1) 업로드 처리 */
			List<UploadItem> list = null;
			try {
				list = webHelper.saveMultipartFile(photo);
			} catch (NullPointerException e) {
				e.printStackTrace();
				return webHelper.redirect(null, "목록이미지를 입력하세요.");
			} catch (Exception e) {
				e.printStackTrace();
				return webHelper.redirect(null, "목록이미지를 입력하세요.");
			}

			/** 2) 업로드 된 항목 수 만큼 반복을 수행하면서 원본 파일 경로와 썸네일 이미지의 경로를 설정한다. */
			for (int i = 0; i < list.size(); i++) {
				UploadItem item = list.get(i);

				// 원본 파일의 경로를 웹상에 노출 가능한 형태로 보정
				String fileUrl = webHelper.getUploadUrl(item.getFilePath());
				item.setFileUrl(fileUrl);
				if (i == 0) {
					input.setFile(fileUrl);
				} else {
					input.setFile2(fileUrl);
				}
			}
		}

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			productService.addProduct(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/admin/admin_prod_view?prodno=" + input.getProdno();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}

	/** 관리자 제품 상세 */
	@RequestMapping(value = "/admin/admin_prod_view", method = RequestMethod.GET)
	public ModelAndView admin_prod_view(Model model, HttpServletRequest request,
			@RequestParam(value = "prodno", defaultValue = "0") int prodno) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		/** 1) 파라미터 유효성 검사 */
		if (prodno == 0) {
			return webHelper.redirect(null, "제품번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();
		input.setProdno(prodno);

		// 조회결과를 저장할 객체 선언
		Product output = null;

		try {
			// 제품 상세 정보1
			output = productService.getProductItem(input);
			// 제품 상세 정보2
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 2) View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("admin/admin_prod_view");
	}

	/** 제품 수정 */
	@RequestMapping(value = "/admin/admin_prod_edit", method = RequestMethod.POST)
	public ModelAndView admin_prod_edit(Model model, HttpServletRequest request,
			@RequestParam(value = "prodno", defaultValue = "0") int prodno,
			@RequestParam(value = "pname", defaultValue = "") String pname,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "price", defaultValue = "0") int price,
			@RequestParam(value = "size") String size,
			@RequestParam(value = "stock", defaultValue = "0") int stock,
			@RequestParam(value = "skintype", defaultValue = "") String skintype,
			@RequestParam(value = "feels", defaultValue = "") String feels,
			@RequestParam(value = "amount", defaultValue = "") String amount,
			@RequestParam(value = "texture", defaultValue = "") String texture,
			@RequestParam(value = "ingredient", defaultValue = "") String ingredient,
			@RequestParam(value = "scent", defaultValue = "") String scent,
			@RequestParam(value = "directions", defaultValue = "") String directions,
			@RequestParam(value = "is_view", defaultValue = "") String is_view,
			@RequestParam(value = "subcateno", defaultValue = "0") int subcateno) {

		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}
		
		if (!regexHelper.isValue(pname)) {
			return webHelper.redirect(null, "제품 이름을 입력하세요.");
		}
		if (subcateno == 0) {
			return webHelper.redirect(null, "카테고리를 선택해주세요.");
		}
		// 숫자형으로 선언된 파라미터()
		if (price == 0) {
			return webHelper.redirect(null, "제품 가격을 입력하세요.");
		}
		if (price < 0) {
			return webHelper.redirect(null, "제품 가격은 0보다 작을 수 없습니다.");
		}
		if (stock < 0) {
			return webHelper.redirect(null, "재고는 0보다 작을 수 없습니다.");
		}
 
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Product input = new Product();
		input.setProdno(prodno);
		input.setPname(pname);
		input.setContent(content);
		input.setPrice(price);
		input.setSize(size);
		input.setStock(stock);
		input.setSkintype(skintype);
		input.setFeels(feels);
		input.setAmount(amount);
		input.setTexture(texture);
		input.setIngredient(ingredient);
		input.setScent(scent);
		input.setDirections(directions);
		input.setIs_view(is_view);
		input.setSubcateno(subcateno);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			productService.editProduct(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/admin/admin_prod_view?prodno=" + input.getProdno();
		return webHelper.redirect(redirectUrl, "수정되었습니다.");
	}

	/** 제품 삭제 */
	@RequestMapping(value = "/admin/admin_prod_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView admin_prod_delete_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "prodno", defaultValue = "0") int prodno) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}
		
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (prodno == 0) {
			return webHelper.redirect(null, "제품 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();
		input.setProdno(prodno);

		try {
			productService.deleteProduct(input); // 데이터 삭제
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/admin/admin_prod_delete_ok.do", "삭제되었습니다.");
	}

	@RequestMapping(value = "/admin/product_delete_ok.do")
	public ModelAndView ajaxTest(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		User mySession = (User) session.getAttribute("user");

		if (mySession == null) {
			return webHelper.redirect(contextPath + "/admin/login", "로그인해주세요.");
		}

		String[] ajaxMsg = request.getParameterValues("valueArr");

		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			productService.deleteProducts(ajaxMsg[i]);
		}

		return webHelper.redirect(contextPath + "admin/product/", "삭제되었습니다.");
	}
}
