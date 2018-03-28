package pl.adamWisniewski.ArchitectureUnitManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.adamWisniewski.ArchitectureUnitManager.model.Password;

@Repository
public interface UserRepository extends JpaRepository<Password, Long> {



}
