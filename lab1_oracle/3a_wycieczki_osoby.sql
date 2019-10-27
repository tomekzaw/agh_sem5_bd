CREATE OR REPLACE VIEW wycieczki_osoby_id AS
	SELECT
		w.id_wycieczki,
		w.kraj,
		w.data,
		w.nazwa AS nazwa_wycieczki,
		o.id_osoby,
		o.imie,
		o.nazwisko,
		o.kontakt,
		r.nr_rezerwacji,
		r.status AS status_rezerwacji
	FROM wycieczki w
		JOIN rezerwacje r ON w.id_wycieczki = r.id_wycieczki
		JOIN osoby o ON r.id_osoby = o.id_osoby;
		
CREATE OR REPLACE VIEW wycieczki_osoby AS
	SELECT kraj, data, nazwa_wycieczki, imie, nazwisko, status_rezerwacji
	FROM wycieczki_osoby_id;