—-example of a Cartesian product
SELECT
c.country_name,
p.featurecla
FROM
boundary_data_countries_geospatial_data c,
boundary_data_polygons_entities_geospatial_data p
LIMIT 10;


—- correct query without a Cartesian product 
SELECT
    c.country_name,
    c.iso_a3,
    p.featurecla
FROM
    boundary_data_countries_geospatial_data          c,
    boundary_data_polygons_entities_geospatial_data  p
WHERE
    c.iso_a3 = p.sr_adm0_a3
ORDER BY c.iso_a3;