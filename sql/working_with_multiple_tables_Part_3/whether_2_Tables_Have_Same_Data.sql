--Compare row counts (cardinality check)
SELECT 'points' AS source_table, COUNT(*) AS row_count
FROM   boundary_data_points_entities_geospatial_data
UNION ALL
SELECT 'lines'  AS source_table, COUNT(*) AS row_count
FROM   boundary_data_lines_entities_geospatial_data;


-- EXCEPT — rows in points NOT in lines
-- returns empty set if tables are identical on these columns)
SELECT admin, featurecla
FROM   boundary_data_points_entities_geospatial_data
EXCEPT
SELECT country, featurecla
FROM   boundary_data_lines_entities_geospatial_data
ORDER BY admin, featurecla;