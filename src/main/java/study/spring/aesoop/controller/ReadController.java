package study.spring.aesoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ReadController {
	
	@RequestMapping(value = "/read/story", method = RequestMethod.GET)
	public String read_story(Model model) {
		return "read/read_story";
	}
	
	@RequestMapping(value = "/read/prod", method = RequestMethod.GET)
	public String read_prod(Model model) {
		return "read/read_prod";
	}
	
	@RequestMapping(value = "/read/design", method = RequestMethod.GET)
	public String read_design(Model model) {
		return "read/read_design";
	}
	
}
