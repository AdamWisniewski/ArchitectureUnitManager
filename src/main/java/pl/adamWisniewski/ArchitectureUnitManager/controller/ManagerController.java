package pl.adamWisniewski.ArchitectureUnitManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.adamWisniewski.ArchitectureUnitManager.model.Employees;
import pl.adamWisniewski.ArchitectureUnitManager.service.EmployeeService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	private EmployeeService empService;

	@Autowired
	public ManagerController(EmployeeService empService) {
		super();
		this.empService = empService;

	}
	
	@GetMapping("/employeesManager")
	public String dispCasesInProgress(Model model) {
		List<Employees> casesList = empService.findAll();
		model.addAttribute("employeeList", casesList);
		return "/manager/employeesManager";
	}
	
	

}
