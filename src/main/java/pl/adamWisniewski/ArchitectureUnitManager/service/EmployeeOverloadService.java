package pl.adamWisniewski.ArchitectureUnitManager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.adamWisniewski.ArchitectureUnitManager.model.EmployeeOverload;
import pl.adamWisniewski.ArchitectureUnitManager.repository.EmployeeOverloadRepository;

@Service
public class EmployeeOverloadService {

	@Autowired
	private EmployeeOverloadRepository employeeOverloadRepo;

	
	public List<EmployeeOverload> displayEmployeesOverload(){
	     return employeeOverloadRepo.getEmployeesOverload();
	}
		
}
