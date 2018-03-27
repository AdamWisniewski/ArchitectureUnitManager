package pl.adamWisniewski.ArchitectureUnitManager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.adamWisniewski.ArchitectureUnitManager.model.Employees;
import pl.adamWisniewski.ArchitectureUnitManager.repository.EmployeeRepository;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepo;

//	public int findEmployeeId(String pracownikNazwisko){
//	     Employees tempEmployee = employeeRepo.getByPracownikNazwisko(pracownikNazwisko);
//	     return tempEmployee.getID_pracownik();
//	}
	
	public Employees findEmployee(String pracownikNazwisko){
	     return employeeRepo.getByPracownikNazwisko(pracownikNazwisko);
	}
		
}
