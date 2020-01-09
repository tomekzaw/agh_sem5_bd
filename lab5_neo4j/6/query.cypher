MATCH (m:Movie)
WHERE m.released < 1998
SET m.old = true