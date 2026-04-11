SELECT
    "ID",
    "Season",
    "Province",
    "District",
    "Date",
    "Latitude",
    "Longitude",
    "Code",
    "Land",
    "Description",
    "Stage",
    "NDVI",
    "NDWI",
    "EVI",
    "GNDVI",
    "SAVI",
    "Green",
    "Blue",
    "NIR",
    "SWIR"
FROM multispectral_crop_and_lc_dataset
WHERE "Latitude" > 34.0;