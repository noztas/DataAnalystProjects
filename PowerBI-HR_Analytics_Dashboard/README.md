# HR Attrition Dashboard (Power BI)

A Power BI dashboard that breaks employee attrition down by department, role, demographics, and pay, so a stakeholder can see where turnover is actually happening instead of just the headline rate.

**Stack:** Power BI · DAX · data modeling
**Data:** a sample HR dataset (employee demographics, role, compensation, tenure, and an attrition flag)

---

![HR Attrition Dashboard](./Assets/dashboard-screenshot.png)

## The question

A single company-wide attrition rate hides the real problem. I built this to answer the next questions: which departments, roles, and employee groups lose the most people, and do pay and tenure line up with that?

## What the dashboard shows

- KPI cards: employee count, attrition rate, average age, average salary, average years of service
- Attrition broken down by department, job role, education, gender, salary band, and years at the company
- A matrix of attrition across job roles and performance ratings
- A department slicer (HR, R&D, Sales) so every view can be filtered

## What I found

- Attrition is concentrated in Sales rather than spread evenly across the company
- Younger employees and those with fewer years at the company leave at higher rates
- Lower salary bands show higher attrition, so pay tracks with retention

These point retention effort at specific groups instead of treating turnover as one company-wide number.

## How it is built

- Reusable DAX measures (attrition rate, average age, average salary) instead of hardcoded values, so every visual stays consistent
- A clean star schema, avoiding bidirectional relationships where they aren't needed, to keep filtering predictable and fast
- Measures filtered carefully so groupings like salary bands and attrition counts don't double-count

---

## About me

**Neslihan Oztas Ates** · Data Analyst · Ingolstadt, Germany

[LinkedIn](https://www.linkedin.com/in/neslihanoztas/) · [Portfolio](https://noztas.github.io/Portfolio-Website/) · [GitHub](https://github.com/noztas/) · neslihanoztas1@gmail.com
