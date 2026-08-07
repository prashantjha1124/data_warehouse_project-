/*
===============================================================================
Stored Procedure: bronze.load_bronze
Purpose:
    Loads raw data from CRM and ERP source files into the Bronze layer using
    a full load (TRUNCATE + BULK INSERT). The procedure logs the load duration
    for each table, records the total execution time, and handles errors using
    TRY...CATCH.

Parameters:
    None
    This stored procedure doesn't accept any parameters or return any value.

Usage:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN
	DECLARE @TotalStartTime DATETIME,@TotalEndTime DATETIME;
	DECLARE @StartTime DATETIME ,@EndTime DATETIME;
	BEGIN TRY 
		SET @TotalStartTime=GETDATE();
		PRINT '============================================================';
		PRINT '                 LOADING BRONZE LAYER';
		PRINT '============================================================';

		PRINT ' ';
		PRINT '============================================================';
		PRINT 'Loading Source System CRM';
		PRINT '============================================================';

		SET @StartTime=GETDATE();
			PRINT '-> Loading: bronze.crm_cust_info';

			TRUNCATE TABLE bronze.crm_cust_info;
			BULK INSERT bronze.crm_cust_info
			FROM 'C:\Users\PRASHANT JHA\OneDrive\Desktop\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
			WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
		SET @EndTime=GETDATE();
		
		PRINT '>>Load Duration.. ' + CAST(DATEDIFF(SECOND,@StartTime,@EndTime) AS NVARCHAR) + 'Seconds';

		PRINT '-----------------------------------------------------------';
		
		SET @StartTime=GETDATE();
			PRINT '-> Loading: bronze.crm_prd_info';

			TRUNCATE TABLE bronze.crm_prd_info;
			BULK INSERT bronze.crm_prd_info
			FROM 'C:\Users\PRASHANT JHA\OneDrive\Desktop\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
			WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
		SET @EndTime=GETDATE();
		PRINT '>>Load Duration.. ' + CAST(DATEDIFF(SECOND,@StartTime,@EndTime) AS NVARCHAR) + 'Seconds';
		PRINT '-----------------------------------------------------------';

		SET @StartTime=GETDATE();
			PRINT '-> Loading: bronze.crm_sales_details';

			TRUNCATE TABLE bronze.crm_sales_details;
			BULK INSERT bronze.crm_sales_details
			FROM 'C:\Users\PRASHANT JHA\OneDrive\Desktop\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
			WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
		SET @EndTime=GETDATE();
		PRINT '>>Load Duration.. ' + CAST(DATEDIFF(SECOND,@StartTime,@EndTime) AS NVARCHAR) + 'Seconds';
		PRINT '-----------------------------------------------------------';

		PRINT ' ';
		PRINT '============================================================';
		PRINT 'Loading Source System ERP';
		PRINT '============================================================';

		SET @StartTime=GETDATE();
			PRINT '-> Loading: bronze.erp_CUST_AZ12';

			TRUNCATE TABLE bronze.erp_CUST_AZ12;
			BULK INSERT bronze.erp_CUST_AZ12
			FROM 'C:\Users\PRASHANT JHA\OneDrive\Desktop\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
			WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
		SET @EndTime=GETDATE();
		PRINT '>>Load Duration.. ' + CAST(DATEDIFF(SECOND,@StartTime,@EndTime) AS NVARCHAR) + 'Seconds';
		PRINT '-----------------------------------------------------------';

		SET @StartTime=GETDATE();
			PRINT '-> Loading: bronze.erp_LOC_A101';

			TRUNCATE TABLE bronze.erp_LOC_A101;
			BULK INSERT bronze.erp_LOC_A101
			FROM 'C:\Users\PRASHANT JHA\OneDrive\Desktop\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
			WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
		SET @EndTime=GETDATE();
		PRINT '>>Load Duration.. ' + CAST(DATEDIFF(SECOND,@StartTime,@EndTime) AS NVARCHAR) + 'Seconds';
		PRINT '-----------------------------------------------------------';

		SET @StartTime=GETDATE();
			PRINT '-> Loading: bronze.erp_PX_CAT_G1V2';

			TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
			BULK INSERT bronze.erp_PX_CAT_G1V2
			FROM 'C:\Users\PRASHANT JHA\OneDrive\Desktop\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
			WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
		SET @EndTime=GETDATE();
		PRINT '>>Load Duration.. ' + CAST(DATEDIFF(SECOND,@StartTime,@EndTime) AS NVARCHAR) + 'Seconds';
		PRINT '-----------------------------------------------------------';

		PRINT '============================================================';
		PRINT '           BRONZE LAYER LOADING COMPLETED';
		PRINT '============================================================';
		
		PRINT '.............................................................'; 
		SET @TotalEndTime=GETDATE()

		PRINT 'Total Load Duration..' + CAST(DATEDIFF(MILLISECOND,@TotalStartTime,@TotalEndTime) AS NVARCHAR);

		PRINT '.............................................................'
	END TRY 
	BEGIN CATCH 
		PRINT '============================================================';
		PRINT 'Error Occured During Loading Bronze Layer';
		PRINT 'Error Message ' + ERROR_MESSAGE();
		PRINT 'Error Number ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '============================================================'; 
	END CATCH
END
