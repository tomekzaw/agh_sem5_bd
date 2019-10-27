CREATE OR REPLACE VIEW wycieczki_osoby_potwierdzone AS
	SELECT *
	FROM wycieczki_osoby_id
	WHERE status_rezerwacji IN ('P', 'Z');
	
CREATE OR REPLACE VIEW wycieczki_osoby_potwierdzone AS
	SELECT kraj, data, nazwa_wycieczki, imie, nazwisko, status_rezerwacji
	FROM wycieczki_osoby_potwierdzone_id;
	