package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "stanowisko")
public class EmployeePosition {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID_stanowisko;

	private String stanowisko;

	public int getID_stanowisko() {
		return ID_stanowisko;
	}

	public void setID_stanowisko(int iD_stanowisko) {
		ID_stanowisko = iD_stanowisko;
	}

	public String getStanowisko() {
		return stanowisko;
	}

	public void setStanowisko(String stanowisko) {
		this.stanowisko = stanowisko;
	}

	@Override
	public String toString() {
		return "EmployeePosition [ID_stanowisko=" + ID_stanowisko + ", stanowisko=" + stanowisko + "]";
	}

}
