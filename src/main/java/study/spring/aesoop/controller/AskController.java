package study.spring.aesoop.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AskController {
   @RequestMapping(value = "/ask/faqs", method = RequestMethod.GET)
   public String faqs(Model model, HttpServletResponse response) {

      return "ask/faqs";
   }
   
  
   
   @RequestMapping(value = "/ask/pipp", method = RequestMethod.GET)
   public String pipp(Model model, HttpServletResponse response) {

      return "ask/pipp";
   }
   
   @RequestMapping(value = "/ask/qna", method = RequestMethod.GET)
   public String qna(Model model, HttpServletResponse response) {

      return "ask/qna";
   }
   
   @RequestMapping(value = "/ask/tac", method = RequestMethod.GET)
   public String tac(Model model, HttpServletResponse response) {

      return "ask/tac";
   }
   
   
}