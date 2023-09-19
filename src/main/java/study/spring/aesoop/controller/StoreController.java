package study.spring.aesoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreController {

	/** 관리자 상품 목록 */
	@RequestMapping(value = "/search/store_search_list", method = {RequestMethod.GET, RequestMethod.POST})
	public String store_search(Model model) {
		
		return "search/store_search_list";
	}
	
	/** 관리자 상품 수정 / 상세 */
	@RequestMapping(value = "/search/store_search", method = RequestMethod.GET)
	public String store_search_list(Model model) {
		
		return "search/store_search";
	}
}
