CREATE OR REPLACE TRIGGER rezerwacje_before_insert
BEFORE INSERT ON rezerwacje FOR EACH ROW
BEGIN
	sprawdz_czy_wycieczka_istnieje(:NEW.id_wycieczki);
	sprawdz_czy_wycieczka_jeszcze_sie_nie_odbyla(:NEW.id_wycieczki);
	sprawdz_czy_jest_wolne_miejsce_2(:NEW.id_wycieczki);
	sprawdz_czy_osoba_istnieje(:NEW.id_osoby);
	sprawdz_czy_nie_istnieje_rezerwacja(:NEW.id_wycieczki, :NEW.id_osoby);
END;
