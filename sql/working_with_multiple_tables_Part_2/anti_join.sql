-- using IS NULL
SELECT country_name, 
	   region
FROM   boundary_data_countries_geospatial_data c
LEFT JOIN boundary_data_points_entities_geospatial_data   pt
    ON    c.country_name = pt.admin
	WHERE     pt.admin IS NULL
ORDER BY  c.country_name;

-- using NOT EXISTS

SELECT
    c.country_name,
    c.region
FROM  boundary_data_countries_geospatial_data c
WHERE NOT EXISTS (
    SELECT 1
    FROM   boundary_data_points_entities_geospatial_data pt
    WHERE  pt.admin = c.country_name
)
ORDER BY c.country_name;
