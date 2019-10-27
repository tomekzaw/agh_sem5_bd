CREATE OR REPLACE TYPE uczestnik_wycieczki_type AS
	OBJECT (
		imie VARCHAR2(50),
		nazwisko VARCHAR2(50),
		status_rezerwacji CHAR(1)
	);

CREATE OR REPLACE TYPE uczestnicy_wycieczki_table_type AS
	TABLE OF uczestnik_wycieczki_type;

CREATE OR REPLACE FUNCTION uczestnicy_wycieczki(arg_id_wycieczki wycieczki.id_wycieczki%TYPE)
RETURN uczestnicy_wycieczki_table_type PIPELINED
AS
BEGIN
	sprawdz_czy_wycieczka_istnieje(arg_id_wycieczki);

	FOR row IN (
		SELECT *
		FROM wycieczki_osoby_id
		WHERE id_wycieczki = arg_id_wycieczki AND status_rezerwacji != 'A'
	) LOOP
		PIPE ROW (uczestnik_wycieczki_type(
			row.imie, row.nazwisko, row.status_rezerwacji
		));
	END LOOP;
	RETURN;
END;

SELECT * FROM TABLE(uczestnicy_wycieczki(1));