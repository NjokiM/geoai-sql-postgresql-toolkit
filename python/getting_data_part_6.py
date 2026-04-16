import os
from dotenv import load_dotenv
import kagglehub
import pandas as pd
from sqlalchemy import create_engine

load_dotenv()


def get_data(kaggle_dataset_slug):
    print("Starting Kaggle download...")
    print(f"Kaggle dataset is: {kaggle_dataset_slug}")

    path = kagglehub.dataset_download(kaggle_dataset_slug)
    print(f"Dataset downloaded to cache directory: {path}")

    # 👇 Target the nested folder
    processed_dir = os.path.join(path)

    if not os.path.exists(processed_dir):
        raise FileNotFoundError(f"Processed directory not found: {processed_dir}")

    csv_files = [
        os.path.join(processed_dir, f)
        for f in os.listdir(processed_dir)
        if f.lower().endswith(".csv")
    ]

    if not csv_files:
        raise FileNotFoundError(f"No CSV files in {processed_dir}")

    print(f"Found {len(csv_files)} CSV file(s) in processed folder")
    return csv_files


def connect_postgres():
    db_user = os.getenv("DB_USER", "postgres")
    db_password = os.getenv("DB_PASSWORD")
    db_host = os.getenv("DB_HOST", "127.0.0.1")
    db_port = os.getenv("DB_PORT", "5432")
    db_name = os.getenv("DB_NAME", "postgres")

    connection_url = f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
    print("Connecting to PostgreSQL...")
    return create_engine(connection_url)


def push_multiple_to_postgres(csv_files, engine, table_prefix="dataset"):
    for file_path in csv_files:
        file_name = os.path.basename(file_path)

        table_name = (
            f"{table_prefix}_{os.path.splitext(file_name)[0]}"
            .replace(" ", "_")
            .replace("-", "_")
            .lower()
        )

        print(f"Reading: {file_name}")
        df = pd.read_csv(file_path)
        print(f"Loaded dataset with shape: {df.shape}")

        print(f"Pushing data to table: {table_name}")
        df.to_sql(table_name, engine, if_exists="replace", index=False)
        print("Upload complete.\n")


if __name__ == "__main__":
    kaggle_dataset_slug = "csmohamedayman/educational-geospatial-data"
    table_prefix = "Boundary_data"

    csv_files = get_data(kaggle_dataset_slug)
    engine = connect_postgres()
    push_multiple_to_postgres(csv_files, engine, table_prefix)

    print(f"Part 5 is done just starting...\n We got the data, now let's shift focus to the tables ")