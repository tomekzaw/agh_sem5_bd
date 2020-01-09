MATCH (p:Person {name: "Michael J. Fox"})
RETURN p

PROFILE
MATCH (p:Person {name: "Michael J. Fox"})
RETURN p

CREATE INDEX ON :Person(name)

