package pl.adamWisniewski.ArchitectureUnitManager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class IndexController {

	@GetMapping("/")
	public String index(Model model) {

		return "index";
	}

	@PostMapping("/employee")
	public String employee(Model model) {

		return "employee";
	}

	@PostMapping("/manager")
	public String manager(Model model) {

		return "manager";
	}

	@PostMapping("/admin")
	public String admin(Model model) {

		return "admin";
	}
}
