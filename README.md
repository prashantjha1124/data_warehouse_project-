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

1.**Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.

2.**ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.

3.**Data Modeling**: Developing fact and dimension tables optimized for analytical queries.

4.**Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:

-SQL Development

-Data Architect

-Data Engineering

-ETL Pipeline Developer

-Data Modeling

-Data Analytics

---


🛠️ Important Links & Tools:

## 🛠️ Tools & Resources

* [**Datasets**](https://github.com/prashantjha1124/data_warehouse_project-/tree/main/Datasets): Access the datasets used in this project, including the CSV files.

* [**SQL Server Express**](https://www.microsoft.com/en-us/sql-server/sql-server-downloads): Lightweight SQL Server edition used to host and manage the project database.

* [**SQL Server Management Studio (SSMS)**](https://learn.microsoft.com/en-us/ssms/install/install?view=sql-server-ver16): GUI tool used to manage, query, and interact with the SQL Server database.

* [**GitHub**](https://github.com/): Used for version control, project management, documentation, and maintaining the project source code.

* [**Draw.io**](https://www.drawio.com/): Used to design data architecture, data models, workflows, and project diagrams.

* [**Notion**](https://www.notion.com/): Used to plan, organize, and document the project. It helped track tasks, maintain notes, record important decisions, and keep the development process structured from start to finish.

---

## 🚀 Project Requirements

### 🏗️ Building the Data Warehouse — Data Engineering

**Objective**

Develop a modern data warehouse using **SQL Server** to consolidate sales data from multiple source systems, transform it into a clean and integrated data model, and enable efficient analytical reporting and data-driven decision-making.


## 📋 Specifications

* **Data Sources:** Import data from two source systems (ERP and CRM) provided as CSV files.

* **Data Quality:** Cleanse, standardize, and resolve data quality issues before loading the data into the analytical layer.

* **Integration:** Combine data from both sources into a single, user-friendly data model optimized for analytical queries.

* **Scope:** Focus only on the latest available dataset; historical data tracking and historization are not required.

* **Documentation:** Provide clear documentation of the data model and transformations to support both business stakeholders and analytics teams.


## 🛡️ License

This project is licensed under the **MIT License**. You are free to use, modify, and distribute this project in accordance with the terms of the license.

## 🌟 About Me

Hi there! I'm **Prashant Jha**, a Computer Engineering student with a strong interest in **Data Analytics, SQL, and Data Engineering**. I enjoy working with data, building practical projects, and continuously improving my technical skills. Through my projects, I aim to turn raw data into meaningful insights while developing a strong foundation in modern data technologies.
