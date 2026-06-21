# US Emissions Analysis (Databricks SQL)

A Databricks SQL dashboard over EPA greenhouse-gas data that compares US states on emissions, with the focus on per-capita figures rather than raw totals.

**Stack:** Databricks SQL
**Data:** EPA greenhouse gas emissions, at state and county level

---

## The question

Ranking states by total emissions mostly rewards being large. I wanted to see who emits the most per person, which is a fairer basis for comparison, and where the two views disagree.

## What I did

In Databricks SQL I:

- aggregated total emissions by county and state
- calculated emissions per person to compare areas of different sizes
- identified the top 10 states by total emissions and their share of the national total
- examined the relationship between population and per-capita emissions

## Dashboard

- US map of emissions by state
- Share of emissions across the top emitters
- Top counties by CO2e
- Scatter plot of population against per-capita emissions

## What I found

- The top 10 states account for over half of total US emissions
- Texas and Florida are among the largest total emitters
- Densely populated counties tend to have lower per-capita emissions, which points to economies of scale
- A few small counties have very high per-capita emissions, which usually signals concentrated industrial activity

---

## About me

**Neslihan Oztas Ates** · Data Analyst · Ingolstadt, Germany

[LinkedIn](https://www.linkedin.com/in/neslihanoztas/) · [Portfolio](https://noztas.github.io/Portfolio-Website/) · [GitHub](https://github.com/noztas/) · neslihanoztas1@gmail.com
