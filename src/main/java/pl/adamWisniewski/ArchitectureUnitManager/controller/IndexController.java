package pl.adamWisniewski.ArchitectureUnitManager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/")
	public String index(Model model) {

		return "index";
	}
	
	@GetMapping("/open")
	public String open(Model model) {
		
		return "open";
	}
	
}
