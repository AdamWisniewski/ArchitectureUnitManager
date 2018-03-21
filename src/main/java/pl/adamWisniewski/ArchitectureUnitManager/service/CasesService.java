package pl.adamWisniewski.ArchitectureUnitManager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;
import pl.adamWisniewski.ArchitectureUnitManager.repository.CasesRepository;

@Service
public class CasesService {

	@Autowired
	private CasesRepository casesRepo;

	public Cases save(Cases cases) {
		return casesRepo.save(cases);
	}

	public Page<Cases> getAll(Pageable pageable) {

		Page<Cases> cases = casesRepo.findAll(pageable);
		return cases;
	}

//	public Cases findByID_sprawa(long ID_sprawa) {
//		return casesRepo.findOne(ID_sprawa);
//	}
//
//	public Cases getFirst() {
//		return casesRepo.findAllByOrderByID_sprawaDesc();
//	}

}
