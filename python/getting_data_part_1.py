import os
from dotenv import load_dotenv
import kagglehub
import pandas as pd
from sqlalchemy import create_engine

load_dotenv()


#Fetch the dataset path (kagglehub downloads it to a system cache automatically)
#path only exists programmatically not locally 
"""
The get_data function does the following:
1. Downloads data off Kaggle and save it in a variable called path which is essentially a directory
2. get csv file(s) in path/directory
3.create pandas dataframe from the file..

I've added print statements as a fun way to trace what's happening for beginners :)
"""
def get_data(kaggle_dataset_slug):
    print("Starting kaggle download...")
    print(f"Kaggle dataset is:{kaggle_dataset_slug}")
    path = kagglehub.dataset_download(kaggle_dataset_slug)
    print(f"Dataset downloaded to cache directory: {path}")


    csv_files = [
        os.path.join(path, f)
        for f in os.listdir(path)
        if f.lower().endswith(".csv")
    ]
    if not csv_files:
        raise FileNotFoundError(f"No csv files in{path}")
    
    print(f"Found {len(csv_files)} CSV file(s)")
    print(f"Reading: {os.path.basename(csv_files[0])}")

    df = pd.read_csv(csv_files[0])
    print(f"Loaded a dataset with shape:{df.shape} where the shape is in the form of rows*columns")
    return df
    
    # Creating a connection to the local PostgreSQL
def connect_postgres():
    db_user = os.getenv("DB_USER", 'postgres')
    db_password = os.getenv("DB_PASSWORD")
    db_host = os.getenv("DB_HOST")

    db_port = os.getenv("DB_PORT")
    db_name = os.getenv("DB_NAME")

    connection_url = f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
    print("Connecting to PostgreSQL...")
    return create_engine(connection_url)

def push_to_postgres(df, engine, table_name):
    print(f"Pushing data to table: {table_name}")
    df.to_sql(table_name, engine, if_exists="replace", index=False)
    print("Upload complete.")
     

if __name__ == "__main__":
    kaggle_dataset_slug = "abdulahadiltaf/sentinel-2-multispectral-crop-and-land-cover-dataset" # "username/dataset-name"


    data = get_data(kaggle_dataset_slug)
    engine = connect_postgres()
    push_to_postgres(data, engine, "multispectral_crop_and_lc_dataset")

    print("Part 1 is done... keep checking in for the other parts and happy Mastering SQL for Geospatial Data")