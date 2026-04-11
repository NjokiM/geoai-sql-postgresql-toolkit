SELECT
    "ID",
    COALESCE("NDVI", 0) AS "NDVI_Clean",
    COALESCE("NIR", 0) AS "Near Infrared",
    COALESCE("SWIR", 0) AS "Shortwave Infrared",
    COALESCE("Description", 'Unclassified') AS "Crop_Label"
FROM multispectral_crop_and_lc_dataset;