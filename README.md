# PrimeKG Loader for Neo4j

This repository contains scripts to install Neo4j on a server and import the **PrimeKG** knowledge graph.

## Installation

Run the script to install Neo4j (Ubuntu):

```bash
bash install_neo4j.sh
```

Neo4j will be available at [http://localhost:7474](http://localhost:7474).

## Import PrimeKG

1. Place your `primekg.csv` inside Neo4j’s `import` directory:
   mv primekg.csv ~/neo4j/import/kg.csv

2. Load the data using the Cypher script:
   ~/neo4j/bin/cypher-shell -u neo4j -p <password> -f import_primekg.cypher

## Notes
- The dataset `primekg.csv` is **not included** here (too large).  
- Add it to your server manually before running the import.
- In order for the import command to work, you need to have APOC Neo4j plugin installed beforehand