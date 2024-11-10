import pandas as pd
from sqlalchemy import create_engine

# Connect to PostgreSQL
engine = create_engine("postgresql://psdbt:admin@localhost:5432/dbt_demo")

# Define paths to each Parquet file
parquet_files = {
    "channels": "/home/guga/data_engineering/dbt/shared/parquet/channels.parquet",
    "customers": "/home/guga/data_engineering/dbt/shared/parquet/customers.parquet",
    "products": "/home/guga/data_engineering/dbt/shared/parquet/products.parquet",
    "resellers": "/home/guga/data_engineering/dbt/shared/parquet/resellers.parquet",
    "resellers_type1": "/home/guga/data_engineering/dbt/shared/parquet/resellers_type1.parquet",
    "resellers_type2": "/home/guga/data_engineering/dbt/shared/parquet/resellers_type2.parquet"
}

# Load each Parquet file into a table in the 'raw' schema
for table_name, file_path in parquet_files.items():
    print(f"Loading {table_name} from {file_path}")
    df = pd.read_parquet(file_path)
    df.to_sql(table_name, engine, schema="raw", if_exists="replace", index=False)
    print(f"Table '{table_name}' loaded successfully!")
