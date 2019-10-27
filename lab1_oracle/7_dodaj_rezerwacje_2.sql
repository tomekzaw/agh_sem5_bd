CREATE OR REPLACE PROCEDURE dodaj_rezerwacje_2(
	arg_id_wycieczki wycieczki.id_wycieczki%TYPE,
	arg_id_osoby osoby.id_osoby%TYPE
) AS
	inserted_nr_rezerwacji rezerwacje.nr_rezerwacji%TYPE;
	inserted_status rezerwacje.status%TYPE;
BEGIN
	sprawdz_czy_wycieczka_istnieje(arg_id_wycieczki);
	sprawdz_czy_wycieczka_jeszcze_sie_nie_odbyla(arg_id_wycieczki);
	sprawdz_czy_jest_wolne_miejsce_2(arg_id_wycieczki);
	sprawdz_czy_osoba_istnieje(arg_id_osoby);
	sprawdz_czy_nie_istnieje_rezerwacja(arg_id_wycieczki, arg_id_osoby);

	INSERT INTO rezerwacje (id_wycieczki, id_osoby, status)
		VALUES (arg_id_wycieczki, arg_id_osoby, 'N')
		RETURNING nr_rezerwacji, status INTO inserted_nr_rezerwacji, inserted_status;
	przelicz();

	INSERT INTO rezerwacje_log (id_rezerwacji, data, status)
		VALUES (inserted_nr_rezerwacji, SYSDATE, inserted_status);
END;