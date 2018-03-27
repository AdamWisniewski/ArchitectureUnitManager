package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "pracownicy")
public class Employees {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_pracownik")
	private int IdPracownik;

	private String pracownik_imie;

	@Column(name = "pracownik_nazwisko")
	private String pracownikNazwisko;
	
	@ManyToOne
	@JoinColumn(name="ID_stanowisko")
	private EmployeePosition employeePosition;

	public int getID_pracownik() {
		return IdPracownik;
	}

	public void setID_pracownik(int iD_pracownik) {
		IdPracownik = iD_pracownik;
	}

	public String getPracownik_imie() {
		return pracownik_imie;
	}

	public void setPracownik_imie(String pracownik_imie) {
		this.pracownik_imie = pracownik_imie;
	}

	public String getPracownik_nazwisko() {
		return pracownikNazwisko;
	}

	public void setPracownik_nazwisko(String pracownik_nazwisko) {
		this.pracownikNazwisko = pracownik_nazwisko;
	}

	public EmployeePosition getID_stanowisko() {
		return employeePosition;
	}

	@Override
	public String toString() {
		return "Employees [IdPracownik=" + IdPracownik + ", pracownik_imie=" + pracownik_imie + ", pracownikNazwisko="
				+ pracownikNazwisko + ", employeePosition=" + employeePosition + "]";
	}

	

}
