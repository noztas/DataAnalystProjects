# 🛠 SQL Data Cleaning Project - Layoffs Dataset

## 📌 Overview
This project focuses on **cleaning and transforming raw data** from the **Layoffs Dataset (2022)** using MySQL.  
The goal is to improve **data quality** by removing duplicates, handling missing values, and standardizing formats.

## 📂 Dataset - From Kaggle
- **Source**: [Layoffs 2022 Dataset on Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022)
- **Description**: This dataset provides information on **tech industry layoffs** from 2020-2022, including company names, industries, locations, and funding.

## 🔧 SQL Techniques Used
✔ **Removing Duplicates** – Used `ROW_NUMBER() OVER()` to find and delete duplicate records.  
✔ **Standardizing Data** – Fixed inconsistent industry names, country names, and date values.  
✔ **Handling NULL Values** – Replaced missing data where possible.  
✔ **Date Formatting** – Converted string dates to proper `DATE` format using `STR_TO_DATE()`.  
✔ **Data Cleaning Automation** – Used `UPDATE`, `DELETE`, and `JOIN` operations to clean the data.  

## 📂 Project Files
- **[`sql_scripts/data_cleaning.sql`](./sql_scripts/data_cleaning.sql)** – Full SQL script for data cleaning.
- **[`data/layoffs_raw.csv`](./data/layoffs_raw.csv)** – Raw dataset 
- **[`data/layoffs_cleaned.csv`](./data/layoffs_cleaned.csv)** – Cleaned dataset.

## 🛠 Tools Used
- **Database**: MySQL  
- **SQL Functions**: `DELETE`, `UPDATE`, `ALTER TABLE`, `JOIN`, `ROW_NUMBER() OVER()`, `STR_TO_DATE()`

---

## 🚀 Data Cleaning Steps

### **1️⃣ Create a Staging Table**
```sql
CREATE TABLE layoffs_staging 
LIKE layoffs;
INSERT INTO layoffs_staging 
SELECT * FROM layoffs;
---

### **2️⃣ Identify & Remove Duplicates**
```sql
DELETE FROM layoffs_staging
WHERE row_num >= 2;

### **3️⃣ Standardize Industry Names**
```sql
UPDATE layoffs_staging
SET industry = 'Crypto'
WHERE industry IN ('Crypto Currency', 'CryptoCurrency');

### **4️⃣ Convert Date Format**
```sql
UPDATE layoffs_staging
SET date = STR_TO_DATE(date, '%m/%d/%Y');












