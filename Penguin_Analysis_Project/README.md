# 🐧 Penguin Classification Analysis Using R

This project explores the Palmer Penguins dataset to investigate morphological differences across species and predict the sex of penguins using various statistical and machine learning techniques. 
It demonstrates an end-to-end data science workflow in R — from data cleaning to statistical modeling and evaluation.

## Data Source
Palmer Penguins dataset
Provided via the {palmerpenguins} R package
https://github.com/allisonhorst/palmerpenguins
---

## Project Overview

### Objectives:
- Explore morphological traits (e.g., bill length, body mass) across penguin species and sexes
- Perform normality testing and statistical comparisons
- Build predictive models to classify penguin sex based on physical features

### Methods Applied:
- Exploratory Data Analysis (EDA)
- Shapiro-Wilk and Kolmogorov-Smirnov normality tests
- ANOVA and post-hoc tests
- Classification tree (CART)
- Logistic regression with odds ratio interpretation
- ROC curve analysis and Youden Index thresholding

### Key Findings
- Body mass, bill depth, and bill length are strong predictors of sex
- Classification tree and logistic regression both show high accuracy
- ROC curve analysis demonstrates excellent model performance (AUC ≈ 1)
- Logistic model provides interpretable odds ratios with confidence intervals
