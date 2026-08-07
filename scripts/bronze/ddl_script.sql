/*
===============================================================================
Script Name : Bronze Layer - Table Creation
Project     : SQL Data Warehouse Project
Layer       : Bronze
Author      : Prashant Jha

Purpose:
    - Creates all tables required for the Bronze layer of the Data Warehouse.
    - Drops the existing table (if it exists) before creating a new one.
    - The Bronze layer stores raw data exactly as received from the source
      systems without applying any business transformations.
    - These tables will later be populated using the ETL (Bulk Insert) process.

Best Practices:
    - Use OBJECT_ID() to safely check whether a table already exists.
    - Keep Bronze tables close to the source structure.
    - Avoid transformations, joins, and business logic in this layer.
===============================================================================
*/

--=============================================================================
-- CRM TABLES
--=============================================================================

-- Drop the table if it already exists to allow recreation
IF OBJECT_ID ('bronze.crm_cust_info','U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;

-- Stores raw customer information from the CRM system
CREATE TABLE bronze.crm_cust_info
(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),

	-- Customer marital status:
	-- M = Married
	-- S = Single
	cst_marital_status CHAR(1)
	CHECK (cst_marital_status IN ('M','S')),

	-- Customer gender:
	-- M = Male
	-- F = Female
	cst_gndr CHAR(1)
	CHECK (cst_gndr IN ('M','F')),

	-- Record creation date in the source system
	cst_create_date DATE
);

--=============================================================================

IF OBJECT_ID ('bronze.crm_prd_info','U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;

-- Stores raw product information from the CRM system
CREATE TABLE bronze.crm_prd_info
(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(100),
	prd_cost INT,
	prd_line CHAR(1),
	prd_start_dt DATE,
	prd_end_dt DATE
);

--=============================================================================

IF OBJECT_ID ('bronze.crm_sales_details','U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;

-- Stores raw sales transaction details
CREATE TABLE bronze.crm_sales_details
(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

--=============================================================================
-- ERP TABLES
--=============================================================================

IF OBJECT_ID ('bronze.erp_CUST_AZ12','U') IS NOT NULL
	DROP TABLE bronze.erp_CUST_AZ12;

-- Stores customer demographic information from the ERP system
CREATE TABLE bronze.erp_CUST_AZ12
(
	CID NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(20)
);

--=============================================================================

IF OBJECT_ID ('bronze.erp_LOC_A101','U') IS NOT NULL
	DROP TABLE bronze.erp_LOC_A101;

-- Stores customer location information from the ERP system
CREATE TABLE bronze.erp_LOC_A101
(
	CID NVARCHAR(20),
	CNTRY NVARCHAR(50)
);

--=============================================================================

IF OBJECT_ID ('bronze.erp_PX_CAT_G1V2','U') IS NOT NULL
	DROP TABLE bronze.erp_PX_CAT_G1V2;

-- Stores product category and maintenance information
CREATE TABLE bronze.erp_PX_CAT_G1V2
(
	ID NVARCHAR(10),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(10)
);

--=============================================================================
-- End of Bronze Layer Table Creation Script
--=============================================================================
