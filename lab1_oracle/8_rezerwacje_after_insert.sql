CREATE OR REPLACE TRIGGER rezerwacje_insert
AFTER INSERT ON rezerwacje FOR EACH ROW
BEGIN
	INSERT INTO rezerwacje_log (id_rezerwacji, data, status)
		VALUES (:NEW.nr_rezerwacji, SYSDATE, :NEW.status);
END;