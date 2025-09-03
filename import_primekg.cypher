// Create an index on IDs for faster MERGE
CREATE INDEX IF NOT EXISTS FOR (n:Entity) ON (n.id);

LOAD CSV WITH HEADERS FROM "file:///kg.csv" AS row
WITH row
WHERE row.x_id IS NOT NULL AND row.y_id IS NOT NULL AND row.relation IS NOT NULL

// Merge subject node (typed label + generic Entity)
CALL apoc.merge.node([row.x_type, 'Entity'], {id: row.x_id},
  {name: row.x_name, source: row.x_source}) YIELD node AS x

// Merge object node (typed label + generic Entity)
CALL apoc.merge.node([row.y_type, 'Entity'], {id: row.y_id},
  {name: row.y_name, source: row.y_source}) YIELD node AS y

// Merge relationship (deduplicates edges)
CALL apoc.merge.relationship(x, row.relation, {display: row.display_relation}, {}, y) YIELD rel
RETURN count(*) AS processed;
