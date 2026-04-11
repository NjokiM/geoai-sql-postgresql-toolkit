SELECT
    'Coordinate (' || "Latitude" || ', ' || "Longitude" || ') has ' || "Description" AS "Location_Summary"
FROM multispectral_crop_and_lc_dataset
WHERE "Description" = 'Rice';