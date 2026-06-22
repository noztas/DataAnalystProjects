# SQL Data Cleaning - Layoffs Dataset

A MySQL script that turns the raw 2022 tech-layoffs dataset into a clean, analysis-ready table.

**Tools:** MySQL
**Data:** [Layoffs 2022 on Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022) - company, industry, location, and funding for tech layoffs, 2020-2022

---

## What I did

Working in a staging table so the raw data stayed intact, I:

- removed duplicate rows using `ROW_NUMBER() OVER()`
- standardized inconsistent industry and country names (for example, merging "Crypto Currency" and "CryptoCurrency" into "Crypto")
- converted text dates to a proper `DATE` type with `STR_TO_DATE()`
- handled NULLs, filling them from related rows where possible and removing records that could not be used

## Files

- [`sql_scripts/data_cleaning.sql`](./sql_scripts/data_cleaning.sql) - full cleaning script
- [`data/layoffs_raw.csv`](./data/layoffs_raw.csv) - raw dataset
- [`data/layoffs_cleaned.csv`](./data/layoffs_cleaned.csv) - cleaned output

---

## About me

**Neslihan Oztas Ates** · Data Analyst · Ingolstadt, Germany

[LinkedIn](https://www.linkedin.com/in/neslihanoztas/) · [Portfolio](https://noztas.github.io/Portfolio-Website/) · [GitHub](https://github.com/noztas/) · neslihanoztas1@gmail.com
