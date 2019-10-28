CREATE OR REPLACE TRIGGER rezerwacje_before_insert
BEFORE INSERT ON rezerwacje FOR EACH ROW
BEGIN
	sprawdz_czy_wycieczka_istnieje(arg_id_wycieczki);
	sprawdz_czy_wycieczka_jeszcze_sie_nie_odbyla(arg_id_wycieczki);
	sprawdz_czy_jest_wolne_miejsce_2(arg_id_wycieczki);
	sprawdz_czy_osoba_istnieje(arg_id_osoby);
	sprawdz_czy_nie_istnieje_rezerwacja(arg_id_wycieczki, arg_id_osoby);	
END;