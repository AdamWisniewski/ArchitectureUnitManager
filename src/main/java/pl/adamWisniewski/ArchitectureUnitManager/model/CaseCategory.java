package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sprawa_kategoria")
public class CaseCategory {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID_sprawa_kategoria;

	private String kategoria;

	public int getID_sprawa_kategoria() {
		return ID_sprawa_kategoria;
	}

	public void setID_sprawa_kategoria(int iD_sprawa_kategoria) {
		ID_sprawa_kategoria = iD_sprawa_kategoria;
	}

	public String getKategoria() {
		return kategoria;
	}

	public void setKategoria(String kategoria) {
		this.kategoria = kategoria;
	}

	@Override
	public String toString() {
		return "CaseCategory [ID_sprawa_kategoria=" + ID_sprawa_kategoria + ", kategoria=" + kategoria + "]";
	}

}
