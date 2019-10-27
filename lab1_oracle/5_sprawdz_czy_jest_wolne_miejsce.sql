CREATE OR REPLACE PROCEDURE sprawdz_czy_jest_wolne_miejsce(
	arg_id_wycieczki wycieczki.id_wycieczki%TYPE
) AS
	liczba_wolnych_miejsc INTEGER;
BEGIN
	SELECT liczba_wolnych_miejsc
		INTO liczba_wolnych_miejsc
		FROM wycieczki_miejsca_id
		WHERE id_wycieczki = arg_id_wycieczki;

	IF liczba_wolnych_miejsc <= 0 THEN
		RAISE_APPLICATION_ERROR(-20006, 'Brak wolnych miejsc');
	END IF;
END;