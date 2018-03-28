package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "permissions")
public class Permissions {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID_permissions;


	private String permissions;

	public int getID_permissions() {
		return ID_permissions;
	}

	public void setID_permissions(int iD_permissions) {
		ID_permissions = iD_permissions;
	}

	public String getPermissions() {
		return permissions;
	}

	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}

	@Override
	public String toString() {
		return "Permissions [ID_permissions=" + ID_permissions + ", permissions=" + permissions + "]";
	}

	

	

	

}
