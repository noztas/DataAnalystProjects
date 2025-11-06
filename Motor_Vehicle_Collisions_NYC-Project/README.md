# 🚦 NYC Motor Vehicle Collisions Analysis

**Project Type:** Data Cleaning • Exploratory Data Analysis • Power BI Dashboard  
**Tools Used:** SQL • Power BI • Git  
**Dataset Source:** [NYC Open Data – Motor Vehicle Collisions](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95)
**Note:** The raw CSV file was not included due to GitHub's 100MB limit. You can download the dataset directly from the [NYC Open Data portal](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95).
---

## Project Overview

This project analyzes traffic collision data in New York City to identify dangerous areas, contributing factors to crashes, and victim types most at risk. The dashboard and analysis were developed to support traffic safety planning by the NYC Department of Transportation.

---

## Objectives

- Analyze trends in traffic crashes over time
- Identify boroughs and streets with the highest crash severity
- Determine top causes of accidents and injuries
- Compare impact on pedestrians, cyclists, and motorists
- Recommend data-driven improvements for road safety

---

## Data Preparation (MySQL)

Key cleaning tasks:
- Removed empty or duplicate records
- Standardized vehicle type names (e.g., “Station Wagon/SUV” → “SUV”)
- Converted date/time fields into analyzable formats
- Combined contributing factor columns into a unified structure

🔍 SQL scripts used:
- `01_data_cleaning.sql`
- `02_exploratory_analysis.sql`

---

## 📊 Dashboard Features (Power BI)

**1. Executive Summary Page**
- Total crashes, injuries, fatalities (KPIs)
- Top 5 contributing factors
- Year-over-year trends
- Borough and year slicers

**2. Contributing Factors**
- Comparison of behavioral vs environmental causes
- Breakdown by borough

**3. Victim Risk Analysis**
- Pedestrians, cyclists, motorists injuries/kills by borough

**4. Vehicle Types**
- Common vehicle types in crashes
- Vehicle types vs severity

---

## 📈 Key Findings

- **Brooklyn & Queens** have the highest injury and fatality counts.
- **Driver inattention/distraction** is the top contributing factor.
- **SUVs and trucks** are linked to higher injury severity.
- **Cyclists and pedestrians** in Manhattan are at higher risk.
- Speeding is more common in **Queens**.

---

## 📢 Recommendations

- Increase speed enforcement in high-risk zones
- Add protected bike lanes in high-cyclist areas
- Launch distracted driving awareness campaigns
- Improve signage and visibility at dangerous intersections

---

## ✅ Outcome

This project demonstrates advanced data wrangling and visualization skills using SQL and Power BI. It is now part of my portfolio to showcase end-to-end analytics workflows including:
- Real-world dataset handling
- Clean dashboard design
- Insightful EDA & KPI storytelling
