package pl.adamWisniewski.ArchitectureUnitManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
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

	@GetMapping("/open/casesInProgress")
	public String dispCasesinProgress(Model model) {
		List<Cases> casesList = casesService.findAllInProgress();
		model.addAttribute("casesList", casesList);
		return "open/casesInProgress";
	}
	
	@GetMapping("/open/casesFinished")
	public String dispCasesFinished(Model model) {
		List<Cases> casesList = casesService.findAllFinished();
		model.addAttribute("casesList", casesList);
		return "open/casesFinished";
	}
	
	@GetMapping("/open/casesOnAdress")
	public String dispCasesOnAdress(@Param("adress") String adress, Model model) {
		List<Cases> casesList = casesService.findByAdress(adress);
		model.addAttribute("casesList", casesList);
		return "open/casesOnAdress";
	}


}
