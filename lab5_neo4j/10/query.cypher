Wyświetlić węzły, które znajdują się na 2 miejscu na ścieżkach o długości 4 pomiędzy dwoma wybranymi węzłami.

MATCH path = (:Person {name: "Tom Hanks"})-[:ACTED_IN*4]-(:Person {name: "Demi Moore"})
RETURN nodes(path)[2]

MATCH path = (:Person {name: "Tom Hanks"})-[:ACTED_IN*4]-(:Person {name: "Demi Moore"})
RETURN nodes(path)[1]

MATCH (:Person {name: "Tom Hanks"})-[rels:ACTED_IN*4]-(:Person {name: "Demi Moore"})
RETURN startNode(rels[2])