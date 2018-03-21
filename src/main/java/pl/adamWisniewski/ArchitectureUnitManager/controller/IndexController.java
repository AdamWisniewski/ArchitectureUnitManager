package pl.adamWisniewski.ArchitectureUnitManager.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;
import pl.adamWisniewski.ArchitectureUnitManager.service.CasesService;

@Controller
public class IndexController {

	private CasesService casesService;

	@GetMapping("/")
	public String index(Model model) {

		return "index";
	}

	@GetMapping("/open")
	public String open(Model model, Pageable pageable) {

//		https://stackoverflow.com/questions/36575698/spring-mvc-how-to-display-data-from-database-into-a-table
		
		Page<Cases> pageCases = casesService.getAll(pageable);
		model.addAttribute("Cases", pageCases);

		return "open";
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
