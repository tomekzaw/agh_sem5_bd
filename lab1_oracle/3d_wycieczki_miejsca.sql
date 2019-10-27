CREATE OR REPLACE VIEW wycieczki_miejsca_id AS
	SELECT
		w.id_wycieczki,
		w.kraj,
		w.data,
		w.nazwa AS nazwa_wycieczki,
		w.liczba_miejsc,
		(w.liczba_miejsc - COUNT(r.nr_rezerwacji)) AS liczba_wolnych_miejsc
	FROM wycieczki w
		JOIN rezerwacje r
			ON w.id_wycieczki = r.id_wycieczki
			AND r.status != 'A'
	GROUP BY
		w.id_wycieczki, w.kraj, w.data, w.nazwa, w.liczba_miejsc;
		
CREATE OR REPLACE VIEW wycieczki_miejsca AS
	SELECT kraj, data, nazwa_wycieczki, liczba_miejsc, liczba_wolnych_miejsc
	FROM wycieczki_miejsca_id;