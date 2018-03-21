package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "password")
public class Password {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID_password;

	private String login;

	private int password;
	
	@ManyToOne
	@JoinColumn(name="ID_permissions")
	private Permissions permissions;

	public int getID_password() {
		return ID_password;
	}

	public void setID_password(int iD_password) {
		ID_password = iD_password;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public Permissions getId_permissions() {
		return permissions;
	}

	@Override
	public String toString() {
		return "Password [ID_password=" + ID_password + ", login=" + login + ", password=" + password
				+ ", id_permissions=" + permissions + "]";
	}

}
