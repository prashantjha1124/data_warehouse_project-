/*
Description   :
    This script initializes the Data Warehouse environment by:
      1. Creating the DataWarehouse database (if it does not already exist).
      2. Creating the Bronze, Silver, and Gold schemas.
      3. Preparing the database for the ETL pipeline.
*/

-- Switch to the master database
USE master;
GO

-- Create the database only if it does not already exist
IF DB_ID('DataWarehouse') IS NULL
BEGIN
    CREATE DATABASE DataWarehouse;
    PRINT 'Database "DataWarehouse" created successfully.';
END
ELSE
BEGIN
    PRINT 'Database "DataWarehouse" already exists.';
END
GO

-- Switch to the Data Warehouse database
USE DataWarehouse;
GO

/*==============================================================
    Create Schemas
    Bronze : Raw data (No transformations)
    Silver : Cleaned and transformed data
    Gold   : Business-ready data for reporting and analytics
==============================================================*/

-- Create Bronze schema if it does not exist
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze');
END
GO

-- Create Silver schema if it does not exist
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver');
END
GO

-- Create Gold schema if it does not exist
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold');
END
