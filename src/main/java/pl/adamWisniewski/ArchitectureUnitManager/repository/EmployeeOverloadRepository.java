package pl.adamWisniewski.ArchitectureUnitManager.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pl.adamWisniewski.ArchitectureUnitManager.model.EmployeeOverload;
import pl.adamWisniewski.ArchitectureUnitManager.model.Employees;

@Repository
public interface EmployeeOverloadRepository extends JpaRepository<Employees, Long> {

	
	@Query("SELECT " + 
				"pracownik_imie, " + 
				"pracownik_nazwisko, " + 
				"stanowisko, " + 
				"liczba_prowadzonych_spraw, " + 
				"waga_prowadzonych_spraw " + 
			"FROM " + 
				"pracownicy AS p " + 
				"LEFT JOIN " + 
			"(SELECT " + 
				"ID_pracownik, " + 
				"COUNT(ID_pracownik) AS liczba_prowadzonych_spraw, " + 
				"SUM(sprawa_waga) AS waga_prowadzonych_spraw " + 
			"FROM " + 
				"sprawy " + 
			"WHERE " + 
				"decyzja_numer IS NULL AND ID_sprawa_status != 5 " + 
			"GROUP BY ID_pracownik) AS t ON p.ID_pracownik = t.ID_pracownik " + 
			"NATURAL LEFT JOIN " + 
			"stanowisko AS s " + 
			"ORDER BY ID_stanowisko, pracownik_nazwisko;")
	List<EmployeeOverload> getEmployeesOverload();

}
