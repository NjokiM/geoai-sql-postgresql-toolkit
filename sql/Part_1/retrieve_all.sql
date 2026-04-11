-- select all using * for all columns
SELECT *
FROM multispectral_crop_and_lc_dataset;

-- select all using specific columns
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
FROM multispectral_crop_and_lc_dataset;


