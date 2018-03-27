package pl.adamWisniewski.ArchitectureUnitManager.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;

@Repository
public interface CasesRepository extends JpaRepository<Cases, Long> {

	Cases findAllByOrderByIdDesc();
	
	List<Cases> getByDecyzjaNumerIsNull();
	
	List<Cases> getByDecyzjaNumerIsNotNull();
	
	List<Cases> getBySprawaAdres(String adres);
	
	List<Cases> getByEmployees(int employeeId);

}
