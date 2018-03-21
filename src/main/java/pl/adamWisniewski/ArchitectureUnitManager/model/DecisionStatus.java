package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "decyzja_status")
public class DecisionStatus {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID_decyzja_status;

	private String status_decyzji;

	public int getID_decyzja_status() {
		return ID_decyzja_status;
	}

	public void setID_decyzja_status(int iD_decyzja_status) {
		ID_decyzja_status = iD_decyzja_status;
	}

	public String getStatus_decyzji() {
		return status_decyzji;
	}

	public void setStatus_decyzji(String status_decyzji) {
		this.status_decyzji = status_decyzji;
	}

	@Override
	public String toString() {
		return "DecisionStatus [ID_decyzja_status=" + ID_decyzja_status + ", status_decyzji=" + status_decyzji + "]";
	}
	
	

}
