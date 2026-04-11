SELECT *
FROM multispectral_crop_and_lc_dataset
WHERE "NDVI" IS NULL
   OR "Latitude" IS NULL
   OR "Longitude" IS NULL
   OR "Description" IS NULL;