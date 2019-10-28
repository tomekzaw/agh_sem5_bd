CREATE OR REPLACE TRIGGER rezerwacje_after_insert
AFTER INSERT ON rezerwacje FOR EACH ROW
BEGIN		
	INSERT INTO rezerwacje_log (id_rezerwacji, data, status)
		VALUES (:NEW.nr_rezerwacji, SYSDATE, :NEW.status);
		
	UPDATE wycieczki
		SET liczba_wolnych_miejsc = liczba_wolnych_miejsc - 1
		WHERE id_wycieczki = :NEW.id_wycieczki;
END;