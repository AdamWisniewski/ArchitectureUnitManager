package pl.adamWisniewski.ArchitectureUnitManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sprawy")
public class Cases {

	// klucz główny
	@Id
	// autoinkrementacja
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID_sprawa;

	private int sprawa_numer;

	private int sprawa_rok;

	private String data_wniosku;

	private String inwestor_imie;

	private String inwestor_nazwisko;

	private String inwestor_nazwa;

	private String sprawa_adres;

	private int ID_sprawa_kategoria;

	private String sprawa_opis;

	private int sprawa_waga;

	private int ID_sprawa_status;

	private String sprawa_deadline;

	private int ID_pracownik;

	private int decyzja_numer;

	private String decyzja_rok;

	private String decyzja_data_wydania;

	private int ID_decyzja_rodzaj;

	private int ID_decyzja_status;

	private String komentarz;

	public int getID_sprawa() {
		return ID_sprawa;
	}

	public void setID_sprawa(int iD_sprawa) {
		ID_sprawa = iD_sprawa;
	}

	public int getSprawa_numer() {
		return sprawa_numer;
	}

	public void setSprawa_numer(int sprawa_numer) {
		this.sprawa_numer = sprawa_numer;
	}

	public int getSprawa_rok() {
		return sprawa_rok;
	}

	public void setSprawa_rok(int sprawa_rok) {
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

	public int getID_sprawa_kategoria() {
		return ID_sprawa_kategoria;
	}

	public void setID_sprawa_kategoria(int iD_sprawa_kategoria) {
		ID_sprawa_kategoria = iD_sprawa_kategoria;
	}

	public String getSprawa_opis() {
		return sprawa_opis;
	}

	public void setSprawa_opis(String sprawa_opis) {
		this.sprawa_opis = sprawa_opis;
	}

	public int getSprawa_waga() {
		return sprawa_waga;
	}

	public void setSprawa_waga(int sprawa_waga) {
		this.sprawa_waga = sprawa_waga;
	}

	public int getID_sprawa_status() {
		return ID_sprawa_status;
	}

	public void setID_sprawa_status(int iD_sprawa_status) {
		ID_sprawa_status = iD_sprawa_status;
	}

	public String getSprawa_deadline() {
		return sprawa_deadline;
	}

	public void setSprawa_deadline(String sprawa_deadline) {
		this.sprawa_deadline = sprawa_deadline;
	}

	public int getID_pracownik() {
		return ID_pracownik;
	}

	public void setID_pracownik(int iD_pracownik) {
		ID_pracownik = iD_pracownik;
	}

	public int getDecyzja_numer() {
		return decyzja_numer;
	}

	public void setDecyzja_numer(int decyzja_numer) {
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

	public int getID_decyzja_rodzaj() {
		return ID_decyzja_rodzaj;
	}

	public void setID_decyzja_rodzaj(int iD_decyzja_rodzaj) {
		ID_decyzja_rodzaj = iD_decyzja_rodzaj;
	}

	public int getID_decyzja_status() {
		return ID_decyzja_status;
	}

	public void setID_decyzja_status(int iD_decyzja_status) {
		ID_decyzja_status = iD_decyzja_status;
	}

	public String getKomentarz() {
		return komentarz;
	}

	public void setKomentarz(String komentarz) {
		this.komentarz = komentarz;
	}

	@Override
	public String toString() {
		return "Cases [ID_sprawa=" + ID_sprawa + ", sprawa_numer=" + sprawa_numer + ", sprawa_rok=" + sprawa_rok
				+ ", data_wniosku=" + data_wniosku + ", inwestor_imie=" + inwestor_imie + ", inwestor_nazwisko="
				+ inwestor_nazwisko + ", inwestor_nazwa=" + inwestor_nazwa + ", sprawa_adres=" + sprawa_adres
				+ ", ID_sprawa_kategoria=" + ID_sprawa_kategoria + ", sprawa_opis=" + sprawa_opis + ", sprawa_waga="
				+ sprawa_waga + ", ID_sprawa_status=" + ID_sprawa_status + ", sprawa_deadline=" + sprawa_deadline
				+ ", ID_pracownik=" + ID_pracownik + ", decyzja_numer=" + decyzja_numer + ", decyzja_rok=" + decyzja_rok
				+ ", decyzja_data_wydania=" + decyzja_data_wydania + ", ID_decyzja_rodzaj=" + ID_decyzja_rodzaj
				+ ", ID_decyzja_status=" + ID_decyzja_status + ", komentarz=" + komentarz + "]";
	}

}
