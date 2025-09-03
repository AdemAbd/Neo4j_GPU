#!/bin/bash
# Install Neo4j Community Edition manually

# Step 1. Download Neo4j (update version if newer is available)
cd ~
wget https://dist.neo4j.org/neo4j-community-5.20.0-unix.tar.gz

# Step 2. Extract and rename for convenience
tar -xvzf neo4j-community-5.20.0-unix.tar.gz
mv neo4j-community-5.20.0 neo4j

# Step 3. Configure Neo4j (enable CSV import + allow external connections)
echo "
dbms.security.allow_csv_import_from_file_urls=true
dbms.directories.import=~/neo4j/import
dbms.default_listen_address=0.0.0.0
dbms.connector.bolt.listen_address=:7687
dbms.connector.http.listen_address=:7474
" >> ~/neo4j/conf/neo4j.conf

# Step 4. Create import folder
mkdir -p ~/neo4j/import

# Step 5. How to start Neo4j (manual steps)
echo "➡ Start in foreground:  ~/neo4j/bin/neo4j console"
echo "➡ Start in background: ~/neo4j/bin/neo4j start"
