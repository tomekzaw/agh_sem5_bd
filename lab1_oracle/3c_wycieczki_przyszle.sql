CREATE OR REPLACE VIEW wycieczki_przyszle_id AS
	SELECT *
	FROM wycieczki_osoby_id
	WHERE data > SYSDATE;
		
CREATE OR REPLACE VIEW wycieczki_przyszle AS
	SELECT kraj, data, nazwa_wycieczki, imie, nazwisko, status_rezerwacji
	FROM wycieczki_przyszle_id;