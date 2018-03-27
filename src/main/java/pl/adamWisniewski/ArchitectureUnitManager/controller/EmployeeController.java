package pl.adamWisniewski.ArchitectureUnitManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;
import pl.adamWisniewski.ArchitectureUnitManager.model.Employees;
import pl.adamWisniewski.ArchitectureUnitManager.service.CasesService;
import pl.adamWisniewski.ArchitectureUnitManager.service.EmployeeService;

@Controller
public class EmployeeController {

	private CasesService casesService;

	private EmployeeService employeeService;

	@Autowired
	public EmployeeController(CasesService casesService, EmployeeService employeeService) {
		this.casesService = casesService;
		this.employeeService = employeeService;
	}

	@GetMapping("/employee/casesInProgress")
	public String dispCasesInProgress(Model model) {
		Employees matchedEmployee = getLoggedEmployee();
		List<Cases> casesList = casesService.findAllInProgressForEmployee(matchedEmployee);
		model.addAttribute("casesList", casesList);
		return "employee/casesInProgress";
	}

	

	@GetMapping("/employee/casesFinished")
	public String dispCasesFinished(Model model) {
		// refactor method like upper one
		List<Cases> casesList = casesService.findAllFinished();
		model.addAttribute("casesList", casesList);
		return "employee/casesFinished";
	}
	
	private Employees getLoggedEmployee() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails) principal).getUsername();
		Employees mathedEmployee = employeeService.findEmployee(username);
		return mathedEmployee;
	}

}
