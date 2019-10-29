CREATE OR REPLACE PROCEDURE sprawdz_czy_wycieczka_jeszcze_sie_nie_odbyla(
	arg_id_wycieczki wycieczki.id_wycieczki%TYPE
) AS
	wycieczki_count INTEGER;
BEGIN
	SELECT COUNT(*)
		INTO wycieczki_count
		FROM wycieczki
		WHERE id_wycieczki = arg_id_wycieczki AND data > SYSDATE;

	IF wycieczki_count = 0 THEN
		RAISE_APPLICATION_ERROR(-20005, 'Wycieczka już się odbyła');
	END IF;
END;

CALL sprawdz_czy_wycieczka_jeszcze_sie_nie_odbyla(1);
CALL sprawdz_czy_wycieczka_jeszcze_sie_nie_odbyla(3);

