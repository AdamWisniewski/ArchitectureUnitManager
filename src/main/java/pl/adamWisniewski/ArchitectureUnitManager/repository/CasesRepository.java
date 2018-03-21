package pl.adamWisniewski.ArchitectureUnitManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.adamWisniewski.ArchitectureUnitManager.model.Cases;

@Repository
public interface CasesRepository extends JpaRepository<Cases, Long> {

	Cases findAllByOrderByID_sprawaDesc();

}
