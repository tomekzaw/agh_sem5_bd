CREATE OR REPLACE TYPE wycieczka_type AS
	OBJECT (
		kraj VARCHAR2(50),
		data DATE,
		nazwa_wycieczki VARCHAR2(100),
		liczba_miejsc INTEGER,
		liczba_wolnych_miejsc INTEGER
	);

CREATE OR REPLACE TYPE wycieczki_table_type AS
	TABLE OF wycieczka_type;

CREATE OR REPLACE FUNCTION dostepne_wycieczki_funkcja(
	arg_kraj wycieczki.kraj%TYPE,
	arg_data_od wycieczki.data%TYPE,
	arg_data_do wycieczki.data%TYPE
) RETURN wycieczki_table_type PIPELINED
AS
BEGIN
	IF arg_data_do < arg_data_od THEN
		raise_application_error(-20004, 'Początek przedziału dat nie może być później niż koniec');
	END IF;

	FOR row IN (
		SELECT *
		FROM dostepne_wycieczki
		WHERE kraj = arg_kraj AND data BETWEEN arg_data_od AND arg_data_do
	) LOOP
		PIPE ROW (wycieczka_type(row.kraj, row.data, row.nazwa_wycieczki, row.liczba_miejsc, row.liczba_wolnych_miejsc));
	END LOOP;
	RETURN;
END;

SELECT * FROM TABLE(dostepne_wycieczki_funkcja('Polska', TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-12-31', 'YYYY-MM-DD')));