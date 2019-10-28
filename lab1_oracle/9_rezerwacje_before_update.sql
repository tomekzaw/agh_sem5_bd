CREATE OR REPLACE TRIGGER rezerwacje_before_update
BEFORE UPDATE ON rezerwacje FOR EACH ROW
BEGIN
	sprawdz_czy_rezerwacja_istnieje(:NEW.nr_rezerwacji);

	IF :OLD.status = 'A' AND :NEW.status != 'A' THEN		
		sprawdz_czy_jest_wolne_miejsce_2(:NEW.id_wycieczki);
		
		UPDATE wycieczki
			SET liczba_wolnych_miejsc = liczba_wolnych_miejsc - 1
			WHERE id_wycieczki = :NEW.id_wycieczki;						
	ELSIF :OLD.status != 'A' AND :NEW.status = 'A' THEN	
		UPDATE wycieczki
			SET liczba_wolnych_miejsc = liczba_wolnych_miejsc + 1
			WHERE id_wycieczki = :NEW.id_wycieczki;
	END IF;
END;