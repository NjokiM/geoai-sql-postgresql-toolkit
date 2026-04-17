(SELECT 
    date, 
    latitude, 
    longitude, 
    co_column, 
    co_quality,
    '2024' AS source_table
FROM pakistan_co_year_2024
LIMIT 50)
UNION ALL
(SELECT 
    date, 
    latitude, 
    longitude, 
    co_column, 
    co_quality,
    '2025' AS source_table
FROM pakistan_co_year_2025
LIMIT 50);