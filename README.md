# 💄 Nykaa Marketing Campaign ROI Analysis

## Project Overview

This project analyzes over **55,000 marketing campaigns** to evaluate campaign effectiveness, profitability, customer acquisition efficiency, and marketing ROI.

Using **SQL for data cleaning and analysis** and **Excel for dashboard creation**, the project aims to uncover patterns in campaign performance and provide data-driven recommendations for improving marketing efficiency.

---

## Business Problem

Marketing campaigns generate large amounts of data, but not every campaign contributes equally to business growth.

The objective of this analysis was to answer questions such as:

- Which campaign types generate the highest profit?
- Which customer segments provide the best return?
- Which channels are most effective?
- How strong is the conversion funnel?
- Which campaigns should be scaled or discontinued?
- Does engagement level influence ROI?
- Do shorter or longer campaigns perform better?

---

## Tools Used

| Tool | Purpose |
|--------|--------|
| MySQL | Data Cleaning & Analysis |
| Microsoft Excel | Dashboard and Visualization |
| Pivot Tables | Exploratory Analysis |
| Charts & KPI Cards | Reporting |

---

## Dataset Information

- **Dataset:** Nykaa Marketing Campaign Dataset
- **Records:** 55,555 Campaigns
- **Original Features:** 16 Columns

### Key Variables

- Campaign Type
- Target Audience
- Channel Used
- Impressions
- Clicks
- Leads
- Conversions
- Revenue
- Acquisition Cost
- ROI
- Engagement Score
- Customer Segment
- Language
- Campaign Date

---

# Project Workflow

```text
Raw Dataset
      ↓
Data Cleaning
      ↓
Feature Engineering
      ↓
Exploratory Analysis
      ↓
Pivot Tables
      ↓
Business Insights
      ↓
Dashboard Creation
      ↓
Strategic Recommendations
```

---

# Feature Engineering

Several KPIs were created to better evaluate campaign performance.

### Funnel Metrics

- Click Through Rate (CTR)
- Lead Rate
- Conversion Rate
- Revenue per Conversion

### Profitability Metrics

- Estimated Spend
- Profit
- Profit Margin

### Time-Based Metrics

- Campaign Year
- Campaign Month
- Year-Month

### Performance Segmentation

Campaigns were classified into:

- High ROI
- Normal
- Loss Making

---

# Business Questions Answered

## Campaign Performance

- Which campaign type performs best?
- Which campaigns contribute the most conversions?
- Which campaigns generate the highest profit?

## Customer Analysis

- Which customer segment provides the strongest return?

## Funnel Analysis

- Which campaign type has the strongest lead-to-conversion funnel?

## Channel Analysis

- Which channels generate the highest profit and ROI?

## Language Analysis

- Which campaign language performs best?

## Trend Analysis

- How did campaign performance change over time?

## Engagement Analysis

- Do highly engaging campaigns generate better ROI?

## Duration Analysis

- Do shorter or longer campaigns perform better?

## Budget Optimization

- Which campaigns consume significant budget but provide poor returns?

## Strategic Recommendations

Based on ROI and profitability, campaigns were categorized into:

- Scale
- Monitor
- Review
- Pause / Redesign

---

# SQL Concepts Used

### Data Cleaning

- CREATE TABLE
- STR_TO_DATE()
- YEAR()
- MONTH()
- DATE_FORMAT()

### Feature Engineering

- CASE WHEN
- NULLIF()
- Derived KPI Creation

### Aggregation

- SUM()
- AVG()
- COUNT()

### Grouping

- GROUP BY
- HAVING
- ORDER BY

### Conditional Aggregation

- CASE WHEN

### Subqueries

- Nested Queries

---

# Excel Analysis

Excel was used for:

- Data Validation
- Pivot Tables
- KPI Cards
- Dashboard Design
- Exploratory Analysis
- Business Insight Reporting

---

# Key Insights

- Campaign performance varied significantly across channels and customer segments.
- High engagement campaigns generally produced stronger ROI.
- Funnel efficiency differed across campaign types.
- Several campaigns consumed meaningful budgets while producing weak returns.
- Performance trends changed over time, highlighting the importance of continuous monitoring.
- Strategic categorization helped identify campaigns suitable for scaling and optimization.

---

# Skills Demonstrated

- SQL Data Cleaning
- Feature Engineering
- KPI Development
- Marketing Analytics
- Business Analysis
- Funnel Analysis
- Profitability Analysis
- Customer Segmentation
- Excel Dashboarding
- Data Visualization

---

# Repository Structure

```
Nykaa-Marketing-Campaign-ROI-Analysis
│
├── Dataset
├── SQL Queries
├── Excel Dashboard
├── Images
├── README.md
└── LICENSE
```

---

# Future Improvements

- Advanced SQL Window Functions
- Common Table Expressions (CTEs)
- Tableau / Power BI Dashboard
- Interactive Visualizations
- Predictive Modeling
- Campaign Performance Forecasting

---

## Author

**Abhishek Singh**

BBA (Business Analytics)

Aspiring Business Analyst | Data Analyst

Passionate about using data to solve business problems and drive better decision-making.
