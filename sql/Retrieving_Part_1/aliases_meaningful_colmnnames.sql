SELECT
    "ID",
    "Date",
    "Latitude",
    "Longitude",
    "Description" AS "Crop_Type",
    "NDVI" AS "Normalized_Difference_Vegetation_Index",
    "NDWI" AS "Normalized_Difference_Water_Index",
    "EVI" AS "Enhanced_Vegetation_Index",
    "GNDVI" AS "Green_Normalized_Difference_Vegetation_Index",
    "SAVI" AS "Soil_Adjusted_Vegetation_Index"
FROM multispectral_crop_and_lc_dataset
WHERE "Latitude" > 34.0;