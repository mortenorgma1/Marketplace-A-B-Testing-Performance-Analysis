# Power BI Dashboard – Marketplace A/B Testing

## Overview
This Power BI dashboard visualizes the results of a marketplace A/B test evaluating a supply–demand rebalancing algorithm. The dashboard is designed to support self-service analytics and help stakeholders compare control and test variants across key performance metrics.

---

## Dashboard Content
The dashboard includes:
- KPI cards showing total events, completion rate, average wait time, and average revenue
- A/B comparison charts for completion rate and average wait time
- A regional performance matrix breaking down results by demand level and variant
- Interactive slicers for variant and demand level filtering

---

## Key Insight
The analysis highlights a trade-off between user experience and operational outcomes. The test variant reduces average wait time, particularly in high-demand regions, but negatively impacts completion rates in medium-demand regions. This supports a targeted rollout strategy rather than a global deployment.

---

## Tools Used
- Power BI Desktop
- DAX for explicit KPI measures
- PostgreSQL as the data source

---

## Purpose
This dashboard demonstrates practical experience with A/B test analysis, marketplace segmentation, and stakeholder-focused data visualization.
