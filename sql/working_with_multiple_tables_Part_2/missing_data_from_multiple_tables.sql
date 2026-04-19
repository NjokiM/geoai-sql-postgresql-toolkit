-- using an Full outer join
 SELECT
    c.iso_a3,
    c.country_name,
    c.region,
    pg.featurecla AS polygon_entity,
    pt.featurecla AS point_entity
FROM      boundary_data_countries_geospatial_data          c
FULL OUTER JOIN boundary_data_polygons_entities_geospatial_data pg
    ON    c.iso_a3 = pg.sr_adm0_a3
FULL OUTER JOIN boundary_data_points_entities_geospatial_data   pt
    ON    c.iso_a3 = pt.sr_adm0_a3
ORDER BY c.iso_a3;

-- using a left join
SELECT
    c.iso_a3,
    c.country_name,
    c.region,
    pg.featurecla AS polygon_entity,
    pt.featurecla AS point_entity
FROM      boundary_data_countries_geospatial_data          c
LEFT JOIN boundary_data_polygons_entities_geospatial_data  pg
    ON    c.iso_a3 = pg.sr_adm0_a3
LEFT JOIN boundary_data_points_entities_geospatial_data    pt
    ON    c.iso_a3 = pt.sr_adm0_a3
ORDER BY c.iso_a3;