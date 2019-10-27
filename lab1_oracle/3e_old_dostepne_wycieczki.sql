CREATE OR REPLACE VIEW dostepne_wycieczki AS
	SELECT
		w.kraj,
		w.data,
		w.nazwa AS nazwa_wycieczki,
		w.liczba_miejsc,
		(w.liczba_miejsc - COUNT(r.nr_rezerwacji)) AS liczba_wolnych_miejsc
	FROM wycieczki w
		JOIN rezerwacje r ON w.id_wycieczki = r.id_wycieczki
	WHERE
		w.data > SYSDATE
	GROUP BY
		w.id_wycieczki, w.kraj, w.data, w.nazwa, w.liczba_miejsc
	HAVING
		(w.liczba_miejsc - COUNT(r.nr_rezerwacji)) > 0;