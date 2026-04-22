SELECT
    c.country_name,
    COUNT(p.featurecla) AS polygon_count_inflated
FROM      boundary_data_countries_geospatial_data          c
JOIN      boundary_data_polygons_entities_geospatial_data  p
    ON    c.iso_a3 = p.sr_adm0_a3
JOIN      boundary_data_lines_entities_geospatial_data     l
    ON    c.country_name = l.country
GROUP BY  c.country_name
ORDER BY  c.country_name;

WITH PolygonCounts AS (
    SELECT sr_adm0_a3, COUNT(*) as actual_count
    FROM boundary_data_polygons_entities_geospatial_data
    GROUP BY sr_adm0_a3
)
SELECT 
    c.country_name, 
    pc.actual_count
FROM boundary_data_countries_geospatial_data c
JOIN PolygonCounts pc ON c.iso_a3 = pc.sr_adm0_a3; 