package pl.adamWisniewski.ArchitectureUnitManager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;
import pl.adamWisniewski.ArchitectureUnitManager.repository.CasesRepository;

@Service
public class CasesService {

	@Autowired
	private CasesRepository casesRepo;

	public List<Cases> findAll(){
	    return casesRepo.findAll();
	}
	
	public List<Cases> findAllInProgress(){
	    return casesRepo.getByDecyzjaNumerIsNull();
	}

//	public Cases findByID_sprawa(long ID_sprawa) {
//		return casesRepo.findOne(ID_sprawa);
//	}
//
//	public Cases getFirst() {
//		return casesRepo.findAllByOrderByID_sprawaDesc();
//	}

}
