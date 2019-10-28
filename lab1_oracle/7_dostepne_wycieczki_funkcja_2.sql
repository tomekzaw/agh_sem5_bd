CREATE OR REPLACE FUNCTION dostepne_wycieczki_funkcja_2(
	arg_kraj wycieczki.kraj%TYPE,
	arg_data_od wycieczki.data%TYPE,
	arg_data_do wycieczki.data%TYPE
) RETURN wycieczki_table_type PIPELINED
AS
BEGIN
	IF arg_data_do < arg_data_od THEN
		RAISE_APPLICATION_ERROR(-20004, 'Początek przedziału dat nie może być później niż koniec');
	END IF;

	FOR row IN (
		SELECT *
		FROM dostepne_wycieczki_2
		WHERE kraj = arg_kraj AND data BETWEEN arg_data_od AND arg_data_do
	) LOOP
		PIPE ROW (wycieczka_type(row.kraj, row.data, row.nazwa_wycieczki, row.liczba_miejsc, row.liczba_wolnych_miejsc));
	END LOOP;
	RETURN;
END;

SELECT * FROM TABLE(dostepne_wycieczki_funkcja_2('Polska',
	TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-12-31', 'YYYY-MM-DD')));