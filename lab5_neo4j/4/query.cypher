CREATE (:Movie {title: "Back to the Future", released: 1985, tagline: "Marty McFly just broke the time barrier. He's only got one week to get it fixed."}),
       (:Movie {title: "Back to the Future Part II", released: 1989, tagline: "Roads? Where we're going, we don't need roads!"}),
       (:Movie {title: "Back to the Future Part III", released: 1990, tagline: "They've saved the best trip for last... But this time they may have gone too far."}),
       (:Person {name: "Michael J. Fox", born: 1961}),
       (:Person {name: "Christopher Lloyd", born: 1938}),
       (:Person {name: "Lea Thompson", born: 1961}),
       (:Person {name: "Crispin Glover", born: 1964}),       
       (:Person {name: "Thomas F. Wilson", born: 1959}),
       (:Person {name: "Mary Steenburgen", born: 1953})

MATCH (a:Person {name: "Robert Zemeckis"}), (b:Movie)
WHERE b.title STARTS WITH "Back to the Future"
CREATE (a)-[:DIRECTED]->(b)

MATCH (a:Person {name: "Michael J. Fox"}), (b:Movie)
WHERE b.title STARTS WITH "Back to the Future"
CREATE (a)-[:ACTED_IN {roles: "Marty McFly"}]->(b)

MATCH (a:Person {name: "Christopher Lloyd"}), (b:Movie)
WHERE b.title STARTS WITH "Back to the Future"
CREATE (a)-[:ACTED_IN {roles: "Dr. Emmett Brown"}]->(b)

MATCH (a:Person {name: "Lea Thompson"}), (b:Movie)
WHERE b.title STARTS WITH "Back to the Future"
CREATE (a)-[:ACTED_IN {roles: "Lorraine Baines"}]->(b)

MATCH (a:Person {name: "Crispin Glover"}), (b:Movie {title: "Back to the Future"})
CREATE (a)-[:ACTED_IN {roles: "George McFly"}]->(b)

MATCH (a:Person {name: "Thomas F. Wilson"}), (b:Movie)
WHERE b.title STARTS WITH "Back to the Future"
CREATE (a)-[:ACTED_IN {roles: "Biff Tannen"}]->(b)

MATCH (a:Person {name: "Mary Steenburgen"}), (b:Movie {title: "Back to the Future Part III"})
CREATE (a)-[:ACTED_IN {roles: "Clara Clayton"}]->(b)


MATCH (m:Movie)
WHERE m.title STARTS WITH "Back to the Future"
RETURN m