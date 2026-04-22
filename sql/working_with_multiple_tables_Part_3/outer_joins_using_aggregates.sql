WITH 
  Polys AS (
      SELECT sr_adm0_a3, COUNT(*) as p_count 
      FROM boundary_data_polygons_entities_geospatial_data 
      GROUP BY 1
  ),
  Lines AS (
      SELECT country, COUNT(*) as l_count 
      FROM boundary_data_lines_entities_geospatial_data 
      GROUP BY 1
  ),
  Points AS (
      SELECT sr_adm0_a3, COUNT(*) as pt_count 
      FROM boundary_data_points_entities_geospatial_data 
      GROUP BY 1
  )

SELECT
    c.country_name,
    c.region,
    COALESCE(Polys.p_count, 0) AS actual_polygon_count,
    COALESCE(Lines.l_count, 0) AS actual_line_count,
    COALESCE(Points.pt_count, 0) AS actual_point_count
FROM boundary_data_countries_geospatial_data c
LEFT JOIN Polys  ON c.iso_a3 = Polys.sr_adm0_a3
LEFT JOIN Lines  ON c.country_name = Lines.country
LEFT JOIN Points ON c.iso_a3 = Points.sr_adm0_a3
ORDER BY actual_polygon_count DESC, c.country_name;