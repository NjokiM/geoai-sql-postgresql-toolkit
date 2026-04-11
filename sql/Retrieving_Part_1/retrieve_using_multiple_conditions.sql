SELECT *
FROM multispectral_crop_and_lc_dataset
WHERE (
    "Latitude" < 30
    AND "Longitude" > 72
    AND "Description" = 'Builtup'
);