CREATE OR REPLACE VIEW wycieczki_przyszle AS
	SELECT
		w.kraj,
		w.data,
		w.nazwa AS nazwa_wycieczki,
		o.imie,
		o.nazwisko,
		r.status AS status_rezerwacji
	FROM wycieczki w
		JOIN rezerwacje r ON w.id_wycieczki = r.id_wycieczki
		JOIN osoby o ON r.id_osoby = o.id_osoby
	WHERE
		w.data > SYSDATE;