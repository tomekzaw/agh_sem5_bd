CREATE OR REPLACE PROCEDURE dodaj_rezerwacje_3(
	arg_id_wycieczki wycieczki.id_wycieczki%TYPE,
	arg_id_osoby osoby.id_osoby%TYPE
) AS
BEGIN
	sprawdz_czy_wycieczka_istnieje(arg_id_wycieczki);
	sprawdz_czy_wycieczka_jeszcze_sie_nie_odbyla(arg_id_wycieczki);
	sprawdz_czy_jest_wolne_miejsce_2(arg_id_wycieczki);
	sprawdz_czy_osoba_istnieje(arg_id_osoby);
	sprawdz_czy_nie_istnieje_rezerwacja(arg_id_wycieczki, arg_id_osoby);

	INSERT INTO rezerwacje (id_wycieczki, id_osoby, status)
		VALUES (arg_id_wycieczki, arg_id_osoby, 'N');
	
	UPDATE wycieczki
		SET liczba_wolnych_miejsc = liczba_wolnych_miejsc - 1
		WHERE id_wycieczki = arg_id_wycieczki;
END;