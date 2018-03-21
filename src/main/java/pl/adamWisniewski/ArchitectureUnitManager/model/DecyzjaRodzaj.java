package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "decyzja_rodzaj")
public class DecyzjaRodzaj {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID_decyzja_rodzaj;

	private String decyzja_rodzaj;

	public int getID_decyzja_rodzaj() {
		return ID_decyzja_rodzaj;
	}

	public void setID_decyzja_rodzaj(int iD_decyzja_rodzaj) {
		ID_decyzja_rodzaj = iD_decyzja_rodzaj;
	}

	public String getDecyzja_rodzaj() {
		return decyzja_rodzaj;
	}

	public void setDecyzja_rodzaj(String decyzja_rodzaj) {
		this.decyzja_rodzaj = decyzja_rodzaj;
	}

	@Override
	public String toString() {
		return "DecyzjaRodzaj [ID_decyzja_rodzaj=" + ID_decyzja_rodzaj + ", decyzja_rodzaj=" + decyzja_rodzaj + "]";
	}

}
