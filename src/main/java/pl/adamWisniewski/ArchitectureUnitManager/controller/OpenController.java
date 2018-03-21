package pl.adamWisniewski.ArchitectureUnitManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;
import pl.adamWisniewski.ArchitectureUnitManager.service.CasesService;

@Controller
public class OpenController {

	private CasesService casesService;

	@Autowired
	public OpenController(CasesService casesService) {
		this.casesService = casesService;
	}

	@GetMapping("/open")
	public String open(Model model) {
		List<Cases> casesList = casesService.findAll();
		model.addAttribute("casesList", casesList);
		return "open";
	}


	// https://stackoverflow.com/questions/36575698/spring-mvc-how-to-display-data-from-database-into-a-table



}
