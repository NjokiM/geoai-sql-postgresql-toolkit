WITH country_points AS (
    SELECT
        c.country,
        c.region,
        c.iso2,
        p.featurecla,
        p.source_dataset,
        p.geometry
    FROM boundary_data_countries_geospatial_data c
    JOIN boundary_data_points_entities_geospatial_data p
        ON c.country = p.admin
       AND c.iso2 = p.iso_a2
)
SELECT
    cp.country,
    cp.region,
    cp.iso2,
    cp.featurecla,
    cp.source_dataset,
    l.source_dataset AS line_source_dataset
FROM country_points cp
LEFT JOIN boundary_data_lines_entities_geospatial_data l
    ON cp.country = l.country
   AND cp.featurecla = l.featurecla
ORDER BY cp.country, cp.featurecla;