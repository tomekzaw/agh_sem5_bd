CREATE OR REPLACE PROCEDURE zmien_status_rezerwacji(
	arg_nr_rezerwacji rezerwacje.nr_rezerwacji%TYPE,
	arg_status rezerwacje.status%TYPE
) AS
	current_status rezerwacje.status%TYPE;
	current_id_wycieczki wycieczki.id_wycieczki%TYPE;
BEGIN
	sprawdz_czy_rezerwacja_istnieje(arg_nr_rezerwacji);
	
	SELECT status
	INTO current_status
	FROM rezerwacje
	WHERE nr_rezerwacji = arg_nr_rezerwacji;

	IF current_status = 'A' AND arg_status != 'A' THEN
		SELECT id_wycieczki
		INTO current_id_wycieczki
		FROM rezerwacje
		WHERE nr_rezerwacji = arg_nr_rezerwacji;
		
		sprawdz_czy_jest_wolne_miejsce(current_id_wycieczki);
	END IF;
	
	IF current_status != arg_status THEN
		UPDATE rezerwacje
			SET status = arg_status
			WHERE nr_rezerwacji = arg_nr_rezerwacji;

		INSERT INTO rezerwacje_log (id_rezerwacji, data, status)
			VALUES (arg_nr_rezerwacji, SYSDATE, arg_status);
	END IF;
END;