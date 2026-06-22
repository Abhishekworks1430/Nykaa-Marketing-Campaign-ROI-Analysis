# 💄 From Impressions to Profit: A Marketing Analytics Case Study

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Excel](https://img.shields.io/badge/Tool-Excel-green)
![Analytics](https://img.shields.io/badge/Domain-Marketing%20Analytics-orange)
![Status](https://img.shields.io/badge/Project-Completed-success)

---

# Overview

Marketing campaigns generate millions of impressions and clicks, but not every campaign contributes equally to business growth.

This project analyzes **55,555 marketing campaigns** to evaluate campaign profitability, conversion efficiency, customer segments, and channel effectiveness. The objective was to identify high-performing campaigns, uncover optimization opportunities, and develop data-driven recommendations for improving marketing ROI.

Using **MySQL for data cleaning and analysis** and **Excel for dashboarding and visualization**, this project explores the complete marketing funnel from impressions to conversions and profitability.

---

# Business Problem

Marketing teams invest significant budgets across multiple channels and customer segments, but measuring campaign effectiveness remains challenging.

This analysis aims to answer questions such as:

- Which campaign types generate the highest profit?
- Which customer segments provide the best returns?
- Which channels and languages perform best?
- How efficient is the conversion funnel?
- Which campaigns are consuming budget but generating weak returns?
- Do engagement levels and campaign duration influence ROI?
- Which campaigns should be scaled, monitored, reviewed, or redesigned?

---

# Dataset Information

- **Dataset:** Nykaa Marketing Campaign Dataset
- **Records:** 55,555 campaigns
- **Original Features:** 16 columns

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

# Tools Used

| Tool | Purpose |
|--------|--------|
| MySQL | Data Cleaning & Analysis |
| Microsoft Excel | Dashboard Creation |
| Pivot Tables | Exploratory Analysis |
| Charts | Data Visualization |
| KPI Cards | Performance Reporting |

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

# Data Cleaning and Feature Engineering

A cleaned dataset was created and several business KPIs were engineered.

### Funnel Metrics

- Click Through Rate (CTR)
- Lead Rate
- Conversion Rate
- Revenue Per Conversion

### Profitability Metrics

- Estimated Spend
- Profit
- Profit Margin

### Time Metrics

- Campaign Year
- Campaign Month
- Year-Month

### Campaign Segmentation

Campaigns were classified as:

- High ROI
- Normal
- Loss Making

---

# Business Questions Answered

## Campaign Performance

- Which campaign types perform best?
- Which campaigns contribute the most conversions?
- Which campaigns generate the highest profit?

## Customer Analysis

- Which customer segments provide the strongest business return?

## Channel Analysis

- Which channels generate the highest ROI and profit?

## Language Analysis

- Which campaign languages perform best?

## Funnel Analysis

- Which campaign types have the strongest lead-to-conversion funnel?

## Trend Analysis

- How has campaign performance changed over time?

## Budget Optimization

- Which campaigns consume significant budget while producing poor returns?

## Engagement Analysis

- Do highly engaging campaigns generate stronger ROI?

## Duration Analysis

- Do shorter or longer campaigns perform better?

## Strategic Recommendations

Campaigns were categorized into:

- Scale
- Monitor
- Review
- Pause / Redesign

---

# Dashboard

## Overall Dashboard

![Dashboard](Images/dashboard.png)

---

# Key Performance Indicators

| KPI | Value |
|------|------:|
| Total Revenue | ₹2,865.64 Cr |
| Total Profit | ₹1,895.72 Cr |
| Average ROI | 2.71x |
| Total Conversions | 573.81 L |
| Loss-Making Campaigns | 23.8% |

---

# Key Insights

### Campaign Performance
- Campaign profitability varied significantly across campaign types.
- Social Media campaigns delivered the highest average ROI.

### Customer Segments
- Working Women generated the strongest average returns.
- Premium Shoppers consistently performed well.

### Funnel Analysis
- Conversion efficiency differed across campaign types.
- Funnel analysis highlighted opportunities to improve customer acquisition.

### Budget Optimization
- Several campaigns consumed meaningful budgets while generating negative ROI.
- Loss-making campaigns were identified for redesign or discontinuation.

### Engagement Analysis
- Campaigns with higher engagement scores generally produced stronger returns.

### Duration Analysis
- Campaign duration had a measurable impact on campaign performance and conversion efficiency.

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

# Skills Demonstrated

- SQL Data Cleaning
- Feature Engineering
- KPI Development
- Marketing Analytics
- Funnel Analysis
- Profitability Analysis
- Customer Segmentation
- Excel Dashboarding
- Business Analysis
- Data Visualization

---

# Repository Structure

```
📂 Dataset
📂 SQL Queries
📂 Excel Dashboard
📂 Images
📄 README.md
```

---

# Future Improvements

- Add Window Functions
- Add Common Table Expressions (CTEs)
- Build an interactive Power BI dashboard
- Implement campaign ranking analysis
- Perform predictive modeling for campaign ROI

---

## Author

### Abhishek Singh

BBA (Business Analytics)

Aspiring Business Analyst | Data Analyst

Passionate about transforming data into actionable insights and solving business problems through analytics.
