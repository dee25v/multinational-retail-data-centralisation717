# Multinational Retail Data Centralisation

## Table of Contents
- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Description

This project is designed to centralize sales data for a multinational retail company. The aim is to make the sales data accessible from one central location, allowing for easier analysis and more data-driven decision-making. The system stores the current company data in a centralized database, providing a single source of truth for sales data, and includes methods to extract, clean, and query the data.

### Project Goals:
1. **Centralize Data Storage**: Store sales data from various sources into a single database.
2. **Data Extraction and Cleaning**: Extract data from CSV files, APIs, and S3 buckets, and clean the data for analysis.
3. **Database Management**: Set up and manage a PostgreSQL database to store the cleaned data.
4. **Data Analysis**: Query the centralized database to generate up-to-date business metrics.

### What You'll Learn:
- Setting up and managing a PostgreSQL database.
- Extracting data from various sources using Python.
- Cleaning and processing data for analysis.
- Writing SQL queries to extract meaningful insights from data.

## Installation

### Prerequisites:
- Python 3.x
- PostgreSQL
- pgAdmin4
- AWS CLI
- Virtual environment tool (optional but recommended)

### Steps:
1. **Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/multinational-retail-data-centralisation.git
    cd multinational-retail-data-centralisation
    ```

2. **Set Up Virtual Environment** (optional but recommended):
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```

3. **Install Dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4. **Set Up Database**:
    - Initialize a new PostgreSQL database named `sales_data` using pgAdmin4.

5. **Configure Database Credentials**:
    - Create a `db_creds.yaml` file with the following content:
      ```yaml
      RDS_HOST: data-handling-project-readonly.cq2e8zno855e.eu-west-1.rds.amazonaws.com
      RDS_PASSWORD: AiCore2022
      RDS_USER: aicore_admin
      RDS_DATABASE: postgres
      RDS_PORT: 5432
      ```
    - Add `db_creds.yaml` to your `.gitignore` file to ensure it is not tracked by Git.

6. **AWS CLI Configuration**:
    - Ensure you are logged into AWS CLI before attempting to retrieve data from S3.

## Usage

### Extract and Clean Data

1. **Data Extraction**:
    - Extract data from CSV files, APIs, and S3 buckets using methods in the `DataExtractor` class.

2. **Data Cleaning**:
    - Clean the extracted data using methods in the `DataCleaning` class.

3. **Database Operations**:
    - Use the `DatabaseConnector` class to connect to the database and upload the cleaned data.

### Example Code Snippets

```python
from data_extraction import DataExtractor
from database_utils import DatabaseConnector
from data_cleaning import DataCleaning

# Initialize classes
extractor = DataExtractor()
connector = DatabaseConnector()
cleaner = DataCleaning()

# Read database credentials
db_creds = connector.read_db_creds()

# Initialize database engine
engine = connector.init_db_engine()

# Extract data from RDS
user_data_df = extractor.read_rds_table(connector, 'user_data')

# Clean user data
cleaned_user_data = cleaner.clean_user_data(user_data_df)

# Upload cleaned data to database
connector.upload_to_db(cleaned_user_data, 'dim_users')

.
├── data_cleaning.py       # Contains DataCleaning class
├── data_extraction.py     # Contains DataExtractor class
├── database_utils.py      # Contains DatabaseConnector class
├── db_creds.yaml          # Database credentials (not tracked by Git)
├── requirements.txt       # Python dependencies
├── README.md              # Project README file
└── .gitignore             # Git ignore file
