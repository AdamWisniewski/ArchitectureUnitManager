package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sprawa_status")
public class CaseStatus {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID_sprawa_status;

	private String status_sprawy;

	public int getID_sprawa_status() {
		return ID_sprawa_status;
	}

	public void setID_sprawa_status(int iD_sprawa_status) {
		ID_sprawa_status = iD_sprawa_status;
	}

	public String getStatus_sprawy() {
		return status_sprawy;
	}

	public void setStatus_sprawy(String status_sprawy) {
		this.status_sprawy = status_sprawy;
	}

	@Override
	public String toString() {
		return "CaseStatus [ID_sprawa_status=" + ID_sprawa_status + ", status_sprawy=" + status_sprawy + "]";
	}

}
