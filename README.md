# Bank Risk Intelligence Platform

## Project Overview

An end-to-end credit risk analytics project designed to analyze loan portfolios, identify high-risk customer segments, and visualize key credit risk metrics.

## Business Objective

The objective is to identify customer segments with elevated default risk and provide insights supporting credit risk assessment.

## Technologies

- Python
- Pandas
- PostgreSQL
- SQL
- Power BI
- DAX

## Data Pipeline

→ Raw CSV

→ Python data cleaning

→ PostgreSQL

→ SQL analysis

→ Power BI dashboard

## Key Analyses

- Default rate by loan purpose
- Default rate by credit grade
- Default rate by age group
- Default rate by income group
- High risk customer segments

## Dashboard

[Credit Risk Dashboard](images/dashboard.png)

## Key Findings

- The overall portfolio default rate was approximately 22%.
- Default rates increased substantially as credit grades deteriorated.
- Grade G had the highest observed default rate, while Grade A had the lowest.

## Project Structure

```text
bank-risk-intelligence/
│
├── data/
│   ├── raw/
│   │   └── credit_risk_dataset.csv
│   │
│   └── processed/
│       └── credit_risk_dataset_clean.csv
│
├── src/
│   └── clean_data.py
│
├── sql/
│   └── analysis.sql
│
├── powerbi/
│   └── credit_risk_dashboard.pbix
│
├── images/
│   └── dashboard.png
│
├── README.md
└── requirements.txt
```

## Folder Descriptions

- `data/raw/` - original dataset
- `data/processed/` - cleande dataset
- `src/` - Python data-cleaning script
- `sql/` - SQL analysis queries
- `powerbi/` - Power BI dashboard
- `images/` - project screenshots

## Data Source

Public credit risk dataset used for educational and portfolio purposes.

## Disclaimer

This project uses public and anonymized data. It does not contain real bank customer data.
