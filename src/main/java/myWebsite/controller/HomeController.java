package myWebsite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/home";
	}
	
	@RequestMapping("/home")
	public String homeRedirect() {
		return "/home/main";
	}
	
	@RequestMapping("/about")
	public String showAbout() {
		return "/home/about";
	}
	
	@RequestMapping("/projects")
	public String showProjects() {
		return "/home/projects";
	}
	
}
