CREATE OR REPLACE PROCEDURE sprawdz_czy_nie_istnieje_rezerwacja(
	arg_id_wycieczki wycieczki.id_wycieczki%TYPE,
	arg_id_osoby osoby.id_osoby%TYPE
) AS
	rezerwacje_count INTEGER;
BEGIN
	SELECT COUNT(*)
		INTO rezerwacje_count
		FROM rezerwacje
		WHERE id_wycieczki = arg_id_wycieczki AND id_osoby = arg_id_osoby;

	IF rezerwacje_count > 0 THEN
		RAISE_APPLICATION_ERROR(-20006, 'Rezerwacja już istnieje.');
	END IF;
END;

CALL sprawdz_czy_nie_istnieje_rezerwacja(1, 1);
CALL sprawdz_czy_nie_istnieje_rezerwacja(1, 2);
CALL sprawdz_czy_nie_istnieje_rezerwacja(2, 1);
