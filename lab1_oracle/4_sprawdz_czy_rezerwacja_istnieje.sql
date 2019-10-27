CREATE OR REPLACE PROCEDURE sprawdz_czy_rezerwacja_istnieje(
	arg_nr_rezerwacji rezerwacje.nr_rezerwacji%TYPE
) AS
	rezerwacje_count INTEGER;
BEGIN
	SELECT COUNT(*)
		INTO rezerwacje_count
		FROM rezerwacje
		WHERE nr_rezerwacji = arg_nr_rezerwacji;

	IF rezerwacje_count = 0 THEN
		RAISE_APPLICATION_ERROR(-20003, 'Rezerwacja o podanym numerze nie istnieje');
	END IF;
END;

CALL sprawdz_czy_rezerwacja_istnieje(1);
CALL sprawdz_czy_rezerwacja_istnieje(123);