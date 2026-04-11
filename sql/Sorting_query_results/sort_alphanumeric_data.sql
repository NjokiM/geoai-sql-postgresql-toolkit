SELECT
    "ID",
    "Description",
    "NDVI"
FROM multispectral_crop_and_lc_dataset
ORDER BY TRANSLATE("ID", '-T:.', '')::NUMERIC;