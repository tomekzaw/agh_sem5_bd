CREATE OR REPLACE PROCEDURE sprawdz_czy_osoba_istnieje(
	arg_id_osoby osoby.id_osoby%TYPE
) AS
	osoby_count INTEGER;
BEGIN
	SELECT COUNT(*)
	INTO osoby_count
	FROM osoby
	WHERE id_osoby = arg_id_osoby;

	IF osoby_count = 0 THEN
		RAISE_APPLICATION_ERROR(-20001, 'Osoba o podanym identyfikatorze nie istnieje');
	END IF;
END;

CALL sprawdz_czy_osoba_istnieje(1);
CALL sprawdz_czy_osoba_istnieje(123);