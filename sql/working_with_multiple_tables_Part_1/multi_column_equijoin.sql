-- using a multi-column equijoin
SELECT
    c.country_name,
    c.region,
    p.source_dataset,
	c.iso2
FROM boundary_data_countries_geospatial_data c
JOIN boundary_data_points_entities_geospatial_data p
    ON c.country_name = p.admin
   AND c.iso2 = p.iso_a2
ORDER BY c.country_name;

-- Using intersect to join two tables with more than one common column values
SELECT
    country_name,
    iso2
FROM boundary_data_countries_geospatial_data

INTERSECT

SELECT
    admin AS country_name,
    iso_a2 AS iso2
FROM boundary_data_points_entities_geospatial_data
ORDER BY country_name;