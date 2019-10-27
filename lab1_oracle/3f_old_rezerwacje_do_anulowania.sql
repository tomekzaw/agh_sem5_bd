CREATE OR REPLACE VIEW rezerwacje_do_anulowania AS
	SELECT
		w.kraj,
		w.data,
		w.nazwa AS nazwa_wycieczki,
		o.imie,
		o.nazwisko,
		o.kontakt
	FROM rezerwacje r
		JOIN wycieczki w ON w.id_wycieczki = r.id_wycieczki
		JOIN osoby o ON o.id_osoby = r.id_osoby
	WHERE
		r.status = 'N' AND w.data BETWEEN SYSDATE AND SYSDATE + INTERVAL '7' DAY;