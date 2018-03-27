package pl.adamWisniewski.ArchitectureUnitManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.adamWisniewski.ArchitectureUnitManager.model.Employees;

@Repository
public interface EmployeeRepository extends JpaRepository<Employees, Long> {

	Employees getByPracownikNazwisko(String pracownikNazwisko);

}
