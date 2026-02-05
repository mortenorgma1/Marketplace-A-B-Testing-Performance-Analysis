# Marketplace A/B Testing & Performance Analysis

## Project Overview
This project analyses the results of an A/B experiment conducted in a marketplace environment to evaluate a new supply–demand rebalancing algorithm. The goal is to understand how changes to vehicle allocation impact key performance indicators such as ride completion rate, average wait time, and revenue across different demand levels.

The project combines PostgreSQL (SQL) for data generation and analysis with Power BI for interactive visualization and stakeholder-ready insights.

---

## Experiment Description
- **Variant A (Control):** Existing marketplace rebalancing logic  
- **Variant B (Test):** New demand-based rebalancing algorithm  

Users are randomly assigned to variants. Each user generates 1–2 ride events, resulting in approximately 400 total events. The dataset is intentionally designed to reflect realistic marketplace trade-offs rather than a single clearly winning variant.

---

## Data Model (SQL)

### Tables

#### experiments
Stores experiment metadata such as experiment name and date range.

#### regions
Contains region names and demand levels:
- High
- Medium
- Low

#### users
Maps users to regions.

#### experiment_events
Fact table containing experiment interactions:
- Variant (A or B)
- Ride completion flag (1 = completed, 0 = not completed)
- Wait time in minutes
- Revenue
- Event date

The schema follows a star-like structure to support efficient joins and segmentation by demand level and experiment variant.

---

## Key Metrics
The following metrics were calculated using SQL and DAX:

- **Completion Rate**  
  Calculated as the average of a binary ride completion flag.

- **Average Wait Time**  
  Mean wait time per event, measured in minutes.

- **Average Revenue per Event**

- **Total Events**  
  Used to validate sample size and data distribution.

---

## Analysis Performed
- Overall A/B comparison of key performance indicators  
- Segmentation by demand level (High / Medium / Low)  
- Identification of performance trade-offs between user experience and operational outcomes  
- Validation of data distributions prior to drawing conclusions  

---

## Power BI Dashboard

### Dashboard Features

#### KPI Cards
- Total Events  
- Completion Rate  
- Average Wait Time  
- Average Revenue per Event  

#### A/B Comparison Charts
- Completion Rate by Variant  
- Average Wait Time by Variant  

#### Regional Performance Matrix
- Completion rate and average wait time broken down by demand level and variant.

#### Interactive Slicers
- Variant (A / B)  
- Demand Level (High / Medium / Low)  

The dashboard supports self-service analytics and allows stakeholders to explore results dynamically.

---

## Key Insight
The experiment highlights a clear trade-off. Variant B improves average wait time, particularly in high-demand regions, but negatively impacts completion rates in medium-demand regions. Based on these findings, a targeted rollout strategy is recommended instead of a global deployment.

---

## Tools and Technologies
- PostgreSQL for data modeling and SQL analysis  
- SQL for joins, aggregations, and conditional logic  
- Power BI Desktop for data modeling and visualization  
- DAX for explicit measures and KPI calculations  

---

## Skills Demonstrated
- A/B testing analysis  
- Marketplace and supply–demand reasoning  
- SQL data modeling and aggregation  
- Power BI dashboard design  
- Data-driven decision making  
- Stakeholder-focused insight communication  

---

## Intended Audience
This project is relevant for product managers, operations teams, and data and analytics teams and demonstrates practical experimentation analysis in a marketplace context.
<img width="1258" height="727" alt="image" src="https://github.com/user-attachments/assets/83a99bf4-e726-4d42-bba7-f6b152e52f76" />



