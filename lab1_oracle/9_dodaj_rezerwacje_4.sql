CREATE OR REPLACE PROCEDURE dodaj_rezerwacje_4(
	arg_id_wycieczki wycieczki.id_wycieczki%TYPE,
	arg_id_osoby osoby.id_osoby%TYPE
) AS
BEGIN
	INSERT INTO rezerwacje (id_wycieczki, id_osoby, status)
		VALUES (arg_id_wycieczki, arg_id_osoby, 'N');
END;
