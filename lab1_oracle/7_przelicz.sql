CREATE OR REPLACE PROCEDURE przelicz AS
BEGIN
	UPDATE wycieczki w
	SET liczba_wolnych_miejsc = liczba_miejsc - (
		SELECT COUNT(*)
			FROM rezerwacje r
			WHERE r.id_wycieczki = w.id_wycieczki AND r.status != 'A');
END;