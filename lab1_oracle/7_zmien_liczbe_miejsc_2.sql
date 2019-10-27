CREATE OR REPLACE PROCEDURE zmien_liczbe_miejsc_2(
	arg_id_wycieczki wycieczki.id_wycieczki%TYPE,
	arg_liczba_miejsc INTEGER
) AS	
	liczba_zajetych_miejsc integer;
BEGIN
	IF arg_liczba_miejsc <= 0 THEN
		RAISE_APPLICATION_ERROR(-20007, 'Liczba miejsc musi być dodatnią liczbą naturalną');
	END IF;
	sprawdz_czy_wycieczka_istnieje(arg_id_wycieczki);
	
	SELECT (liczba_miejsc - liczba_wolnych_miejsc)
		INTO liczba_zajetych_miejsc
		FROM wycieczki
		WHERE id_wycieczki = arg_id_wycieczki;

	IF arg_liczba_miejsc < liczba_zajetych_miejsc THEN
		RAISE_APPLICATION_ERROR(-20008, 'Liczba miejsc nie może być mniejsza niż liczba zajętych miejsc');
	END IF;
	
	UPDATE wycieczki
		SET liczba_miejsc = arg_liczba_miejsc,
			liczba_wolnych_miejsc = (arg_liczba_miejsc - liczba_zajetych_miejsc)
		WHERE id_wycieczki = arg_id_wycieczki;
END;