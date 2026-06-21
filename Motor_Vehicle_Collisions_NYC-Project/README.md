# NYC Motor Vehicle Collisions Analysis

SQL cleaning plus a Power BI dashboard over NYC Open Data collision records, built to find where and why crashes turn serious and who gets hurt.

**Stack:** SQL (MySQL) · Power BI
**Data:** [NYC Open Data - Motor Vehicle Collisions](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95). The raw CSV is not in the repo because it is over GitHub's 100 MB limit; download it from the portal.

---

## The question

Where are collisions most severe, what is causing them, and who is most at risk? I wanted findings a city traffic-safety team could act on, not just crash counts.

## Data preparation (SQL)

Starting from the raw NYC Open Data export, I:

- removed empty and duplicate records
- standardized vehicle type names (for example, "Station Wagon/SUV" to "SUV")
- converted date and time fields into analyzable formats
- merged the separate contributing-factor columns into one structure

Scripts: `01_data_cleaning.sql`, `02_exploratory_analysis.sql`

## Dashboard

- **Executive summary:** total crashes, injuries, and fatalities, top contributing factors, year-over-year trend, and borough/year slicers
- **Contributing factors:** behavioral vs environmental causes, broken down by borough
- **Victim risk:** pedestrian, cyclist, and motorist injuries and fatalities by borough
- **Vehicle types:** the most common vehicle types in crashes and how they relate to severity

## What I found

- Brooklyn and Queens have the highest injury and fatality counts
- Driver inattention and distraction is the single largest contributing factor
- SUVs and trucks are linked to more severe injuries
- Pedestrians and cyclists in Manhattan are at the highest relative risk
- Speeding shows up most in Queens

## What I would recommend

- Target speed enforcement in the highest-risk zones
- Add protected bike lanes where cyclist injuries cluster
- Run distracted-driving awareness campaigns
- Improve signage and visibility at the worst intersections

---

## About me

**Neslihan Oztas Ates** · Data Analyst · Ingolstadt, Germany

[LinkedIn](https://www.linkedin.com/in/neslihanoztas/) · [Portfolio](https://noztas.github.io/Portfolio-Website/) · [GitHub](https://github.com/noztas/) · neslihanoztas1@gmail.com
