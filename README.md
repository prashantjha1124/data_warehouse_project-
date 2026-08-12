# SQL Data Warehouse & Analytics Project

A hands-on **Data Warehouse and Analytics project built with SQL Server**, following the **Medallion Architecture** approach.

The project demonstrates the complete data warehousing workflow — from loading raw CSV data into the Bronze layer, cleaning and transforming it in the Silver layer, and finally creating business-ready analytical views in the Gold layer.

---

## 📌 Project Overview

The goal of this project is to build a structured and reliable data warehouse that combines data from **CRM and ERP source systems** and prepares it for analytical reporting.

The project focuses on:

- Data ingestion and extraction
- Data cleansing and transformation
- Data integration
- Data quality checks
- Dimensional modeling
- Star schema design
- SQL-based analytics
- Documentation of the data warehouse

---

## 🏗️ Data Architecture

This project follows a **Medallion Architecture** consisting of three layers:

<img width="807" height="420" alt="image" src="https://github.com/user-attachments/assets/beb8f415-a05b-4a7c-9dda-937f017cd1a7" />



### 🥉 Bronze Layer

The Bronze layer stores the source data in its raw form.

**Responsibilities:**
- Load CSV files into SQL Server
- Preserve source data structure
- Perform initial data ingestion
- Provide a reliable raw-data layer

### 🥈 Silver Layer

The Silver layer prepares the raw data for analytical use.

**Responsibilities:**
- Clean inconsistent data
- Handle missing and invalid values
- Standardize formats
- Remove duplicates
- Apply business rules
- Integrate CRM and ERP datasets

### 🥇 Gold Layer

The Gold layer contains the final business-ready data model.

It follows a **Star Schema** consisting of:

- `gold.dim_customers`
- `gold.dim_products`
- `gold.fact_sales`

These views are designed to support SQL analysis and reporting.

---


📖 Project Overview
This project involves:

Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
ETL Pipelines: Extracting, transforming, and loading data from source systems into the warehouse.
Data Modeling: Developing fact and dimension tables optimized for analytical queries.
Analytics & Reporting: Creating SQL-based reports and dashboards for actionable insights.
🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:

SQL Development
Data Architect
Data Engineering
ETL Pipeline Developer
Data Modeling
Data Analytics
