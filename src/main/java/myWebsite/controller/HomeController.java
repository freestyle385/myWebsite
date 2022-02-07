package myWebsite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/home/main";
	}
	
	@RequestMapping("/home/main")
	public String homeRedirect() {
		return "/home/main";
	}
}
