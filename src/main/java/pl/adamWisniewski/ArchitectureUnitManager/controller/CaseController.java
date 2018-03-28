package pl.adamWisniewski.ArchitectureUnitManager.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;
import pl.adamWisniewski.ArchitectureUnitManager.service.CasesService;

@Controller
@RequestMapping("/case")
public class CaseController {

	private CasesService casesService;

	@GetMapping("edit/{id}")
	public String viewCase(@Valid @PathVariable int id, Model model) {

		model.addAttribute("cases", casesService.findCaseById(id));

		return "employee/editCaseEmployee";
	}

	@PostMapping("/save")
	public String article(@Valid @ModelAttribute Cases c, Model model) {
				
		casesService.save(c);
		
		return "employee/casesInProgressEmployee";
			}

}
