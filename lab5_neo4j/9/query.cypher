Zmienić wartość wybranego atrybutu w węzłach na ścieżce pomiędzy dwoma podanymi węzłami

MATCH path = shortestPath((:Person {name: "Tom Hanks"})-[*..6]-(:Person {name: "Demi Moore"}))
FOREACH (node IN nodes(path) | SET node.marked = true)

MATCH path = shortestPath((:Person {name: "Tom Hanks"})-[*..6]-(:Person {name: "Demi Moore"}))
RETURN path