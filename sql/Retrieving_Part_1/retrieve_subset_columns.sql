-- specified columns to retrieve rather than all the column
-- included the previous condition for filtering rows

SELECT
    "ID",
    "Date",
    "Latitude",
    "Longitude",
    "Description",
    "NDVI",
    "NDWI",
    "EVI",
    "GNDVI",
    "SAVI"
FROM multispectral_crop_and_lc_dataset
WHERE "Latitude" > 34.0;