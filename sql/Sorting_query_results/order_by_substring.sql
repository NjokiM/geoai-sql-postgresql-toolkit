SELECT
    "Date",
    "ID",
    "NDVI",
    "Latitude",
    "Longitude"
FROM multispectral_crop_and_lc_dataset
ORDER BY SUBSTR("ID", 10, 8);