CREATE OR REPLACE PROCEDURE zmien_liczbe_miejsc_4(
	arg_id_wycieczki wycieczki.id_wycieczki%TYPE,
	arg_liczba_miejsc INTEGER
) AS
BEGIN
    sprawdz_czy_wycieczka_istnieje(arg_id_wycieczki);

	UPDATE wycieczki
		SET liczba_miejsc = arg_liczba_miejsc
		WHERE id_wycieczki = arg_id_wycieczki;
END;
