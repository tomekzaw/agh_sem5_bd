CREATE OR REPLACE TRIGGER rezerwacje_before_delete
BEFORE DELETE ON rezerwacje FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20009, 'Nie można usuwać rezerwacji');
END;