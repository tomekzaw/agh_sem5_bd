CREATE OR REPLACE PROCEDURE zmien_status_rezerwacji_4(
	arg_nr_rezerwacji rezerwacje.nr_rezerwacji%TYPE,
	arg_status rezerwacje.status%TYPE
) AS
	current_status rezerwacje.status%TYPE;
	current_id_wycieczki wycieczki.id_wycieczki%TYPE;
BEGIN
	sprawdz_czy_rezerwacja_istnieje(arg_nr_rezerwacji);

	UPDATE rezerwacje
		SET status = arg_status
		WHERE nr_rezerwacji = arg_nr_rezerwacji;
END;
