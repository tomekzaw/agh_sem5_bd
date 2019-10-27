CREATE TABLE rezerwacje_log (
	id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
	id_rezerwacji INT,
	data DATE,
	status CHAR(1),
	CONSTRAINT rezerwacje_log_pk PRIMARY KEY (id) ENABLE 
);

ALTER TABLE rezerwacje_log
	ADD CONSTRAINT rezerwacje_log_fk1
		FOREIGN KEY (id_rezerwacji)
			REFERENCES rezerwacje (nr_rezerwacji) ENABLE;

ALTER TABLE rezerwacje_log
	ADD CONSTRAINT rezerwacje_log_chk1
		CHECK (status IN ('N', 'P', 'Z', 'A')) ENABLE;