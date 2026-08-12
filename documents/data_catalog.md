Gold Layer Data Catalog
Overview

The Gold Layer contains business-ready data designed for analytics, reporting, and data visualization. It follows a dimensional modeling approach, using dimension tables to provide descriptive information and fact tables to store measurable business transactions.

1. gold.dim_customers

Purpose:
Contains a consolidated view of customer information, combining personal, demographic, and geographic attributes for analysis.

Column Name	Data Type	Description
customer_key	INT	Surrogate key used to uniquely identify a customer within the dimension.
customer_id	INT	Original customer identifier from the source system.
customer_number	NVARCHAR(50)	Business identifier assigned to the customer.
first_name	NVARCHAR(50)	Customer's first name.
last_name	NVARCHAR(50)	Customer's last name.
country	NVARCHAR(50)	Country associated with the customer's location.
marital_status	NVARCHAR(50)	Customer's marital status, such as Married or Single.
gender	NVARCHAR(50)	Customer's gender, including values such as Male, Female, or n/a.
birthdate	DATE	Customer's date of birth.
create_date	DATE	Date on which the customer record was created.
2. gold.dim_products

Purpose:
Contains descriptive information about products, including their classification, pricing, and product-line details.

Column Name	Data Type	Description
product_key	INT	Surrogate key used to uniquely identify a product within the dimension.
product_id	INT	Original product identifier from the source system.
product_number	NVARCHAR(50)	Business or reference code used to identify the product.
product_name	NVARCHAR(50)	Name of the product, including relevant characteristics such as type, color, or size.
category_id	NVARCHAR(50)	Identifier associated with the product's category.
category	NVARCHAR(50)	High-level classification of the product, such as Bikes or Components.
subcategory	NVARCHAR(50)	More specific classification of the product within its category.
maintenance_required	NVARCHAR(50)	Indicates whether the product requires maintenance.
cost	INT	Base cost associated with the product.
product_line	NVARCHAR(50)	Product line or series to which the product belongs, such as Road or Mountain.
start_date	DATE	Date from which the product became available or active.
3. gold.fact_sales

Purpose:
Stores sales transactions at the order-line level and serves as the primary fact table for analyzing sales performance.

Column Name	Data Type	Description
order_number	NVARCHAR(50)	Unique reference number assigned to a sales order.
product_key	INT	Surrogate key connecting the sale to the corresponding product dimension record.
customer_key	INT	Surrogate key connecting the sale to the corresponding customer dimension record.
order_date	DATE	Date on which the order was placed.
shipping_date	DATE	Date on which the order was shipped.
due_date	DATE	Date by which the payment was expected.
sales_amount	INT	Total sales value for the individual order line.
quantity	INT	Number of units purchased in the order line.
price	INT	Unit selling price of the product.
Gold Layer Model

The Gold Layer can therefore be viewed as a star schema, where gold.fact_sales acts as the central fact table and connects to the gold.dim_customers and gold.dim_products dimension tables through their respective surrogate keys.
