# 📊 Cell Growth Analysis

This project is part of a portfolio of hands-on training completed during the **Applied Bioinformatics and Biostatistics** course (February–September 2024) at **CQ Beratung + Bildung** in Berlin. It showcases statistical modeling and visualization of cell growth response under different treatment conditions using R and Quarto.

---

## Project Overview

The aim of this project is to analyze the effects of **treatment** and **passage** on cell growth, using a dataset from a controlled biological experiment. The analysis demonstrates the use of:

- Linear regression and ANOVA
- Linear mixed-effects models (LMMs) with random intercepts and slopes
- Model interpretation using the `easystats` suite
- Visualizations using `ggplot2`, `patchwork`, and `ggbeeswarm`
- Quarto for reproducible reporting

---

## 📁 Included Files

Cell_Growth_Analysis.qmd – Quarto script containing the full analysis, code, plots, and comments.

Cell_Growth_Analysis.docx – Word document generated from the Quarto script.

---

## Dataset Notice

The original dataset (`Zellbeads.sav`) is not included in this repo due to privacy.  
However, the Quarto script automatically **simulates a realistic dataset** if the original is missing — ensuring full reproducibility without data disclosure.

---

## Topics Covered

- **EDA:** Exploring the relationship between passage and cell growth  
- **Linear modeling:** Understanding how cell growth changes with treatment and passage  
- **ANOVA and model diagnostics**  
- **Random intercept and slope models** using `lmer()` and `nlme::lme()`  
- **Visualizing fixed and random effects** across conditions

---

## 🛠️ Tools & Packages Used

- `lme4`, `nlme`, `easystats`, `ggplot2`, `patchwork`, `dplyr`, `forcats`
- Reproducible report written in **Quarto**, rendered to Word (`.docx`)


