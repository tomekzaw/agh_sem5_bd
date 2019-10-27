CREATE OR REPLACE VIEW rezerwacje_do_anulowania_id AS
	SELECT *
	FROM wycieczki_osoby_id
	WHERE status_rezerwacji = 'N' AND data BETWEEN SYSDATE AND SYSDATE + INTERVAL '7' DAY;
	
CREATE OR REPLACE VIEW rezerwacje_do_anulowania AS
	SELECT kraj, data, nazwa_wycieczki, imie, nazwisko, kontakt
	FROM rezerwacje_do_anulowania_id;