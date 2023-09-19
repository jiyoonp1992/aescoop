package study.spring.aesoop.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.aesoop.model.Product;
import study.spring.aesoop.service.ProductService;


@Controller
public class HomeController {
	
	@Autowired
	ProductService productService;

	
	@RequestMapping(value = {"/","/aesoop"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Product input = new Product();
		input.setSubcateno(11);
		
		Product input2 = new Product();
		input2.setSubcateno(41);
		
		List<Product> output = productService.getProdSlide(input);
		List<Product> output2 = productService.getProdSlide(input2);


		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
		
		return "Index";
	}
	
}
