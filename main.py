import pandas as pd
from sqlalchemy import text, exc
import os
from common import directory_path, sql_server_connection, send_email, archive_dir
import zipfile
import shutil

def Data_validation(file_info):
    try:
        """
        Running Data Quality checks on upcomming source data. Examples: checking files are not empty. Checking there is mapping for the source file. etc.
        Args:
            file_info (dic{path: "", name ""}) 
        """
        # 1. Check if the file is empty:
        no_of_records = len(pd.read_csv(file_info["path"])) 
        if no_of_records < 1:
            send_email(subject='Dada Validation Error', body=f'There was an error while reading file {file_info["path"]}: the file is empty.')
            exit(0)
        
        # 2. Check if there is a mapping for the file:
        sql_connection = sql_server_connection()
        result = sql_connection.execute(text(f"SELECT * FROM [dbo].[mapping_lookup] WHERE file_name = '{file_info['name']}';"))
        if len(result.all()) < 1:
            send_email(subject='Dada Validation Error', body=f'There is no mapping for file {file_info["path"]} in table: [dbo].[mapping_lookup].')
            exit(0)            

        # 3. Other validations could including checking for duplicates, specific formats (phone, address etc.) or other business specific requirements.

        return no_of_records
    except Exception as e:
        send_email(subject='data pipeline failure message', body=f'An error occurred during data verification phase: {e}')


def get_files_list():
    """
    List all files in the directory
    """
    try:
        files_list = [{"path":os.path.join(directory_path, filename), "name":filename.replace('.csv','')} for filename in os.listdir(directory_path) if os.path.isfile(os.path.join(directory_path, filename))]
        return files_list
    except Exception as e:
        print(f'An error occurred in get_files_list(): {e}')
        send_email(subject='data pipeline failure message', body=f'An error occurred in get_files_list(): {e}')


def load_file_to_sqlserver(file_info):
    """
    loading files to sql server
    """
    try:
        sql_connection = sql_server_connection()
        sql_connection.execute(text(f"DROP TABLE IF EXISTS {file_info['name']};"))
        file_chunks = pd.read_csv(file_info["path"],chunksize=10)
        for chunk in file_chunks:
            chunk.to_sql(file_info["name"], sql_connection, if_exists="append")
        sql_connection.commit()
        sql_connection.close()
    except Exception as e:
        print(f'An error occured in load_file_to_sqlserver: {e}')     
        send_email(subject='data pipeline failure message', body=f'An error occured in load_file_to_sqlserver: {e}')

def load_dim_prospective_orgs(file_name):
    """load the dim table"""
    try:
        sql_connection = sql_server_connection()
        sql_connection.execute(text(f"EXEC usp_load_staging @file_name = '{file_name}';"))
        sql_connection.commit()
        sql_connection.execute(text(f"EXEC usp_load_dim_prospecttive_orgs;"))
        sql_connection.commit()
        sql_connection.close()
    except exc.SQLAlchemyError as e:
        print(f'An error occured in load_dim_prospective_orgs: {str(e.orig)}')
        send_email(subject='data pipeline failure message', body=f'An error occured in load_dim_prospective_orgs: {str(e.orig)}')

def data_verification(no_of_records):
    """
    There are a number of scenarios that we can check for data validation. Here is an example for checking the number of records:
    """
    try:
        # 1. Check the number of records from the source file matches the number of loaded records:
        sql_connection =  sql_server_connection()
        result = sql_connection.execute(text(f"SELECT * FROM {file_info['name']};")) 
        if no_of_records != len(result.all()):
            send_email(subject='Data Verification Failure', body=f'The number of records from file do not match the number of records loaded to the database.')
            exit(0)
        # 2. Other verifications could check various business requirements for example phone/address formats. 
    except Exception as e:
        send_email(subject='Data Verification Failure', body=f'An error occured during data verification: {e}')

def archive_file(file_path, archive_dir):
    """archiving the files"""
    try:
        zip_file_name = file_path.replace(".csv","") + '_zip'
        with zipfile.ZipFile(zip_file_name, 'w') as zipf:
            zipf.write(file_path)
        shutil.move(zip_file_name, archive_dir)
    except Exception as e:
        send_email(subject='Data Pipeline Failure', body=f'An error occured in archive_file(): {e}')

if __name__ == "__main__":
    try: 
        files_list = get_files_list()
        for file_info in files_list:
            no_of_records = Data_validation(file_info)
            load_file_to_sqlserver(file_info) 
            load_dim_prospective_orgs(file_name=file_info['name'])
            data_verification(no_of_records)
            archive_file(file_info['path'], archive_dir)
    except Exception as e:
        send_email(subject='data pipeline failure message', body='an error occured during execution of data pipeline: {e}')

