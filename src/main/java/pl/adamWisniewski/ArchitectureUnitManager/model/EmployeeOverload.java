package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table
public class EmployeeOverload {

	@Column(name = "pracownik_imie")
	private String pracownikImie;

	@Column(name = "pracownik_nazwisko")
	private String pracownikNazwisko;

	@Column(name = "stanowisko")
	private EmployeePosition employeePosition;

	@Column(name = "liczba_prowadzonych_soraw")
	private EmployeePosition casesInProgress;

	@Column(name = "waga_prowadzonych_soraw")
	private EmployeePosition weightOfcasesInProgres;

	public String getPracownikImie() {
		return pracownikImie;
	}

	public void setPracownikImie(String pracownik_imie) {
		this.pracownikImie = pracownik_imie;
	}

	public String getPracownikNazwisko() {
		return pracownikNazwisko;
	}

	public void setPracownikNazwisko(String pracownikNazwisko) {
		this.pracownikNazwisko = pracownikNazwisko;
	}

	public EmployeePosition getEmployeePosition() {
		return employeePosition;
	}

	public void setEmployeePosition(EmployeePosition employeePosition) {
		this.employeePosition = employeePosition;
	}

	public EmployeePosition getCasesInProgress() {
		return casesInProgress;
	}

	public void setCasesInProgress(EmployeePosition casesInProgress) {
		this.casesInProgress = casesInProgress;
	}

	public EmployeePosition getWeightOfcasesInProgres() {
		return weightOfcasesInProgres;
	}

	public void setWeightOfcasesInProgres(EmployeePosition weightOfcasesInProgres) {
		this.weightOfcasesInProgres = weightOfcasesInProgres;
	}

	@Override
	public String toString() {
		return "EmployeeOverload [pracownik_imie=" + pracownikImie + ", pracownikNazwisko=" + pracownikNazwisko
				+ ", employeePosition=" + employeePosition + ", casesInProgress=" + casesInProgress
				+ ", weightOfcasesInProgres=" + weightOfcasesInProgres + "]";
	}

}
