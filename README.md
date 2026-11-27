# Product Sales SQL & Power BI Dashboard

An end-to-end sales performance analysis project built with **SQLite** and **Power BI** using `product_sales_dataset.csv` (1,000 orders across Jan 2025 – May 2026). The dashboard pairs dynamic time slicers (`YEAR`, `MONTH`, `QUARTER`) and cross-filtering with clean visual layouts and SQL-reconciled metrics.

## Key Metrics
- **Total Sales:** $1,371,032
- **Total Orders:** 1,000
- **Total Units Sold:** 5,455
- **Avg. Sales per Order:** $1,371.03

## SQL & Dashboard Breakdown
- **Overall Sales Summary:** Total orders, units sold, revenue, and average sales per order
- **Sales by Category:** Revenue, order volume, unit volume, average order value, and revenue share (%) across categories (`Sports`, `Beauty`, `Home`, `Books`, `Fashion`, `Electronics`)
- **Sales by Customer City:** Revenue performance, order counts, average order sales, and share (%) by city
- **Monthly Sales Trend:** Year-over-year and month-by-month sales trajectory (`order_year`, `order_month`)
- **Quarterly Sales Performance:** Quarterly revenue, orders, and units across `Q1`–`Q4`

## Repository Structure
- `sales_analysis.sql` — SQLite queries for metric validation and multi-dimensional sales analysis
- `sales_dashboard.pbix` — Interactive Power BI report with DAX measures and dynamic slicers
- `dashboard_overview.png` — Snapshot of the completed dashboard
