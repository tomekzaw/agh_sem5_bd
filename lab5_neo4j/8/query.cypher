MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, collect(m) as movies
WHERE length(movies) >= 3
WITH length(movies) AS number_of_movies
RETURN avg(number_of_movies)

MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, collect(m) as movies
WITH length(movies) AS number_of_movies
WHERE number_of_movies >= 3
RETURN avg(number_of_movies)

MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, collect(m) as movies
WHERE length(movies) >= 3
RETURN avg(length(movies))