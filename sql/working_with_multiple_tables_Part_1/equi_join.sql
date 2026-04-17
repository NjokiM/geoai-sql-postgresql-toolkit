--- equi-join using where
SELECT
    c.country_name,
    c.region,
	c.latitude as c_latitude,
	c.longitude as c_longitude,
    p.source_dataset as entity_type,
	-- ST_X(c.geometry) AS pg_longitude,
 --    ST_Y(c.geometry) AS pg_latitude,
     ST_Y(p.geometry) AS p_latitude,
	ST_X(p.geometry) AS p_longitude
FROM
    boundary_data_countries_geospatial_data           c,
    boundary_data_points_entities_geospatial_data   p
WHERE
    c.country_name = p.admin
ORDER BY
    c.country_name;

--- equi-join using join
SELECT
    c.country_name,
    c.region,
	c.latitude as c_latitude,
	c.longitude as c_longitude,
    p.source_dataset as entity_type,
	-- ST_X(c.geometry) AS pg_longitude,
 --    ST_Y(c.geometry) AS pg_latitude,
     ST_Y(p.geometry) AS p_latitude,
	ST_X(p.geometry) AS p_longitude
FROM boundary_data_countries_geospatial_data c
JOIN boundary_data_points_entities_geospatial_data p
   ON c.country_name = p.admin
ORDER BY
    c.country_name;