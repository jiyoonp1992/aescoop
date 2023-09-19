package study.spring.aesoop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.aesoop.helper.RegexHelper;
import study.spring.aesoop.helper.WebHelper;
import study.spring.aesoop.service.OrderService;


@Controller
public class OrderController {
	
	@Autowired WebHelper webhelper;
	
	@Autowired RegexHelper regexHelper;
	
	@Autowired OrderService orderService;
	
	@Value("#{servletContext.contextPath}") String contextPath;
	
	/** 결제하기 */
	@RequestMapping(value = "/order_ok", method = RequestMethod.POST)
	public ModelAndView orderList(Model model) {
		
		return new ModelAndView("admin/order_list");
	}
}
