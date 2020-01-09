MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, count(m) as number_of_movies
WHERE number_of_movies >= 2
RETURN p

MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, collect(m) as movies
WHERE length(movies) >= 2
RETURN p