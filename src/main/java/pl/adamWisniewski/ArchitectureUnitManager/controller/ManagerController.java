package pl.adamWisniewski.ArchitectureUnitManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.adamWisniewski.ArchitectureUnitManager.model.EmployeeOverload;
import pl.adamWisniewski.ArchitectureUnitManager.service.EmployeeOverloadService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	private EmployeeOverloadService empOverloadService;

	@Autowired
	public ManagerController(EmployeeOverloadService empOverloadService) {
		super();
		this.empOverloadService = empOverloadService;

	}
	
	@GetMapping("/overloadManager")
	public String dispCasesInProgress(Model model) {
		List<EmployeeOverload> casesList = empOverloadService.displayEmployeesOverload();
		model.addAttribute("employeeOverloadList", casesList);
		return "/manager/overloadManager";
	}
	
	

}
