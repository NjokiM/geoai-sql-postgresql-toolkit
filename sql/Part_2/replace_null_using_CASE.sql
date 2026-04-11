SELECT
    CASE WHEN "NDVI" IS NOT NULL THEN "NDVI" ELSE 0 END AS "NDVI_clean",
    CASE WHEN "NIR" IS NOT NULL THEN "NIR" ELSE 0 END AS "NIR_clean",
    CASE WHEN "SWIR" IS NOT NULL THEN "SWIR" ELSE 0 END AS "SWIR_clean",
    CASE WHEN "Description" IS NOT NULL THEN "Description" ELSE 'Unclassified' END AS "Crop_Label"
FROM multispectral_crop_and_lc_dataset;