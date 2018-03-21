package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "sprawy")
public class Cases {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;

	private String sprawa_numer;

	private String sprawa_rok;

	private String data_wniosku;

	private String inwestor_imie;

	private String inwestor_nazwisko;

	private String inwestor_nazwa;

	private String sprawa_adres;

	@ManyToOne
	@JoinColumn(name = "ID_sprawa_kategoria")
	private CaseCategory caseCategory;

	private String sprawa_opis;

	private String sprawa_waga;

	@ManyToOne
	@JoinColumn(name = "ID_sprawa_status")
	private CaseStatus caseStatus;

	private String sprawa_deadline;

	@ManyToOne
	@JoinColumn(name = "ID_pracownik")
	private Employees employees;

	// ustalić dlaczego domyślnie kolumny int nie mogą być null w bazie danych
	
	private String decyzja_numer;

	private String decyzja_rok;

	private String decyzja_data_wydania;

	@ManyToOne
	@JoinColumn(name = "ID_decyzja_rodzaj")
	private DecisionType decisionType;

	@ManyToOne
	@JoinColumn(name = "ID_decyzja_status")
	private DecisionStatus decisionStatus;

	private String komentarz;

	public String getID_sprawa() {
		return id;
	}

	public void setID_sprawa(String iD_sprawa) {
		id = iD_sprawa;
	}

	public String getSprawa_numer() {
		return sprawa_numer;
	}

	public void setSprawa_numer(String sprawa_numer) {
		this.sprawa_numer = sprawa_numer;
	}

	public String getSprawa_rok() {
		return sprawa_rok;
	}

	public void setSprawa_rok(String sprawa_rok) {
		this.sprawa_rok = sprawa_rok;
	}

	public String getData_wniosku() {
		return data_wniosku;
	}

	public void setData_wniosku(String data_wniosku) {
		this.data_wniosku = data_wniosku;
	}

	public String getInwestor_imie() {
		return inwestor_imie;
	}

	public void setInwestor_imie(String inwestor_imie) {
		this.inwestor_imie = inwestor_imie;
	}

	public String getInwestor_nazwisko() {
		return inwestor_nazwisko;
	}

	public void setInwestor_nazwisko(String inwestor_nazwisko) {
		this.inwestor_nazwisko = inwestor_nazwisko;
	}

	public String getInwestor_nazwa() {
		return inwestor_nazwa;
	}

	public void setInwestor_nazwa(String inwestor_nazwa) {
		this.inwestor_nazwa = inwestor_nazwa;
	}

	public String getSprawa_adres() {
		return sprawa_adres;
	}

	public void setSprawa_adres(String sprawa_adres) {
		this.sprawa_adres = sprawa_adres;
	}

	public CaseCategory getID_sprawa_kategoria() {
		return caseCategory;
	}

	public String getSprawa_opis() {
		return sprawa_opis;
	}

	public void setSprawa_opis(String sprawa_opis) {
		this.sprawa_opis = sprawa_opis;
	}

	public String getSprawa_waga() {
		return sprawa_waga;
	}

	public void setSprawa_waga(String sprawa_waga) {
		this.sprawa_waga = sprawa_waga;
	}

	public CaseStatus getID_sprawa_status() {
		return caseStatus;
	}

	public String getSprawa_deadline() {
		return sprawa_deadline;
	}

	public void setSprawa_deadline(String sprawa_deadline) {
		this.sprawa_deadline = sprawa_deadline;
	}

	public Employees getID_pracownik() {
		return employees;
	}

	public String getDecyzja_numer() {
		return decyzja_numer;
	}

	public void setDecyzja_numer(String decyzja_numer) {
		this.decyzja_numer = decyzja_numer;
	}

	public String getDecyzja_rok() {
		return decyzja_rok;
	}

	public void setDecyzja_rok(String decyzja_rok) {
		this.decyzja_rok = decyzja_rok;
	}

	public String getDecyzja_data_wydania() {
		return decyzja_data_wydania;
	}

	public void setDecyzja_data_wydania(String decyzja_data_wydania) {
		this.decyzja_data_wydania = decyzja_data_wydania;
	}

	public DecisionType getID_decyzja_rodzaj() {
		return decisionType;
	}

	public DecisionStatus getID_decyzja_status() {
		return decisionStatus;
	}

	public String getKomentarz() {
		return komentarz;
	}

	public void setKomentarz(String komentarz) {
		this.komentarz = komentarz;
	}

	@Override
	public String toString() {
		return "Cases [ID_sprawa=" + id + ", sprawa_numer=" + sprawa_numer + ", sprawa_rok=" + sprawa_rok
				+ ", data_wniosku=" + data_wniosku + ", inwestor_imie=" + inwestor_imie + ", inwestor_nazwisko="
				+ inwestor_nazwisko + ", inwestor_nazwa=" + inwestor_nazwa + ", sprawa_adres=" + sprawa_adres
				+ ", ID_sprawa_kategoria=" + caseCategory + ", sprawa_opis=" + sprawa_opis + ", sprawa_waga="
				+ sprawa_waga + ", ID_sprawa_status=" + caseStatus + ", sprawa_deadline=" + sprawa_deadline
				+ ", ID_pracownik=" + employees + ", decyzja_numer=" + decyzja_numer + ", decyzja_rok=" + decyzja_rok
				+ ", decyzja_data_wydania=" + decyzja_data_wydania + ", ID_decyzja_rodzaj=" + decisionType
				+ ", ID_decyzja_status=" + decisionStatus + ", komentarz=" + komentarz + "]";
	}

}
