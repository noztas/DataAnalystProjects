# DataAnalystProjects
# 🧹 Data Cleaning in MySQL

## 📌 Project Overview
This project focuses on **cleaning and preparing raw data using MySQL**. The dataset contained issues like **duplicates, NULL values, inconsistent formatting, and incorrect data entries**, which were cleaned using SQL techniques to ensure **better data quality and accuracy** for analysis.

---

## 🗂 Dataset Information
The dataset used in this project had common data quality issues:
- ❌ **Duplicate records**
- 🛑 **NULL or missing values**
- 🔠 **Inconsistent formatting** (capitalization, extra spaces, typos)
- 🚫 **Incorrect or irrelevant data entries**

---

## 🛠 SQL Techniques Used
To clean the data, the following **SQL techniques** were applied:
- ✅ **Removing duplicates** (`DELETE`, `ROW_NUMBER()`)
- ✅ **Handling NULL values** (`COALESCE()`, `IFNULL()`)
- ✅ **Standardizing text formatting** (`LOWER()`, `UPPER()`, `TRIM()`)
- ✅ **Filtering incorrect data** (`WHERE` conditions)
- ✅ **Updating incorrect data** (`UPDATE`, `REPLACE()`)

---

## 📜 Key SQL Queries
### 🔹 **1. Removing Duplicates**
```sql
DELETE FROM customers
WHERE id NOT IN (
    SELECT id FROM (
        SELECT id, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) as rn
        FROM customers
    ) temp
    WHERE rn = 1
);

### 🔹 2. Handling NULL Values
UPDATE customers
SET phone_number = 'Unknown'
WHERE phone_number IS NULL;

### 🔹 3. Standardizing Text Format
UPDATE customers
SET city = UPPER(city);

### 🔹 4. Filtering Incorrect Data
DELETE FROM customers
WHERE age < 0 OR age > 120;

## 📊 Results After Cleaning
✅ No duplicate records
✅ All NULL values replaced with meaningful data
✅ Consistent text formatting for uniformity
✅ Filtered out incorrect or irrelevant data

## 🚀 How to Use This Project
Download the SQL script data_cleaning.sql
Import the dataset into MySQL
Run the SQL queries step-by-step
Verify the cleaned data using SELECT queries
