SELECT sr_sov_a3
FROM   boundary_data_polygons_entities_geospatial_data
ORDER BY iso_a3;
EXCEPT 
SELECT iso_a3
FROM   boundary_data_countries_geospatial_data
ORDER BY sr_sov_a3;

-- The NOT IN query can fail silently if NULLs exist in the subquery result thus the WHERE use

SELECT sr_sov_a3
FROM boundary_data_polygons_entities_geospatial_data
WHERE sr_sov_a3 NOT IN (
    SELECT iso_a3 
    FROM boundary_data_countries_geospatial_data
    WHERE iso_a3 IS NOT NULL
)
ORDER BY sr_sov_a3;