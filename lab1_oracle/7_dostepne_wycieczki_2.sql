CREATE OR REPLACE VIEW dostepne_wycieczki_2 AS
	SELECT kraj, data, nazwa AS nazwa_wycieczki, liczba_miejsc, liczba_wolnych_miejsc
	FROM wycieczki
	WHERE liczba_wolnych_miejsc > 0 AND data > SYSDATE;