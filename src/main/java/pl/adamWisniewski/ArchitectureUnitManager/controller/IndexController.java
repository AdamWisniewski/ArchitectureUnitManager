package pl.adamWisniewski.ArchitectureUnitManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;
import pl.adamWisniewski.ArchitectureUnitManager.service.CasesService;

@Controller
public class IndexController {
	
	private CasesService casesService;

	@Autowired
	public IndexController(CasesService casesService) {
		this.casesService = casesService;
	}

	@GetMapping("/")
	public String index(Model model) {

		return "index";
	}

	@GetMapping("/open")
	public String open(Model model) {

		return "open";
	}
	
	@GetMapping("/login")
	public String login(Model model) {

		return "login";
	}

	@PostMapping("/employee")
	public String employee(int employeeId, Model model) {
		List<Cases> casesList = casesService.findForEmployee(employeeId);
		model.addAttribute("casesList", casesList);

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
