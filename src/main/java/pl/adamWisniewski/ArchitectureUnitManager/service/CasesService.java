package pl.adamWisniewski.ArchitectureUnitManager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;
import pl.adamWisniewski.ArchitectureUnitManager.model.Employees;
import pl.adamWisniewski.ArchitectureUnitManager.repository.CasesRepository;

@Service
public class CasesService {

	@Autowired
	private CasesRepository casesRepo;
	
	public Cases findCaseById(int id){
	    return casesRepo.getById(id);
	}

	public List<Cases> findAllInProgress(){
	    return casesRepo.getByDecyzjaNumerIsNull();
	}
	
	public List<Cases> findAllFinished(){
	    return casesRepo.getByDecyzjaNumerIsNotNull();
	}
	
	public List<Cases> findByAdress(String adres){
	    return casesRepo.getBySprawaAdres(adres);
	}
	
	public List<Cases> findAllInProgressForEmployee(Employees emp){
	    return casesRepo.getByEmployeesAndDecyzjaNumerIsNull(emp);
	}
	
	public List<Cases> findAllFinishedForEmployee(Employees emp){
	    return casesRepo.getByEmployeesAndDecyzjaNumerIsNotNull(emp);
	}
	
	public Cases save(Cases c) {
		return casesRepo.save(c);
	}


}
