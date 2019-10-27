CREATE OR REPLACE TYPE rezerwacja_osoby_type AS
	OBJECT (
		kraj VARCHAR2(50),
		data DATE,
		nazwa_wycieczki VARCHAR(100),
		status_rezerwacji CHAR(1)
	);

CREATE OR REPLACE TYPE rezerwacje_osoby_table_type AS
	TABLE OF rezerwacja_osoby_type;

CREATE OR REPLACE FUNCTION rezerwacje_osoby(arg_id_osoby osoby.id_osoby%TYPE)
RETURN rezerwacje_osoby_table_type PIPELINED
AS
BEGIN
	sprawdz_czy_osoba_istnieje(arg_id_osoby);

	FOR row IN (
		SELECT *
		FROM wycieczki_osoby_id
		WHERE id_osoby = arg_id_osoby
	) LOOP
		PIPE ROW (rezerwacja_osoby_type(
			row.kraj, row.data, row.nazwa_wycieczki, row.status_rezerwacji
		));
	END LOOP;
	RETURN;
END;

SELECT * FROM TABLE(rezerwacje_osoby(3));