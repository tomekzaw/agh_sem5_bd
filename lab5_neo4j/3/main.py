from neo4j import GraphDatabase

uri = 'bolt://localhost:7687'
user = 'neo4j'
password = 'lab5'
driver = GraphDatabase.driver(uri, auth=(user, password))

def list_movies(tx):
    result = tx.run("MATCH (m:Movie) "
                    "RETURN m.title AS title, m.released AS year "
                    "ORDER BY m.released")
    for record in result:
        title, year = record['title'], record['year']
        print(f'{title} ({year})')

def list_movie_actors(tx, movie_title):
    result = tx.run("MATCH (p:Person)-[:ACTED_IN]->(m:Movie) "
                    "WHERE m.title = $title "
                    "RETURN p.name AS name", title=movie_title)
    for record in result:
        print(record['name'])

if __name__ == '__main__':
    with driver.session() as session:
        session.read_transaction(list_movies)
        print()
        session.read_transaction(list_movie_actors, movie_title='The Matrix')