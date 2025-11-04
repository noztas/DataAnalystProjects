# HR Analytics Dashboard – Attrition Insights in Power BI

![Dashboard Screenshot](./Assets/dashboard-screenshot.png)

## Overview

This Power BI dashboard was created to analyze and visualize employee attrition trends in a fictional HR dataset. It focuses on turning raw employee data into actionable insights—helping business teams understand what’s driving workforce exits across departments, roles, and demographics.

Rather than just replicating standard KPIs, I designed this dashboard with stakeholder thinking in mind—bringing together attrition patterns, departmental breakdowns, and drillable visuals to support retention strategy decisions.

## Key Features

- **KPI Cards**: Track core HR metrics — Employee Count, Attrition Rate, Avg Age, Avg Salary, and Avg Years of Service.
- **Interactive Filters**: Department-level slicing for Human Resources, R&D, and Sales.
- **Attrition Insights**:
  - By Education Level
  - By Gender
  - By Salary Bands
  - By Job Role
  - By Years at Company
- **Dynamic Matrix Table**: View attrition frequency across job roles and performance rating buckets.

## Tools & Techniques

- **DAX Measures**: Custom measures like `Attrition Rate`, `Avg Age`, and `Avg Salary` were created to avoid hardcoded logic and enable reusability.
- **Relationships & Data Modeling**: Clean star schema to support performance and intuitive navigation. Avoided bidirectional relationships where not needed.
- **Visual Design**: Chose a dark-themed layout for screen readability, with color-coded visuals to draw focus without overwhelming the viewer.
- **Data Integrity**: Ensured aggregations (e.g., salary groupings, attrition counts) didn’t produce skewed results by using properly filtered measures.

## Why This Project?

I wanted to build something more than a standard KPI dashboard — something that mirrors the actual challenges HR teams face. By embedding filters, storytelling visuals, and clean metric logic, this dashboard allows stakeholders to answer real questions like:

- Which job roles are losing employees most often?
- Are younger employees leaving more?
- Does salary band impact retention?

This dashboard reflects my ability to think through the problem, model the data, and present answers — not just charts.
