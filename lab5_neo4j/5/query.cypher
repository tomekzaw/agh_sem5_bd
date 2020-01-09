MATCH (p:Person {name: "Michael J. Fox"})
SET p.birthdate = date("1961-06-09"), p.birthplace = "Edmonton"

MATCH (p:Person {name: "Christopher Lloyd"})
SET p.birthdate = date("1938-10-22"), p.birthplace = "Stamford"

MATCH (p:Person {name: "Lea Thompson"})
SET p.birthdate = date("1961-05-31"), p.birthplace = "Rochester"

MATCH (p:Person {name: "Crispin Glover"})
SET p.birthdate = date("1964-04-20"), p.birthplace = "New York"

MATCH (p:Person {name: "Thomas F. Wilson"})
SET p.birthdate = date("1959-04-15"), p.birthplace = "Philadelphia"

MATCH (p:Person {name: "Mary Steenburgen"})
SET p.birthdate = date("1953-02-08"), p.birthplace = "Newport"
