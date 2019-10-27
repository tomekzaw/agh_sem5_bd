CREATE OR REPLACE VIEW wycieczki_osoby_potwierdzone AS
	SELECT *
	FROM wycieczki_osoby
	WHERE status_rezerwacji IN ('P', 'Z');