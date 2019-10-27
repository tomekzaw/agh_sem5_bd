CREATE OR REPLACE VIEW wycieczki_miejsca_2 AS
	SELECT kraj, data, nazwa AS nazwa_wycieczki, liczba_miejsc, liczba_wolnych_miejsc
	FROM wycieczki;