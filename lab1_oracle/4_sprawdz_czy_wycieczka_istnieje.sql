CREATE OR REPLACE PROCEDURE sprawdz_czy_wycieczka_istnieje(
	arg_id_wycieczki wycieczki.id_wycieczki%TYPE
) AS
	wycieczki_count INTEGER;
BEGIN
	SELECT COUNT(*)
	INTO wycieczki_count
	FROM wycieczki w
	WHERE w.id_wycieczki = arg_id_wycieczki;

	IF wycieczki_count = 0 THEN
		RAISE_APPLICATION_ERROR(-20002, 'Wycieczka o podanym identyfikatorze nie istnieje');
	END IF;
END;

CALL sprawdz_czy_wycieczka_istnieje(1);
CALL sprawdz_czy_wycieczka_istnieje(123);