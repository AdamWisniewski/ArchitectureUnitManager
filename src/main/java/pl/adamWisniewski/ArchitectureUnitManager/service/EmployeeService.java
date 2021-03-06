package pl.adamWisniewski.ArchitectureUnitManager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.adamWisniewski.ArchitectureUnitManager.model.Employees;
import pl.adamWisniewski.ArchitectureUnitManager.repository.EmployeeRepository;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepo;

	public Employees findEmployee(String pracownikNazwisko){
	     return employeeRepo.getByPracownikNazwisko(pracownikNazwisko);
	}
	
	public List<Employees> findAll(){
	     return employeeRepo.findAll();
	}
		
}
