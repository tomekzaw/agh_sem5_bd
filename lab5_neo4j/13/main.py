from neo4j import GraphDatabase

uri = 'bolt://localhost:11002'  # TODO: change port to default
user = 'neo4j'
password = 'lab5'
driver = GraphDatabase.driver(uri, auth=(user, password))

def make_spanning_tree(tx):
    nodes = {
        record['id']: {
            'name': record['name'],  # person name or movie title from database
            'graph_neighbours': [],  # connected nodes from database
            'dfs_visited': False,    # for DFS algorithm
            'tree_children': []      # spanning tree edges
        }
        for record in tx.run("MATCH (p:Person) RETURN ID(p) AS id, p.name AS name "
                             "UNION ALL MATCH (m:Movie) RETURN ID(m) AS id, m.title AS name ")
    }
    
    result = tx.run("MATCH (p:Person)-[:ACTED_IN|:DIRECTED]->(m:Movie)"
                    "RETURN ID(p) AS person_id, ID(m) AS movie_id")
    for record in result:
        person_id, movie_id = record['person_id'], record['movie_id']
        nodes[person_id]['graph_neighbours'].append(movie_id)
        nodes[movie_id]['graph_neighbours'].append(person_id)

    def dfs(this_id, prev_id=None):
        nodes[this_id]['dfs_visited'] = True
        if prev_id is not None:
            nodes[prev_id]['tree_children'].append(this_id)
        for next_id in nodes[this_id]['graph_neighbours']:
            if not nodes[next_id]['dfs_visited']:
                dfs(next_id, this_id)

    start, *_ = nodes.keys()  # any node ID
    dfs(start)

    nodes_count = len(nodes)
    spanning_tree_edges_count = sum(map(lambda node: len(node['tree_children']), nodes.values()))
    assert nodes_count == spanning_tree_edges_count+1  # tree condition

    def print_tree(node_id, left=0):
        print(' ' * left + nodes[node_id]['name'])
        for child_id in nodes[node_id]['tree_children']:
            print_tree(child_id, left+1)

    print_tree(start)

if __name__ == '__main__':
    with driver.session() as session:
        session.read_transaction(make_spanning_tree)