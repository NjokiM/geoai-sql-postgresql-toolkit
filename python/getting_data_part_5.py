import kagglehub
import pandas as pd
import os
from sqlalchemy import create_engine

print("downloading data from kaggle")
path = kagglehub.dataset_download("muhammadbilal77511/pakistan-carbon-monoxide-2022-2025")
# path = kagglehub.dataset_download("abdulahadiltaf/sentinel-2-multispectral-crop-and-land-cover-dataset")
# path = kagglehub.dataset_download("maham9/pakistan-weather-dataset")
print("finished downloading data from kaggle")


# Combine the processed CSVs into a DataFrame
processed_dir = os.path.join(path, "co_data", "processed")

all_files = [os.path.join(processed_dir, f) for f in os.listdir(processed_dir) if f.endswith('.csv')]
# all_data = pd.concat([pd.read_csv(f) for f in all_files], ignore_index=True)

# Creating a connection to the local PostgreSQL
# credentials
db_user = 'postgres'
db_password = 'cake2026'
db_host = '127.0.0.1'
db_port = '5432'
db_name = 'postgres'

# Construct the engine string
print("connecting to postgresql")
connection_url = f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
engine = create_engine(connection_url)
print(f"successfully connected. \nWriting data into db")

#Push to Postgres
# Loop through each CSV and create a specific table for that year
for file in all_files:
    print(os.path.basename(file))

for file_name in all_files:
    years_wanted = ['year_2024.csv','year_2025.csv']
    if os.path.basename(file_name) in years_wanted:

        table_name = "pakistan_co_" + os.path.basename(file_name).replace('.csv', '').replace(' ', '_').lower()
    
        print(f"Reading {os.path.basename(file_name)}...")
        file_path = os.path.join(path, file_name)
        
        # Read the individual year
        df_year = pd.read_csv(file_path)
        
        print(f"Writing {table_name} to database...")
        # Push to Postgres as a unique table
        df_year.to_sql(table_name, engine, if_exists='replace', index=False)
"""
Previous tables creates:
- pakistan_weather_dataset
- multispectral_crop_and_lc_dataset
"""


print("Part 1 is done... keep checking in for the other parts and happy Mastering SQL for Geospatial Data")