-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Wydzial_Architektury_BETA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Wydzial_Architektury_BETA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Wydzial_Architektury_BETA` DEFAULT CHARACTER SET utf8 ;
USE `Wydzial_Architektury_BETA` ;

-- -----------------------------------------------------
-- Table `Wydzial_Architektury_BETA`.`stanowisko`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`stanowisko` (
  `ID_stanowisko` INT NOT NULL,
  `stanowisko` VARCHAR(30) NULL,
  PRIMARY KEY (`ID_stanowisko`),
  UNIQUE INDEX `ID_stanowisko_UNIQUE` (`ID_stanowisko` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Wydzial_Architektury_BETA`.`pracownicy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`pracownicy` (
  `ID_pracownik` INT NOT NULL AUTO_INCREMENT,
  `pracownik_imie` VARCHAR(30) NOT NULL,
  `pracownik_nazwisko` VARCHAR(30) NOT NULL,
  `ID_stanowisko` INT NOT NULL,
  PRIMARY KEY (`ID_pracownik`),
  INDEX `fk_pracownicy_stanowisko1_idx` (`ID_stanowisko` ASC),
  UNIQUE INDEX `ID_pracownik_UNIQUE` (`ID_pracownik` ASC),
  CONSTRAINT `fk_pracownicy_stanowisko1`
    FOREIGN KEY (`ID_stanowisko`)
    REFERENCES `Wydzial_Architektury_BETA`.`stanowisko` (`ID_stanowisko`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Wydzial_Architektury_BETA`.`sprawa_kategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`sprawa_kategoria` (
  `ID_sprawa_kategoria` INT NOT NULL,
  `kategoria` VARCHAR(400) NULL,
  PRIMARY KEY (`ID_sprawa_kategoria`),
  UNIQUE INDEX `ID_sprawa_kategoria_UNIQUE` (`ID_sprawa_kategoria` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Wydzial_Architektury_BETA`.`sprawa_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`sprawa_status` (
  `ID_sprawa_status` INT NOT NULL,
  `status_sprawy` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_sprawa_status`),
  UNIQUE INDEX `ID_sprawa_status_UNIQUE` (`ID_sprawa_status` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Wydzial_Architektury_BETA`.`decyzja_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`decyzja_status` (
  `ID_decyzja_status` INT NOT NULL,
  `status_decyzji` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_decyzja_status`),
  UNIQUE INDEX `ID_decyzja_status_UNIQUE` (`ID_decyzja_status` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Wydzial_Architektury_BETA`.`decyzja_rodzaj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`decyzja_rodzaj` (
  `ID_decyzja_rodzaj` INT NOT NULL,
  `decyzja_rodzaj` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_decyzja_rodzaj`),
  UNIQUE INDEX `ID_decyzja_rodzaj_UNIQUE` (`ID_decyzja_rodzaj` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Wydzial_Architektury_BETA`.`sprawy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`sprawy` (
  `ID_sprawa` INT NOT NULL AUTO_INCREMENT,
  `sprawa_numer` INT NULL,
  `sprawa_rok` INT NULL,
  `data_wniosku` DATE NULL,
  `inwestor_imie` VARCHAR(45) NULL,
  `inwestor_nazwisko` VARCHAR(45) NULL,
  `inwestor_nazwa` VARCHAR(45) NULL,
  `sprawa_adres` VARCHAR(45) NULL,
  `ID_sprawa_kategoria` INT NULL,
  `sprawa_opis` VARCHAR(150) NULL,
  `sprawa_waga` INT NULL COMMENT 'wartości z zakresu np 1-5 z default na 1 - pozwala kontrolować obciążenie pracownika sprawami',
  `ID_sprawa_status` INT NULL,
  `sprawa_deadline` DATE NULL,
  `ID_pracownik` INT NULL,
  `decyzja_numer` INT NULL,
  `decyzja_rok` VARCHAR(45) NULL,
  `decyzja_data_wydania` DATE NULL,
  `ID_decyzja_rodzaj` INT NULL,
  `ID_decyzja_status` INT NULL,
  `komentarz` VARCHAR(200) NULL,
  PRIMARY KEY (`ID_sprawa`),
  INDEX `fk_sprawy_pracownicy1_idx` (`ID_pracownik` ASC),
  INDEX `fk_sprawa_kategoria_idx` (`ID_sprawa_kategoria` ASC),
  INDEX `fk_sprawa_status_idx` (`ID_sprawa_status` ASC),
  INDEX `fk_decyzja_status_idx` (`ID_decyzja_status` ASC),
  INDEX `fk_decyzja_rodzaj_idx` (`ID_decyzja_rodzaj` ASC),
  UNIQUE INDEX `ID_sprawa_UNIQUE` (`ID_sprawa` ASC),
  CONSTRAINT `fk_sprawy_pracownicy1`
    FOREIGN KEY (`ID_pracownik`)
    REFERENCES `Wydzial_Architektury_BETA`.`pracownicy` (`ID_pracownik`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sprawa_kategoria`
    FOREIGN KEY (`ID_sprawa_kategoria`)
    REFERENCES `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sprawa_status`
    FOREIGN KEY (`ID_sprawa_status`)
    REFERENCES `Wydzial_Architektury_BETA`.`sprawa_status` (`ID_sprawa_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_decyzja_status`
    FOREIGN KEY (`ID_decyzja_status`)
    REFERENCES `Wydzial_Architektury_BETA`.`decyzja_status` (`ID_decyzja_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_decyzja_rodzaj`
    FOREIGN KEY (`ID_decyzja_rodzaj`)
    REFERENCES `Wydzial_Architektury_BETA`.`decyzja_rodzaj` (`ID_decyzja_rodzaj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Wydzial_Architektury_BETA`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`permissions` (
  `ID_permissions` INT NOT NULL,
  `permissions` VARCHAR(15) NULL,
  PRIMARY KEY (`ID_permissions`),
  UNIQUE INDEX `ID_UNIQUE` (`ID_permissions` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Wydzial_Architektury_BETA`.`password`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`password` (
  `ID_password` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(25) NULL,
  `password` VARCHAR(45) NULL,
  `id_permissions` INT NULL,
  PRIMARY KEY (`ID_password`),
  INDEX `fk_password_permissions1_idx` (`id_permissions` ASC),
  CONSTRAINT `fk_password_permissions1`
    FOREIGN KEY (`id_permissions`)
    REFERENCES `Wydzial_Architektury_BETA`.`permissions` (`ID_permissions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Wydzial_Architektury_BETA` ;

-- -----------------------------------------------------
-- Placeholder table for view `Wydzial_Architektury_BETA`.`employee_overload`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`employee_overload` (`pracownik_imie` INT, `pracownik_nazwisko` INT, `stanowisko` INT, `liczba_prowadzonych_spraw` INT, `waga_prowadzonych_spraw` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Wydzial_Architektury_BETA`.`allProceduresInProgress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`allProceduresInProgress` (`ID_sprawa` INT, `sprawa_numer` INT, `sprawa_rok` INT, `data_wniosku` INT, `inwestor_imie` INT, `inwestor_nazwisko` INT, `inwestor_nazwa` INT, `sprawa_adres` INT, `ID_sprawa_kategoria` INT, `sprawa_opis` INT, `sprawa_waga` INT, `ID_sprawa_status` INT, `sprawa_deadline` INT, `ID_pracownik` INT, `decyzja_numer` INT, `decyzja_rok` INT, `decyzja_data_wydania` INT, `ID_decyzja_rodzaj` INT, `ID_decyzja_status` INT, `komentarz` INT, `pracownik_nazwisko` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Wydzial_Architektury_BETA`.`allProceduresFinished`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`allProceduresFinished` (`ID_sprawa` INT, `sprawa_numer` INT, `sprawa_rok` INT, `data_wniosku` INT, `inwestor_imie` INT, `inwestor_nazwisko` INT, `inwestor_nazwa` INT, `sprawa_adres` INT, `ID_sprawa_kategoria` INT, `sprawa_opis` INT, `sprawa_waga` INT, `ID_sprawa_status` INT, `sprawa_deadline` INT, `ID_pracownik` INT, `decyzja_numer` INT, `decyzja_rok` INT, `decyzja_data_wydania` INT, `ID_decyzja_rodzaj` INT, `ID_decyzja_status` INT, `komentarz` INT, `pracownik_nazwisko` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Wydzial_Architektury_BETA`.`allEmployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`allEmployee` (`ID_pracownik` INT, `pracownik_imie` INT, `pracownik_nazwisko` INT, `stanowisko` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Wydzial_Architektury_BETA`.`allProcedures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`allProcedures` (`ID_sprawa` INT, `sprawa_numer` INT, `sprawa_rok` INT, `data_wniosku` INT, `inwestor_imie` INT, `inwestor_nazwisko` INT, `inwestor_nazwa` INT, `sprawa_adres` INT, `ID_sprawa_kategoria` INT, `sprawa_opis` INT, `sprawa_waga` INT, `ID_sprawa_status` INT, `sprawa_deadline` INT, `ID_pracownik` INT, `decyzja_numer` INT, `decyzja_rok` INT, `decyzja_data_wydania` INT, `ID_decyzja_rodzaj` INT, `ID_decyzja_status` INT, `komentarz` INT, `pracownik_nazwisko` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Wydzial_Architektury_BETA`.`allUsers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Wydzial_Architektury_BETA`.`allUsers` (`ID_password` INT, `login` INT, `permissions` INT);

-- -----------------------------------------------------
-- View `Wydzial_Architektury_BETA`.`employee_overload`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wydzial_Architektury_BETA`.`employee_overload`;
USE `Wydzial_Architektury_BETA`;
create  OR REPLACE view employee_overload as
SELECT 
        pracownik_imie,
        pracownik_nazwisko,
        stanowisko,
        liczba_prowadzonych_spraw,
        waga_prowadzonych_spraw
    FROM
        pracownicy AS p
             LEFT JOIN
        (SELECT 
            ID_pracownik,
			COUNT(ID_pracownik) AS liczba_prowadzonych_spraw,
            SUM(sprawa_waga) AS waga_prowadzonych_spraw
        FROM
            sprawy
        WHERE
            decyzja_numer IS NULL AND ID_sprawa_status != 5
        GROUP BY ID_pracownik) AS t ON p.ID_pracownik = t.ID_pracownik
			NATURAL LEFT JOIN
		stanowisko AS s 
        ORDER BY ID_stanowisko, pracownik_nazwisko;

-- -----------------------------------------------------
-- View `Wydzial_Architektury_BETA`.`allProceduresInProgress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wydzial_Architektury_BETA`.`allProceduresInProgress`;
USE `Wydzial_Architektury_BETA`;
CREATE  OR REPLACE VIEW `allProceduresInProgress` AS
    SELECT 
        sprawy.*, pracownicy.pracownik_nazwisko
    FROM
        sprawy
            LEFT JOIN
        pracownicy ON sprawy.ID_pracownik = pracownicy.ID_pracownik
    WHERE
        decyzja_numer IS NULL
    ORDER BY ID_sprawa;

-- -----------------------------------------------------
-- View `Wydzial_Architektury_BETA`.`allProceduresFinished`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wydzial_Architektury_BETA`.`allProceduresFinished`;
USE `Wydzial_Architektury_BETA`;
CREATE  OR REPLACE VIEW `allProceduresFinished` AS
   SELECT 
        sprawy.*, pracownicy.pracownik_nazwisko
    FROM
        sprawy
            LEFT JOIN
        pracownicy ON sprawy.ID_pracownik = pracownicy.ID_pracownik
    WHERE
        decyzja_numer IS NOT NULL
    ORDER BY ID_sprawa;

-- -----------------------------------------------------
-- View `Wydzial_Architektury_BETA`.`allEmployee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wydzial_Architektury_BETA`.`allEmployee`;
USE `Wydzial_Architektury_BETA`;
create  OR REPLACE view allEmployee as
SELECT 
        ID_pracownik,
        pracownik_imie,
        pracownik_nazwisko,
        stanowisko
    FROM
        pracownicy AS p
			NATURAL LEFT JOIN
		stanowisko AS s 
        ORDER BY ID_pracownik;

-- -----------------------------------------------------
-- View `Wydzial_Architektury_BETA`.`allProcedures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wydzial_Architektury_BETA`.`allProcedures`;
USE `Wydzial_Architektury_BETA`;
CREATE  OR REPLACE VIEW `allProcedures` AS
   SELECT 
        sprawy.*, pracownicy.pracownik_nazwisko
    FROM
        sprawy
            LEFT JOIN
        pracownicy ON sprawy.ID_pracownik = pracownicy.ID_pracownik
    ORDER BY ID_sprawa;

-- -----------------------------------------------------
-- View `Wydzial_Architektury_BETA`.`allUsers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wydzial_Architektury_BETA`.`allUsers`;
USE `Wydzial_Architektury_BETA`;
CREATE  OR REPLACE VIEW allUsers AS
SELECT 
        ID_password,
        login,
        permissions
    FROM
        password AS p
			NATURAL LEFT JOIN
		permissions AS s 
        ORDER BY login;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Wydzial_Architektury_BETA`.`stanowisko`
-- -----------------------------------------------------
START TRANSACTION;
USE `Wydzial_Architektury_BETA`;
INSERT INTO `Wydzial_Architektury_BETA`.`stanowisko` (`ID_stanowisko`, `stanowisko`) VALUES (1, 'Młodszy Referent');
INSERT INTO `Wydzial_Architektury_BETA`.`stanowisko` (`ID_stanowisko`, `stanowisko`) VALUES (2, 'Referent');
INSERT INTO `Wydzial_Architektury_BETA`.`stanowisko` (`ID_stanowisko`, `stanowisko`) VALUES (3, 'Specjalista');
INSERT INTO `Wydzial_Architektury_BETA`.`stanowisko` (`ID_stanowisko`, `stanowisko`) VALUES (4, 'Podinspektor');
INSERT INTO `Wydzial_Architektury_BETA`.`stanowisko` (`ID_stanowisko`, `stanowisko`) VALUES (5, 'Inspektor');
INSERT INTO `Wydzial_Architektury_BETA`.`stanowisko` (`ID_stanowisko`, `stanowisko`) VALUES (6, 'Główny Specjalista');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Wydzial_Architektury_BETA`.`pracownicy`
-- -----------------------------------------------------
START TRANSACTION;
USE `Wydzial_Architektury_BETA`;
INSERT INTO `Wydzial_Architektury_BETA`.`pracownicy` (`ID_pracownik`, `pracownik_imie`, `pracownik_nazwisko`, `ID_stanowisko`) VALUES (1, 'Adam', 'Kowalski', 6);
INSERT INTO `Wydzial_Architektury_BETA`.`pracownicy` (`ID_pracownik`, `pracownik_imie`, `pracownik_nazwisko`, `ID_stanowisko`) VALUES (2, 'Malwina', 'Jankowiak', 5);
INSERT INTO `Wydzial_Architektury_BETA`.`pracownicy` (`ID_pracownik`, `pracownik_imie`, `pracownik_nazwisko`, `ID_stanowisko`) VALUES (3, 'Teresa', 'Iksińska', 2);
INSERT INTO `Wydzial_Architektury_BETA`.`pracownicy` (`ID_pracownik`, `pracownik_imie`, `pracownik_nazwisko`, `ID_stanowisko`) VALUES (4, 'Eliza', 'Żmuda', 5);
INSERT INTO `Wydzial_Architektury_BETA`.`pracownicy` (`ID_pracownik`, `pracownik_imie`, `pracownik_nazwisko`, `ID_stanowisko`) VALUES (5, 'Jarosław', 'Tomasiuk', 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Wydzial_Architektury_BETA`.`sprawa_kategoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `Wydzial_Architektury_BETA`;
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (1, 'budynki mieszkalne jednorodzinne');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (2, 'budynki służące gospodarce rolnej, jak: produkcyjne, gospodarcze, inwentarsko-składowe');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (3, 'inne niewielkie budynki, jak: domy letniskowe, budynki gospodarcze, garaże do dwóch stanowisk włącznie');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (4, 'elementy dróg publicznych i kolejowych dróg szynowych, jak: skrzyżowania i węzły, wjazdy, zjazdy, przejazdy, perony, rampy');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (5, 'obiekty sportu i rekreacji, jak: stadiony, amfiteatry, skocznie i wyciągi narciarskie, kolejki linowe, odkryte baseny, zjeżdżalnie');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (6, 'cmentarze');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (7, 'obiekty służące nawigacji wodnej, jak: dalby, wysepki cumownicze');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (8, 'inne budowle');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (9, 'budynki kultury, nauki i oświaty, jak: teatry, opery, kina, muzea, galerie sztuki, biblioteki, archiwa, domy kultury, budynki szkolne i przedszkolne, żłobki, kluby dziecięce, internaty, bursy i domy studenckie, laboratoria i placówki badawcze, stacje meteorologiczne i hydrologiczne, obserwatoria, budynki ogrodów zoologicznych i botanicznych');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (10, 'budynki kultu religijnego, jak: kościoły, kaplice, klasztory, cerkwie, zbory, synagogi, meczety oraz domy pogrzebowe, krematoria');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (11, 'budynki służby zdrowia, opieki społecznej i socjalnej, jak: szpitale, sanatoria, hospicja, przychodnie, poradnie, stacje krwiodawstwa, lecznice weterynaryjne, domy pomocy i opieki społecznej, domy dziecka, domy rencisty, schroniska dla bezdomnych oraz hotele robotnicze');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (12, 'budynki administracji publicznej, budynki Sejmu, Senatu, Kancelarii Prezydenta, ministerstw i urzędów centralnych, terenowej administracji rządowej i samorządowej, sądów i trybunałów, więzień i domów poprawczych, zakładów dla nieletnich, zakładów karnych, aresztów śledczych oraz obiekty budowlane Sił Zbrojnych');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (13, 'pozostałe budynki mieszkalne');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (14, 'budynki zakwaterowania turystycznego i rekreacyjnego, jak: hotele, motele, pensjonaty, domy wypoczynkowe, schroniska turystyczne');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (15, 'budynki sportu i rekreacji, jak: hale sportowe i widowiskowe, kryte baseny');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (16, 'budynki biurowe i konferencyjne');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (17, 'budynki handlu, gastronomii i usług, jak: sklepy, centra handlowe, domy towarowe, hale targowe, restauracje, bary, kasyna, dyskoteki, warsztaty rzemieślnicze, stacje obsługi pojazdów, myjnie samochodowe, garaże powyżej dwóch stanowisk, budynki dworcowe');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (18, 'budynki przemysłowe, jak: budynki produkcyjne, służące energetyce, montownie, wytwórnie, rzeźnie oraz obiekty magazynowe, jak: budynki składowe, chłodnie, hangary, wiaty, a także budynki kolejowe, jak: nastawnie, podstacje trakcyjne, lokomotywownie, wagonownie, strażnice przejazdowe, myjnie taboru kolejowego');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (19, 'zbiorniki przemysłowe, jak: silosy, elewatory, bunkry do magazynowania paliw i gazów oraz innych produktów chemicznych');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (20, 'stacje paliw');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (21, 'obiekty związane z transportem wodnym, jak: porty, przystanie, sztuczne wyspy, baseny, doki, falochrony, nabrzeża, mola, pirsy, pomosty, pochylnie');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (22, 'place składowe, postojowe, składowiska odpadów, parkingi');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (23, 'obiekty lotniskowe, jak: pasy startowe, drogi kołowania, płyty lotniskowe, place postojowe i manewrowe, lądowiska');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (24, 'obiekty gospodarki wodnej, jak: zbiorniki wodne i nadpoziomowe, stawy rybne');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (25, 'drogi i kolejowe drogi szynowe');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (26, 'sieci, jak: elektroenergetyczne, telekomunikacyjne, gazowe, ciepłownicze, wodociągowe, kanalizacyjne oraz rurociągi przesyłowe');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (27, 'budowle hydrotechniczne piętrzące, upustowe i regulacyjne, jak: zapory, progi i stopnie wodne, jazy, bramy przeciwpowodziowe, śluzy wałowe, syfony, wały przeciwpowodziowe, kanały, śluzy żeglowne, opaski i ostrogi brzegowe, rowy melioracyjne');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (28, 'drogowe i kolejowe obiekty mostowe, jak: mosty, estakady, kładki, przejścia podziemne, wiadukty, przepusty, tunele');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (29, 'wolno stojące kominy i maszty oraz elektrownie wiatrowe');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_kategoria` (`ID_sprawa_kategoria`, `kategoria`) VALUES (30, 'obiekty służące do korzystania z zasobów wodnych, jak: ujęcia wód morskich i śródlądowych, budowle zrzutów wód i ścieków, pompownie, stacje strefowe, stacje uzdatniania wody, oczyszczalnie ścieków');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Wydzial_Architektury_BETA`.`sprawa_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `Wydzial_Architektury_BETA`;
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_status` (`ID_sprawa_status`, `status_sprawy`) VALUES (1, 'przekazano zgodnie z właściwością');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_status` (`ID_sprawa_status`, `status_sprawy`) VALUES (2, 'przed wszczęciem');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_status` (`ID_sprawa_status`, `status_sprawy`) VALUES (3, 'po wszczęciu');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_status` (`ID_sprawa_status`, `status_sprawy`) VALUES (4, 'wezwanie do uzupełnienia');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_status` (`ID_sprawa_status`, `status_sprawy`) VALUES (5, 'zawieszenie');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_status` (`ID_sprawa_status`, `status_sprawy`) VALUES (6, 'zawiadomienie o zgr. materiale');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_status` (`ID_sprawa_status`, `status_sprawy`) VALUES (7, 'zakończono');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawa_status` (`ID_sprawa_status`, `status_sprawy`) VALUES (8, 'wycofano');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Wydzial_Architektury_BETA`.`decyzja_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `Wydzial_Architektury_BETA`;
INSERT INTO `Wydzial_Architektury_BETA`.`decyzja_status` (`ID_decyzja_status`, `status_decyzji`) VALUES (1, 'nieprawomocna');
INSERT INTO `Wydzial_Architektury_BETA`.`decyzja_status` (`ID_decyzja_status`, `status_decyzji`) VALUES (2, 'prawomocna');
INSERT INTO `Wydzial_Architektury_BETA`.`decyzja_status` (`ID_decyzja_status`, `status_decyzji`) VALUES (3, 'uchylona');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Wydzial_Architektury_BETA`.`decyzja_rodzaj`
-- -----------------------------------------------------
START TRANSACTION;
USE `Wydzial_Architektury_BETA`;
INSERT INTO `Wydzial_Architektury_BETA`.`decyzja_rodzaj` (`ID_decyzja_rodzaj`, `decyzja_rodzaj`) VALUES (1, 'pozytywna');
INSERT INTO `Wydzial_Architektury_BETA`.`decyzja_rodzaj` (`ID_decyzja_rodzaj`, `decyzja_rodzaj`) VALUES (2, 'negatywna');
INSERT INTO `Wydzial_Architektury_BETA`.`decyzja_rodzaj` (`ID_decyzja_rodzaj`, `decyzja_rodzaj`) VALUES (3, 'umarzająca');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Wydzial_Architektury_BETA`.`sprawy`
-- -----------------------------------------------------
START TRANSACTION;
USE `Wydzial_Architektury_BETA`;
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (1, 1, 2016, '15.01.2016', 'Jan', 'Nowak', NULL, 'Mołdawska 45', 8, 'rozbiórka bud mieszk. i garażu', 5, 7, '15.01.2016', 3, 1, '2016', '24.02.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (2, 2, 2016, '21.01.2016', 'Andrzej', 'Kowalski', NULL, 'Pawińskiego 3', 8, 'rozbiórka bud. warsztatowego', 1, 7, '21.01.2016', 4, 2, '2016', '1.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (3, 3, 2016, '19.01.2016', 'Piotr', 'Wiśniewski', '', 'Włodarzewska 15', 7, 'rozbudowa bud mieszk', 3, 7, '19.01.2016', 2, 3, '2016', '28.02.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (4, 4, 2016, '27.01.2016', 'Krzysztof', 'Dąbrowski', '', 'Banacha 1a', 29, 'przebudowa Hepatologii', 4, 7, '27.01.2016', 5, 4, '2016', '7.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (5, 5, 2016, '27.01.2016', NULL, NULL, 'ABUD Sp z o.o.', 'Majewskiego 12', 5, 'docieplenie bud. wielorodz.', 5, 7, '27.01.2016', 1, 5, '2016', '7.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (6, 6, 2016, '27.01.2016', NULL, NULL, '„Słoneczna” Spółdzielnia Mieszkaniowa', 'Opaczewska 36', 16, 'docieplenie bud. wielorodz.', 5, 7, '27.01.2016', 3, 6, '2016', '7.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (7, 7, 2016, '21.01.2016', 'Paweł', 'Kamiński', '', 'Pasteura 5A', 22, 'wyłącznik p. poż + kabel', 1, 7, '21.01.2016', 4, 7, '2016', '1.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (8, 8, 2016, '22.01.2016', 'Józef', 'Kowalczyk', '', 'Sękocińska 13', 4, 'wzmocnienie stropu i ścian', 1, 7, '22.01.2016', 3, 8, '2016', '2.03.2016', 3, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (9, 9, 2016, '10.02.2016', 'Marcin', 'Zieliński', '', 'Włodarzewska', 6, 'ZRID na przebud i odwodnienie', 4, 7, '10.02.2016', 5, 9, '2016', '21.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (10, 10, 2016, '1.02.2016', 'Marek', 'Szymański', '', 'Banacha 1a', 13, 'przebudowa pralni', 3, 7, '1.02.2016', 1, 10, '2016', '12.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (11, 11, 2016, '1.02.2016', '', '', 'AS Invest Sp. z o.o.', 'Pruszkowska 29', 6, 'przebudowa lokalu usługowego', 3, 7, '1.02.2016', 5, 11, '2016', '12.03.2016', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (12, 12, 2016, '1.02.2016', 'Grzegorz', 'Kozłowski', '', 'Pawińskiego 18', 2, 'podział lokalu na dwa', 4, 7, '1.02.2016', 4, 12, '2016', '12.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (13, 13, 2016, '1.02.2016', 'Jerzy', 'Jankowski', '', 'Żwirki i Wigury', 9, 'rozbudowa sieci SN', 5, 7, '1.02.2016', 4, 13, '2016', '12.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (14, 14, 2016, '1.02.2016', 'Tadeusz', 'Wojciechowski', '', 'Grzeszczyka 6', 8, 'remont i docieplenie dachu', 2, 7, '1.02.2016', 3, 14, '2016', '12.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (15, 15, 2016, '21.01.2016', 'Adam', 'Kwiatkowski', '', 'Banacha 1a', 24, 'przebudowa i adaptacja OIT', 3, 7, '21.01.2016', 5, 15, '2016', '1.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (16, 16, 2016, '29.01.2016', 'Łukasz', 'Kaczmarek', '', 'Pawińskiego', 19, 'budowa zjazdu p.poż', 3, 7, '29.01.2016', 4, 16, '2016', '9.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (17, 17, 2016, '23.02.2016', 'Zbigniew', 'Mazur', '', 'Pruszkowska 29', 4, 'PROJEKT ZAMIENNY', 3, 7, '23.02.2016', 2, 17, '2016', '3.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (18, 18, 2016, '23.02.2016', 'Ryszard', 'Krawczyk', '', 'Białobrzeska 53', 14, 'bud. mieszk. wielorodz', 2, 7, '23.02.2016', 1, 18, '2016', '3.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (19, 19, 2016, '17.02.2016', 'Dariusz', 'Piotrowski', '', 'Włodarzewska', 26, 'ZRID na przebud i odwodnienie', 3, 7, '17.02.2016', 2, 19, '2016', '28.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (20, 20, 2016, '11.02.2016', 'Henryk', 'Grabowski', '', 'Białobrzeska 53', 10, 'bud. mieszk. wielorodz', 5, 7, '11.02.2016', 5, 20, '2016', '22.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (21, 21, 2016, '8.02.2016', '', '', '„Słoneczna” Spółdzielnia Mieszkaniowa', 'Korotyńskiego 20', 7, 'docieplenie bud. wielorodz.', 1, 7, '8.02.2016', 4, 21, '2016', '19.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (22, 22, 2016, '27.01.2016', '', '', '„Słoneczna” Spółdzielnia Mieszkaniowa', 'Mołdawska 13', 26, 'docieplenie bud. wielorodz.', 5, 7, '27.01.2016', 4, 22, '2016', '7.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (23, 23, 2016, '23.02.2016', 'Wojciech', 'Michalski', '', 'Pruszkowska 4A', 7, 'docieplenie bud. wielorodz.', 1, 7, '23.02.2016', 3, 23, '2016', '3.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (24, 24, 2016, '22.01.2016', 'Robert', 'Nowicki', '', 'Żwirki i Wigury 43', 23, 'docieplenie bud. wielorodz.', 5, 7, '22.01.2016', 3, 24, '2016', '2.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (25, 25, 2016, '11.03.2016', 'Mateusz', 'Adamczyk', '', 'Sanocka 1/3', 14, 'docieplenie stropodachu ', 5, 7, '11.03.2016', 4, 25, '2016', '20.04.2016', 3, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (26, 26, 2016, '16.03.2016', 'Marian', 'Dudek', '', 'Sanocka 5', 9, 'docieplenie stropodachu ', 1, 7, '16.03.2016', 4, 26, '2016', '25.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (27, 27, 2016, '9.03.2016', 'Rafał', 'Zając', '', 'Korotyńskiego 24', 25, 'docieplenie bud. wielorodz.', 2, 7, '9.03.2016', 4, 27, '2016', '18.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (28, 28, 2016, '17.02.2016', 'Jacek', 'Wieczorek', '', 'Żwirki i Wigury 53', 22, 'bud. inst. wodociąg. p. poż.', 4, 7, '17.02.2016', 4, 28, '2016', '28.03.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (29, 29, 2016, '23.02.2016', 'Janusz', 'Jabłoński', '', 'Nowickiego 3', 20, 'docieplenie bud. wielorodz.', 4, 7, '23.02.2016', 3, 29, '2016', '3.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (30, 30, 2016, '2.03.2016', 'Mirosław', 'Król', '', 'Pruszkowska 19/21', 7, 'budowa zadaszenia schodów', 2, 7, '2.03.2016', 1, 30, '2016', '11.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (31, 31, 2016, '4.03.2016', 'Maciej', 'Majewski', '', 'Wolnej Wszechnicy 5/5', 23, 'przebud i zm. spos uż.', 1, 7, '4.03.2016', 4, 31, '2016', '13.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (32, 32, 2016, '10.03.2016', 'Sławomir', 'Olszewski', '', 'Pruszkowska 4d', 25, 'wymiana okien i drzwi', 5, 7, '10.03.2016', 2, 32, '2016', '19.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (33, 33, 2016, '14.03.2016', 'Jarosław', 'Jaworski', '', 'Pawińskiego 5A', 7, 'docieplenie + solary', 2, 7, '14.03.2016', 3, 33, '2016', '23.04.2016', 3, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (34, 34, 2016, '14.03.2016', 'Kamil', 'Wróbel', '', 'Sierpińskiego 2', 25, 'przebudowa szybów windowych', 4, 7, '14.03.2016', 1, 34, '2016', '23.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (35, 35, 2016, '18.03.2016', 'Wiesław', 'Malinowski', '', 'Korotyńskiego 46 m 8 i 9', 30, 'podział lokalu na dwa', 3, 7, '18.03.2016', 4, 35, '2016', '27.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (36, 36, 2016, '8.03.2016', 'Roman', 'Pawlak', '', 'Chałubińskiego 5', 27, 'renowacja cokołu (zabytek)', 3, 7, '8.03.2016', 4, 36, '2016', '17.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (37, 37, 2016, '25.03.2016', 'Władysław', 'Witkowski', '', 'Pawińskiego 28', 2, 'wym. Inst. Gazowej', 2, 7, '25.03.2016', 2, 37, '2016', '4.05.2016', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (38, 38, 2016, '6.04.2016', 'Jakub', 'Walczak', '', 'Grzeszczyka 6 m 34', 27, 'przebudowa lok. Mieszk', 4, 7, '6.04.2016', 1, 38, '2016', '16.05.2016', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (39, 39, 2016, '25.03.2016', 'Artur', 'Stępień', '', 'Banacha 1a', 7, 'zmiana decyzji 204/2014', 3, 7, '25.03.2016', 4, 39, '2016', '4.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (40, 40, 2016, '4.04.2016', 'Zdzisław', 'Górski', '', 'Dickensa 6', 29, 'przebud. I zm. Spoz uż. Poddasza', 5, 7, '4.04.2016', 3, 40, '2016', '14.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (41, 41, 2016, '22.03.2016', 'Edward', 'Rutkowski', '', 'Radomska 14', 21, 'docieplenie elewacji', 1, 7, '22.03.2016', 3, 41, '2016', '1.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (42, 42, 2016, '24.03.2016', 'Mieczysław', 'Michalak', '', 'Al. Jerozolimskie 179', 24, 'budowa wind i schodów', 3, 7, '24.03.2016', 5, 42, '2016', '3.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (43, 43, 2016, '24.03.2016', 'Damian', 'Sikora', '', 'Mszczonowska 9', 1, 'budowa bud miesz. wielorodz.', 3, 7, '24.03.2016', 2, 43, '2016', '3.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (44, 44, 2016, '5.04.2016', 'Dawid', 'Ostrowski', '', 'Mochnackiego 17 lok. 17', 24, 'przebudowa lokalu mieszkalnego', 4, 7, '5.04.2016', 5, 44, '2016', '15.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (45, 45, 2016, '5.04.2016', 'Przemysław', 'Baran', '', 'Al. Jerozolimskie 185', 6, 'docieplenie i wzm. Konstr.', 1, 7, '5.04.2016', 3, 45, '2016', '15.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (46, 46, 2016, '11.04.2016', 'Sebastian', 'Duda', '', 'Stadionowa', 3, 'bud. Kanału spławnego', 4, 7, '11.04.2016', 4, 46, '2016', '21.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (47, 47, 2016, '14.04.2016', 'Czesław', 'Szewczyk', '', 'Szpital Banacha', 20, 'bud. Stacji gazowej', 3, 7, '14.04.2016', 3, 47, '2016', '24.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (48, 48, 2016, '14.03.2016', 'Leszek', 'Tomaszewski', '', 'Włodarzewska', 30, 'budowa bud miesz. wielorodz.', 4, 7, '14.03.2016', 4, 48, '2016', '23.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (49, 49, 2016, '19.04.2016', 'Daniel', 'Pietrzak', '', 'Szczęśliwicka 23', 29, 'remont elewacji', 1, 7, '19.04.2016', 5, 49, '2016', '29.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (50, 50, 2016, '14.04.2016', 'Waldemar ', 'Marciniak', '', 'Bitwy Warszawskiej 1920 r. 6 m. 26', 3, 'przebudowa lokalu mieszkalnego', 5, 7, '14.04.2016', 1, 50, '2016', '24.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (51, 51, 2016, '2.05.2016', 'Jan', 'Wróblewski', '', 'Racławicka 129', 26, 'przebudowa lokalu usługowego', 3, 7, '2.05.2016', 1, 51, '2016', '11.06.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (52, 52, 2016, '22.04.2016', 'Andrzej', 'Zalewski', '', 'Pawińskiego 24', 29, 'przebudowa lokalu usługowego', 2, 7, '22.04.2016', 2, 52, '2016', '1.06.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (53, 53, 2016, '4.05.2016', 'Piotr', 'Jakubowski', '', 'Al. Jerozolimskie 181 B', 6, 'przebudowa bud. Biurowego', 2, 7, '4.05.2016', 4, 53, '2016', '13.06.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (54, 54, 2016, '6.05.2016', 'Krzysztof', 'Jasiński', '', 'Al. Jerozolimskie 183', 17, 'budowa zadaszeń na budynku', 2, 7, '6.05.2016', 5, 54, '2016', '15.06.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (55, 55, 2016, '17.05.2016', 'Stanisław', 'Zawadzki', '', 'Banacha 2', 4, 'przebudowa holu w budynku', 2, 7, '17.05.2016', 1, 55, '2016', '26.06.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (56, 56, 2016, '9.06.2016', 'Tomasz', 'Sadowski', '', 'Pawińskiego 10', 4, 'wymiana inst. Gazowej', 5, 7, '9.06.2016', 5, 56, '2016', '19.07.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (57, 57, 2016, '29.06.2016', 'Paweł', 'Bąk', '', 'Włodarzewska 63', 25, 'budowa 2 bud miesz. wielorodz.', 2, 7, '29.06.2016', 1, 57, '2016', '8.08.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (58, 58, 2016, '1.07.2016', 'Józef', 'Chmielewski', '', 'Grójecka 93', 20, 'budowa Sali gimnastycznej', 5, 7, '1.07.2016', 5, 58, '2016', '10.08.2016', 3, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (59, 59, 2016, '6.04.2016', 'Marcin', 'Włodarczyk', '', 'Grójecka 93', 3, 'budowa łącznika do Sali gim.', 4, 7, '6.04.2016', 4, 59, '2016', '16.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (60, 60, 2016, '29.06.2016', 'Marek', 'Borkowski', '', 'Sanocka 8', 7, 'remont elewacji i docieplenie', 2, 7, '29.06.2016', 5, 60, '2016', '8.08.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (61, 61, 2016, '22.06.2016', 'Michał', 'Czarnecki', '', 'Żwirki i Wigury 51', 20, 'remont elewacji i docieplenie', 3, 7, '22.06.2016', 5, 61, '2016', '1.08.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (62, 62, 2016, '19.07.2016', 'Grzegorz', 'Sawicki', '', 'Jasielska 48', 24, 'remont elewacji i docieplenie', 1, 7, '19.07.2016', 2, 62, '2016', '28.08.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (63, 63, 2016, '21.07.2016', 'Jerzy', 'Sokołowski', '', 'Żwirki i Wigury 45A', 19, 'remont elewacji i docieplenie', 2, 7, '21.07.2016', 1, 63, '2016', '30.08.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (64, 64, 2016, '1.08.2016', 'Tadeusz', 'Urbański', '', 'Nowickiego 10', 29, 'remont elewacji i docieplenie', 5, 7, '1.08.2016', 5, 64, '2016', '10.09.2016', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (65, 65, 2016, '23.06.2016', 'Adam', 'Kubiak', '', 'Pruszkowska 13', 16, 'wymiana stropu - bud. Usługowy', 2, 7, '23.06.2016', 4, 65, '2016', '2.08.2016', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (66, 66, 2016, '1.06.2016', 'Łukasz', 'Maciejewski', '', 'Żwirki i Wigury 53A', 13, 'remont elewacji i docieplenie', 5, 7, '1.06.2016', 5, 66, '2016', '11.07.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (67, 67, 2016, '1.08.2016', 'Zbigniew', 'Szczepański', '', 'Sanocka 5', 22, 'remont elewacji i docieplenie', 1, 7, '1.08.2016', 1, 67, '2016', '10.09.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (68, 68, 2016, '15.06.2016', 'Ryszard', 'Kucharski', '', 'Grójecka 113', 29, 'przebudowa inst. Gazowej', 4, 7, '15.06.2016', 5, 68, '2016', '25.07.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (69, 69, 2016, '26.07.2016', 'Dariusz', 'Wilk', '', 'Wiślicka 7', 28, 'przebudowa inst. Gazowej', 2, 7, '26.07.2016', 3, 69, '2016', '4.09.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (70, 70, 2016, '15.06.2016', 'Henryk', 'Kalinowski', '', 'Wiślicka 5', 22, 'przebudowa inst. Gazowej', 1, 7, '15.06.2016', 5, 70, '2016', '25.07.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (71, 71, 2016, '18.03.2016', 'Mariusz', 'Lis', '', 'Wiślicka 3', 15, 'przebudowa inst. Gazowej', 2, 7, '18.03.2016', 2, 71, '2016', '27.04.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (72, 72, 2016, '14.04.2016', 'Kazimierz', 'Mazurek', '', 'Sanocka 4', 20, 'przebudowa inst. Gazowej', 4, 7, '14.04.2016', 5, 72, '2016', '24.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (73, 73, 2016, '5.04.2016', 'Wojciech', 'Wysocki', '', 'Racławicka 144', 17, 'przebudowa inst. Gazowej', 1, 7, '5.04.2016', 2, 73, '2016', '15.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (74, 74, 2016, '5.04.2016', 'Robert', 'Adamski', '', 'Banacha 1b', 13, 'przebudowa części III piętra', 5, 7, '5.04.2016', 3, 74, '2016', '15.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (75, 75, 2016, '9.08.2016', 'Mateusz', 'Kaźmierczak', '', 'Korotyńskiego', 6, 'bud. Kolektora - kanalizacja', 4, 7, '9.08.2016', 5, 75, '2016', '18.09.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (76, 76, 2016, '18.08.2016', 'Marian', 'Wasilewski', '', 'Koszykowa 81', 12, 'przebud wodociągu - bud. Komory', 4, 7, '18.08.2016', 3, 76, '2016', '27.09.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (77, 77, 2016, '12.07.2016', 'Rafał', 'Sobczak', '', 'Grójecka 97', 18, 'przebudowa wnętrza Zieleniaka', 2, 7, '12.07.2016', 2, 77, '2016', '21.08.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (78, 78, 2016, '22.08.2016', 'Jacek', 'Czerwiński', '', 'Wiśllicka 3', 9, 'przebudowa cz. Wsp. Bud.', 5, 7, '22.08.2016', 2, 78, '2016', '1.10.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (79, 79, 2016, '9.05.2016', 'Janusz', 'Andrzejewski', '', 'Pruszkowska 4d', 13, 'remont klatki schodowej', 4, 7, '9.05.2016', 4, 79, '2016', '18.06.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (80, 80, 2016, '31.08.2016', 'Mirosław', 'Cieślak', '', 'Pruszkowska 4c', 8, 'remont klatki schodowej', 5, 7, '31.08.2016', 2, 80, '2016', '10.10.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (81, 81, 2016, '30.08.2016', 'Maciej', 'Głowacki', '', 'Pawińskiego 18 m 7', 15, 'przebudowa lokalu mieszkalnego', 5, 7, '30.08.2016', 2, 81, '2016', '9.10.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (82, 82, 2016, '10.08.2016', 'Sławomir', 'Zakrzewski', '', 'Pruszkowska 4d', 3, 'przebudowa lokalu usługowego', 1, 7, '10.08.2016', 1, 82, '2016', '19.09.2016', 3, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (83, 83, 2016, '6.09.2016', 'Jarosław', 'Kołodziej', '', 'Trojdena 7', 18, 'rozbiórka kotłowni i bud. Gosp.', 4, 7, '6.09.2016', 5, 83, '2016', '16.10.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (84, 84, 2016, '2.09.2016', 'Kamil', 'Sikorski', '', 'Wiślicka 1a/76', 10, 'przebudowa lokalu mieszkalnego', 3, 7, '2.09.2016', 2, 84, '2016', '12.10.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (85, 85, 2016, '7.09.2016', 'Wiesław', 'Krajewski', '', 'Pętla tramw. Banacha', 11, 'bud. Drogi dojazdowej', 4, 7, '7.09.2016', 5, 85, '2016', '17.10.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (86, 86, 2016, '8.09.2016', 'Roman', 'Gajewski', '', 'Białobrzeska 7 m 28', 20, 'przebudowa lok. Mieszkalnego', 4, 7, '8.09.2016', 4, 86, '2016', '18.10.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (87, 87, 2016, '19.09.2016', 'Władysław', 'Szymczak', '', 'Nowickiego 5 m 12', 10, 'rozbiórka fragmentu ściany', 4, 7, '19.09.2016', 2, 87, '2016', '29.10.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (88, 88, 2016, '22.03.2016', 'Jakub', 'Szulc', '', 'Spiska 1', 27, 'przebudowa i rozbudowa ', 2, 7, '22.03.2016', 2, 88, '2016', '1.05.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (89, 89, 2016, '12.08.2016', 'Artur', 'Baranowski', '', 'Korotyńskiego 18 m 53', 19, 'rozbiórka fragmentu ściany', 4, 7, '12.08.2016', 1, 89, '2016', '21.09.2016', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (90, 90, 2016, '20.06.2016', 'Zdzisław', 'Laskowski', '', 'Gorlicka 4A m 102', 10, 'rozbiórka ścianek działowych', 4, 7, '20.06.2016', 3, 90, '2016', '30.07.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (91, 91, 2016, '8.07.2016', 'Edward', 'Brzeziński', '', 'Racławicka 144', 30, 'rozbiórka stacji bazowej tel, kom.', 3, 7, '8.07.2016', 1, 91, '2016', '17.08.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (92, 92, 2016, '7.07.2016', 'Mieczysław', 'Makowski', '', 'Dantyszka 22 m 21', 15, 'przebud inst. Gazowej', 3, 7, '7.07.2016', 5, 92, '2016', '16.08.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (93, 93, 2016, '7.07.2016', 'Damian', 'Ziółkowski', '', 'Al.. Jerozolimskie 179', 17, 'przebud. Kilku pomieszczeń', 5, 7, '7.07.2016', 3, 93, '2016', '16.08.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (94, 94, 2016, '27.10.2016', '', '', 'AS Invest Sp. z o.o.', 'Filtrowa 59/13', 2, 'przebudowa lokalu', 2, 7, '27.10.2016', 3, 94, '2016', '6.12.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (95, 95, 2016, '27.10.2016', 'Przemysław', 'Nowak', '', 'Koszykowa 81', 7, 'remont drogi (zamienny)', 1, 7, '27.10.2016', 5, 95, '2016', '6.12.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (96, 96, 2016, '25.10.2016', 'Sebastian', 'Kowalski', '', 'Na Bateryjce 6', 25, 'budowa bud miesz. wielorodz.', 4, 7, '25.10.2016', 5, 96, '2016', '4.12.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (97, 97, 2016, '6.10.2016', 'Czesław', 'Wiśniewski', '', 'Al. Jerozolimskie 91', 3, 'zamurowanie otworów okiennych', 3, 7, '6.10.2016', 5, 97, '2016', '15.11.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (98, 98, 2016, '14.10.2016', 'Leszek', 'Dąbrowski', '', 'Banacha', 30, 'bud. Sieci gaz. N. ciśnienia', 4, 7, '14.10.2016', 5, 98, '2016', '23.11.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (99, 99, 2016, '5.12.2016', 'Daniel', 'Lewandowski', '', 'Grójecka 128', 5, 'zm. Spos. Uż. I przebudowa', 2, 7, '5.12.2016', 2, 1, '2017', '14.01.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (100, 100, 2016, '8.12.2016', 'Waldemar ', 'Wójcik', '', 'Grójecka 109', 11, 'przebudowa lokalu uż.', 3, 7, '8.12.2016', 2, 2, '2017', '17.01.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (101, 101, 2016, '9.11.2016', 'Jan', 'Kamiński', '', 'Trojdena 13 m 120', 27, 'wykonanie otworu w ścianie nośnej', 2, 7, '9.11.2016', 1, 3, '2017', '19.12.2016', 3, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (102, 102, 2016, '2.12.2016', 'Andrzej', 'Kowalczyk', '', 'Banacha 1a', 10, 'przebudowa parteru', 1, 7, '2.12.2016', 2, 4, '2017', '11.01.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (103, 103, 2016, '8.12.2016', 'Piotr', 'Zieliński', '', 'Korotyńskiego 48 m 241', 11, 'otwór w ścianie nośnej', 4, 7, '8.12.2016', 3, 5, '2017', '17.01.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (104, 104, 2016, '8.12.2016', 'Krzysztof', 'Szymański', '', 'Banacha 1a', 6, 'przebudowa 3 piętra', 2, 7, '8.12.2016', 3, 6, '2017', '17.01.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (105, 105, 2016, '15.12.2016', 'Stanisław', 'Woźniak', '', 'Racławicka 154', 12, 'wymiana inst. Gazowej', 3, 7, '15.12.2016', 5, 7, '2017', '24.01.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (106, 106, 2016, '13.10.2016', 'Tomasz', 'Kozłowski', '', 'Sanocka 10A', 29, 'wym. i remont docieplenia', 4, 7, '13.10.2016', 4, 8, '2017', '22.11.2016', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (107, 107, 2016, '16.12.2016', 'Paweł', 'Jankowski', '', 'Bohdanowicza 4 m 116', 29, 'rozbiórka ścianki działowej', 2, 7, '16.12.2016', 5, 9, '2017', '25.01.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (108, 108, 2016, '29.12.2016', 'Józef', 'Wojciechowski', '', 'Pruszkowska 12', 7, 'przebudowa sieci gazowej', 5, 7, '29.12.2016', 1, 10, '2017', '7.02.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (109, 109, 2016, '28.12.2016', 'Marcin', 'Kwiatkowski', '', 'Lirowa / Włodarzewska', 24, 'bud. mieszk wielorodz z usługami', 3, 7, '28.12.2016', 4, 11, '2017', '6.02.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (110, 110, 2016, '30.12.2016', 'Marek', 'Kaczmarek', '', 'Szczęśliwicka', 16, 'projekt zamienny', 2, 7, '30.12.2016', 2, 12, '2017', '8.02.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (111, 111, 2016, '22.12.2016', 'Michał', 'Mazur', '', 'Siemieńskiego 17', 9, 'budowa bud. Mieszk. Wielorodz', 2, 7, '22.12.2016', 5, 13, '2017', '31.01.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (112, 112, 2016, '22.12.2016', 'Grzegorz', 'Krawczyk', '', 'Pawińskiego 3c', 1, 'budowa schodów zewnętrznych', 1, 7, '22.12.2016', 2, 14, '2017', '31.01.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (113, 1, 2017, '9.01.2017', 'Jerzy', 'Piotrowski', '', 'Geodetów 4 m 29', 19, 'przebudowa lokalu mieszkalnego', 1, 7, '9.01.2017', 5, 15, '2017', '18.02.2017', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (114, 2, 2017, '13.01.2017', 'Tadeusz', 'Grabowski', '', 'Korotyńskiego 4', 11, 'remont elewacji i docieplenie', 1, 7, '13.01.2017', 2, 16, '2017', '22.02.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (115, 3, 2017, '13.01.2017', 'Adam', 'Nowakowski', '', 'Pruszkowska 6A', 25, 'remont elewacji i docieplenie', 3, 7, '13.01.2017', 3, 17, '2017', '22.02.2017', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (116, 4, 2017, '13.01.2017', 'Łukasz', 'Pawłowski', '', 'Żwirki i Wigury 59', 13, 'remont elewacji', 3, 7, '13.01.2017', 5, 18, '2017', '22.02.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (117, 5, 2017, '13.01.2017', 'Zbigniew', 'Michalski', '', 'Wiślicka 1', 27, 'wymiana luksferów na okna', 3, 7, '13.01.2017', 4, 19, '2017', '22.02.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (118, 6, 2017, '13.01.2017', '', '', '„Na Polanie” Spółdzielnia Mieszkaniowa', 'Pruszkowska 12', 7, 'remont elewacji i docieplenie', 5, 7, '13.01.2017', 2, 20, '2017', '22.02.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (119, 7, 2017, '13.01.2017', '', '', '„Na Polanie” Spółdzielnia Mieszkaniowa', 'Trojdena 11', 10, 'remont elewacji i docieplenie', 4, 7, '13.01.2017', 5, 21, '2017', '22.02.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (120, 8, 2017, '13.01.2017', '', '', '„Na Polanie” Spółdzielnia Mieszkaniowa', 'Korotyńskiego 18', 6, 'remont elewacji i docieplenie', 1, 7, '13.01.2017', 3, 22, '2017', '22.02.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (121, 9, 2017, '13.01.2017', '', '', '„Na Polanie” Spółdzielnia Mieszkaniowa', 'Żwirki i Wigury 57', 6, 'remont elewacji i docieplenie', 5, 7, '13.01.2017', 1, 23, '2017', '22.02.2017', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (122, 10, 2017, '17.02.2017', 'Kazimierz', 'Wieczorek', '', 'Pruszkowska 6B', 26, 'przebudowa lokalu usługowego', 3, 7, '17.02.2017', 2, 24, '2017', '29.03.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (123, 11, 2017, '22.02.2017', 'Wojciech', 'Jabłoński', '', 'Siemieńskiego 14 m 16', 24, 'przebudowa lokalu mieszkalnego', 1, 7, '22.02.2017', 4, 25, '2017', '3.04.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (124, 12, 2017, '22.02.2017', 'Robert', 'Król', '', 'Włodarzewska 63', 28, 'bud. Inst. Gazowej', 4, 7, '22.02.2017', 4, 26, '2017', '3.04.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (125, 13, 2017, '9.03.2017', 'Mateusz', 'Majewski', '', 'Sanocka 11', 15, 'remont elewacji i docieplenie', 1, 7, '9.03.2017', 4, 27, '2017', '18.04.2017', 3, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (126, 14, 2017, '29.03.2017', 'Marian', 'Olszewski', '', 'Korotyńskiego 5 m 14', 26, 'przebudowa lokalu mieszkalnego', 3, 7, '29.03.2017', 1, 28, '2017', '8.05.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (127, 15, 2017, '29.03.2017', 'Rafał', 'Jaworski', '', 'Żwirki i Wigury 93', 20, 'remont 7 łazienek', 4, 7, '29.03.2017', 2, 29, '2017', '8.05.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (128, 16, 2017, '5.04.2017', 'Jacek', 'Wróbel', '', 'Archiwalna 5', 29, 'wymiana inst. Gazowej', 2, 7, '5.04.2017', 2, 30, '2017', '15.05.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (129, 17, 2017, '10.04.2017', 'Janusz', 'Malinowski', '', 'Trojdena 2A', 11, 'przebudowa budynku', 3, 7, '10.04.2017', 5, 31, '2017', '20.05.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (130, 18, 2017, '26.04.2017', 'Mirosław', 'Pawlak', '', 'Białobrzeska 39 m 4', 12, 'przebudowa lokalu mieszkalnego', 2, 7, '26.04.2017', 4, 32, '2017', '5.06.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (131, 19, 2017, '8.05.2017', 'Maciej', 'Witkowski', '', 'Grójecka 107', 3, 'przebudowa elewacji budynku', 4, 7, '8.05.2017', 1, 33, '2017', '17.06.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (132, 20, 2017, '8.05.2017', 'Sławomir', 'Walczak', '', 'Baleya 10 m 3', 7, 'otwór w ścianie nośnej', 1, 7, '8.05.2017', 1, 34, '2017', '17.06.2017', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (133, 21, 2017, '11.05.2017', 'Jarosław', 'Stępień', '', 'Hankiewicza 1', 27, 'remont dachów', 2, 7, '11.05.2017', 2, 35, '2017', '20.06.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (134, 22, 2017, '18.05.2017', 'Kamil', 'Górski', '', 'Siemieńskiego 21', 7, 'przebudowa i rozbiórka ', 5, 7, '18.05.2017', 3, 36, '2017', '27.06.2017', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (135, 23, 2017, '23.05.2017', 'Wiesław', 'Rutkowski', '', 'Grzeszczyka 2', 8, 'rozbudowa przedszkola', 3, 7, '23.05.2017', 2, 37, '2017', '2.07.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (136, 24, 2017, '13.06.2017', 'Roman', 'Michalak', '', 'Sierpińskiego 1A', 16, 'przebudowa lokalu użytkowego', 1, 7, '13.06.2017', 3, 38, '2017', '23.07.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (137, 25, 2017, '6.06.2017', 'Władysław', 'Sikora', '', 'Przy Parku 4', 11, 'kolejne pozwolenie na ten teren', 3, 7, '6.06.2017', 1, 39, '2017', '16.07.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (138, 26, 2017, '13.06.2017', 'Jakub', 'Ostrowski', '', 'Hankiewicza 1', 18, 'remont izolacji w patio', 5, 7, '13.06.2017', 2, 40, '2017', '23.07.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (139, 27, 2017, '20.06.2017', 'Artur', 'Baran', '', 'Urbanistów 1A', 8, 'przebud. Lokalu i garażu', 5, 7, '20.06.2017', 5, 41, '2017', '30.07.2017', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (140, 28, 2017, '23.06.2017', 'Zdzisław', 'Duda', '', 'Okińskiego 8', 28, 'termomodernizacja', 3, 7, '23.06.2017', 2, 42, '2017', '2.08.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (141, 29, 2017, '30.06.2017', 'Edward', 'Szewczyk', '', 'Bitwy Warszawskiej 1920 r. 19', 9, 'przebudowa i zmiana spos. Uż.', 2, 7, '30.06.2017', 1, 43, '2017', '9.08.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (142, 30, 2017, '11.07.2017', 'Mieczysław', 'Tomaszewski', '', 'Racławicka 146', 26, 'budowa osłon świetlików garażu', 3, 7, '11.07.2017', 3, 44, '2017', '20.08.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (143, 31, 2017, '12.07.2017', 'Damian', 'Pietrzak', '', 'Siemieńskiego 21', 20, 'projekt zamienny', 2, 7, '12.07.2017', 1, 45, '2017', '21.08.2017', 1, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (144, 32, 2017, '17.07.2017', '', '', '„Słoneczna” Spółdzielnia Mieszkaniowa', 'Hankiewicza 1', 21, 'remont izolacji ścian fundam.', 5, 7, '17.07.2017', 1, 46, '2017', '26.08.2017', 2, 2, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (145, 33, 2017, '19.07.2017', 'Przemysław', 'Wróblewski', '', 'Grójecka 43 m 15', 1, 'remont lokalu mieszkalnego', 4, 7, '19.07.2017', 1, 47, '2017', '28.08.2017', 1, 1, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (146, 34, 2017, '20.07.2017', 'Sebastian', 'Zalewski', '', 'Prezydencka 14 m 2', 11, 'przebud. Bud mieszk jednorodz', 1, 7, '20.07.2017', 5, 48, '2017', '29.08.2017', 1, 1, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (147, 35, 2017, '2.08.2017', 'Czesław', 'Jakubowski', '', 'Mszczonowska 1, 3, 5', 13, 'budowa hotelu', 1, 7, '2.08.2017', 2, 49, '2017', '11.09.2017', 2, 1, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (148, 36, 2017, '4.08.2017', 'Leszek', 'Jasiński', '', 'Grójecka 115', 30, 'przebudowa instalacji gazowej', 3, 7, '4.08.2017', 5, 50, '2017', '13.09.2017', 1, 1, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (149, 37, 2017, '9.10.2017', 'Daniel', 'Zawadzki', '', 'Baleya 5', 15, 'przebud. Przył. Ciepłow', 2, 6, '9.10.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (150, 38, 2017, '10.10.2017', 'Waldemar ', 'Sadowski', '', 'Dickensa 29', 15, 'otwór w ścianie nośnej', 1, 6, '10.10.2017', 2, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (151, 39, 2017, '10.10.2017', 'Zbigniew', 'Bąk', '', 'Barska 11/13', 16, 'rozbiórka i bud. Wiaty śmietnik.', 5, 6, '10.10.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (152, 40, 2017, '17.10.2017', 'Ryszard', 'Chmielewski', '', 'Park Zachodni', 22, 'budowa skatepark\'u', 5, 6, '17.10.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (153, 41, 2017, '13.10.2017', 'Dariusz', 'Włodarczyk', '', 'Spiska 6', 2, 'bud. Węzła cieplnego', 2, 6, '13.10.2017', 3, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (154, 42, 2017, '17.10.2017', 'Henryk', 'Borkowski', '', 'Wolnej Wszechnicy 5', 14, 'przebudowa internatu', 5, 6, '17.10.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (155, 43, 2017, '23.10.2017', '', '', '„Słoneczna” Spółdzielnia Mieszkaniowa', 'Wiślicka 6', 28, 'wymiana inst. wod-kan i p.poż.', 3, 5, '23.10.2017', 3, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (156, 44, 2017, '7.11.2017', 'Kazimierz', 'Sawicki', '', 'Archiwalna 7 m 3', 26, 'przebudowa lokalu mieszkalnego', 3, 5, '7.11.2017', 4, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (157, 45, 2017, '8.11.2017', 'Wojciech', 'Sokołowski', '', 'Korotyńskiego 48 m 233', 26, 'wykonanie otworu w ścianie nośnej', 1, 5, '8.11.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (158, 46, 2017, '9.11.2017', 'Robert', 'Urbański', '', 'Południowa 5', 11, 'budowa budynku mieszkalnego jednorodzinnego', 4, 5, '9.11.2017', 3, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (159, 47, 2017, '10.11.2017', '', '', 'Stalbud', 'Wielka 4', 2, 'budowa czegoś tam', 1, 5, '10.11.2017', 5, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (160, 48, 2017, '11.11.2017', 'Marian', 'Maciejewski', '', 'Grójecka 5', 22, 'budowa xyz', 1, 4, '11.11.2017', 3, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (161, 49, 2017, '11.11.2017', 'Przemysław', 'Majewski', '', 'Sanocka 11', 22, 'bud. Inst. Gazowej', 1, 4, '11.11.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (162, 50, 2017, '11.11.2017', 'Sebastian', 'Olszewski', '', 'Korotyńskiego 5 m 14', 2, 'remont elewacji i docieplenie', 5, 4, '11.11.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (163, 51, 2017, '11.11.2017', 'Czesław', 'Jaworski', '', 'Żwirki i Wigury 93', 14, 'przebudowa lokalu mieszkalnego', 5, 4, '11.11.2017', 5, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (164, 52, 2017, '11.11.2017', 'Leszek', 'Wróbel', '', 'Archiwalna 5', 28, 'remont 7 łazienek', 2, 4, '11.11.2017', 2, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (165, 53, 2017, '11.11.2017', 'Daniel', 'Malinowski', '', 'Trojdena 2A', 26, 'wymiana inst. Gazowej', 5, 4, '11.11.2017', 5, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (166, 54, 2017, '13.11.2017', 'Waldemar ', 'Pawlak', '', 'Białobrzeska 39 m 4', 26, 'przebudowa budynku', 3, 3, '13.11.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (167, 55, 2017, '13.11.2017', 'Zbigniew', 'Witkowski', '', 'Grójecka 107', 11, 'przebudowa lokalu mieszkalnego', 3, 3, '13.11.2017', 2, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (168, 56, 2017, '13.11.2017', 'Ryszard', 'Walczak', '', 'Baleya 10 m 3', 2, 'przebudowa elewacji budynku', 1, 3, '13.11.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (169, 57, 2017, '13.11.2017', 'Dariusz', 'Stępień', '', 'Hankiewicza 1', 22, 'otwór w ścianie nośnej', 4, 2, '13.11.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (170, 58, 2017, '14.11.2017', 'Henryk', 'Górski', '', 'Siemieńskiego 21', 26, 'remont dachów', 1, 2, '14.11.2017', 3, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (171, 59, 2017, '14.11.2017', 'Daniel', 'Rutkowski', '', 'Grzeszczyka 2', 11, 'przebudowa i rozbiórka ', 1, 2, '14.11.2017', 1, NULL, 'NULL', NULL, NULL, NULL, '');
INSERT INTO `Wydzial_Architektury_BETA`.`sprawy` (`ID_sprawa`, `sprawa_numer`, `sprawa_rok`, `data_wniosku`, `inwestor_imie`, `inwestor_nazwisko`, `inwestor_nazwa`, `sprawa_adres`, `ID_sprawa_kategoria`, `sprawa_opis`, `sprawa_waga`, `ID_sprawa_status`, `sprawa_deadline`, `ID_pracownik`, `decyzja_numer`, `decyzja_rok`, `decyzja_data_wydania`, `ID_decyzja_rodzaj`, `ID_decyzja_status`, `komentarz`) VALUES (172, 60, 2017, '15.11.2017', 'Waldemar ', 'Michalak', '', 'Sierpińskiego 1A', 2, 'rozbudowa przedszkola', 2, 2, '15.11.2017', 3, NULL, 'NULL', NULL, NULL, NULL, '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Wydzial_Architektury_BETA`.`permissions`
-- -----------------------------------------------------
START TRANSACTION;
USE `Wydzial_Architektury_BETA`;
INSERT INTO `Wydzial_Architektury_BETA`.`permissions` (`ID_permissions`, `permissions`) VALUES (1, 'employee');
INSERT INTO `Wydzial_Architektury_BETA`.`permissions` (`ID_permissions`, `permissions`) VALUES (2, 'manager');
INSERT INTO `Wydzial_Architektury_BETA`.`permissions` (`ID_permissions`, `permissions`) VALUES (3, 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Wydzial_Architektury_BETA`.`password`
-- -----------------------------------------------------
START TRANSACTION;
USE `Wydzial_Architektury_BETA`;
INSERT INTO `Wydzial_Architektury_BETA`.`password` (`ID_password`, `login`, `password`, `id_permissions`) VALUES (DEFAULT, 'kowalski', '1111', 1);
INSERT INTO `Wydzial_Architektury_BETA`.`password` (`ID_password`, `login`, `password`, `id_permissions`) VALUES (DEFAULT, 'jankowiak', '1111', 1);
INSERT INTO `Wydzial_Architektury_BETA`.`password` (`ID_password`, `login`, `password`, `id_permissions`) VALUES (DEFAULT, 'iksinska', '1111', 1);
INSERT INTO `Wydzial_Architektury_BETA`.`password` (`ID_password`, `login`, `password`, `id_permissions`) VALUES (DEFAULT, 'zmuda', '1111', 1);
INSERT INTO `Wydzial_Architektury_BETA`.`password` (`ID_password`, `login`, `password`, `id_permissions`) VALUES (DEFAULT, 'tomasiuk', '1111', 1);
INSERT INTO `Wydzial_Architektury_BETA`.`password` (`ID_password`, `login`, `password`, `id_permissions`) VALUES (DEFAULT, 'naczelnik', '1111', 2);
INSERT INTO `Wydzial_Architektury_BETA`.`password` (`ID_password`, `login`, `password`, `id_permissions`) VALUES (DEFAULT, 'admin', '1111', 3);

COMMIT;

