package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "pracownicy")
public class Employees {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID_pracownik;

	private String pracownik_imie;

	private String pracownik_nazwisko;

	private int ID_stanowisko;

	public int getID_pracownik() {
		return ID_pracownik;
	}

	public void setID_pracownik(int iD_pracownik) {
		ID_pracownik = iD_pracownik;
	}

	public String getPracownik_imie() {
		return pracownik_imie;
	}

	public void setPracownik_imie(String pracownik_imie) {
		this.pracownik_imie = pracownik_imie;
	}

	public String getPracownik_nazwisko() {
		return pracownik_nazwisko;
	}

	public void setPracownik_nazwisko(String pracownik_nazwisko) {
		this.pracownik_nazwisko = pracownik_nazwisko;
	}

	public int getID_stanowisko() {
		return ID_stanowisko;
	}

	public void setID_stanowisko(int iD_stanowisko) {
		ID_stanowisko = iD_stanowisko;
	}

	@Override
	public String toString() {
		return "Employees [ID_pracownik=" + ID_pracownik + ", pracownik_imie=" + pracownik_imie
				+ ", pracownik_nazwisko=" + pracownik_nazwisko + ", ID_stanowisko=" + ID_stanowisko + "]";
	}

}
