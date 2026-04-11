SELECT
    "ID",
    "Description" AS "Crop_Type",
    "NDVI",
    CASE
        WHEN "NDVI" >= 0.6 THEN 'Healthy/Dense'
        WHEN "NDVI" >= 0.3 AND "NDVI" < 0.6 THEN 'Moderate/Stressed'
        WHEN "NDVI" >= 0.1 AND "NDVI" < 0.3 THEN 'Sparse/Barren'
        WHEN "NDVI" < 0.1 THEN 'No Vegetation/Water'
        ELSE 'Unknown'
    END AS "Health_Status"
FROM multispectral_crop_and_lc_dataset
LIMIT 50;