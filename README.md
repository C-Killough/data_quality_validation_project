# Data Quality Validation Project

## Overview
Simulates a pre-load invoice data validation process for ERP to Workday conversions. Demonstrates SQL-based data quality checks: duplicate detection, null/missing field checks, invalid currency, negative amounts, and incorrect date formats.

## Tools
- PostgreSQL
- PGAdmin4
- GitHub (this repo)

## How to run
1. Run `01_create_data.sql`
2. Run `02_validate_data_quality.sql`
3. Run `03_issues_report.sql`
4. Verify with `SELECT * FROM issues_report;`
5. Export CSV if desired

## Validation Rules
- Detect duplicate invoice_id values.
- Flag missing critical fields: vendor, amount, po_number.
- Identify negative amount values.
- Validate currency against accepted list: USD, EUR, GBP.
- Detect incorrect invoice_date formats; only YYYY-MM-DD is valid.

## Deliverables
- SQL scripts
- Sample data CSV: Sample_data.csv
- Final CSV output: Results.csv

## Why this matters for Workday
Workday conversions require pre-load data validation to prevent load failures and downstream accounting errors. This project demonstrates essential skills in identifying and resolving data quality issues, a core responsibility of Workday conversion and technical analyst roles.