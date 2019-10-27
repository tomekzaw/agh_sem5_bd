CREATE OR REPLACE FUNCTION przyszle_rezerwacje_osoby(arg_id_osoby osoby.id_osoby%TYPE)
RETURN rezerwacje_osoby_table_type PIPELINED
AS
BEGIN
	sprawdz_czy_osoba_istnieje(arg_id_osoby);

	FOR row IN (
		SELECT *
		FROM wycieczki_przyszle_id
		WHERE id_osoby = arg_id_osoby
	) LOOP
		PIPE ROW (rezerwacja_osoby_type(
			row.kraj, row.data, row.nazwa_wycieczki, row.status_rezerwacji
		));
	END LOOP;
	RETURN;
END;

SELECT * FROM TABLE(przyszle_rezerwacje_osoby(4));