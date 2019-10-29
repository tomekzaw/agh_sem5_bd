CREATE OR REPLACE TRIGGER wycieczki_before_update
BEFORE UPDATE ON wycieczki FOR EACH ROW
BEGIN
	IF :NEW.liczba_miejsc <= 0 THEN
		RAISE_APPLICATION_ERROR(-20007, 'Liczba miejsc musi być dodatnią liczbą naturalną');
	END IF;

	IF :NEW.liczba_miejsc < (:OLD.liczba_miejsc - :NEW.liczba_wolnych_miejsc) THEN
		RAISE_APPLICATION_ERROR(-20008, 'Liczba miejsc nie może być mniejsza niż liczba zajętych miejsc');
	END IF;

	SELECT :NEW.liczba_miejsc - (:OLD.liczba_miejsc - :NEW.liczba_wolnych_miejsc)
		INTO :NEW.liczba_wolnych_miejsc
		FROM dual;
END;
