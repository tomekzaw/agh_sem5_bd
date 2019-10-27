CREATE OR REPLACE VIEW dostepne_wycieczki_id AS
	SELECT *
	FROM wycieczki_miejsca_id
	WHERE liczba_wolnych_miejsc > 0 AND data > SYSDATE;
		
CREATE OR REPLACE VIEW dostepne_wycieczki AS
	SELECT kraj, data, nazwa_wycieczki, liczba_miejsc, liczba_wolnych_miejsc
	FROM dostepne_wycieczki_id;
