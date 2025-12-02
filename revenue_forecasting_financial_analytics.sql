-- Monthly Revenue
SELECT month_year, SUM(revenue) AS monthly_revenue
FROM revenue_data
GROUP BY month_year
ORDER BY month_year;

-- Revenue by Country
SELECT country, SUM(revenue) AS total_revenue
FROM revenue_data
GROUP BY country
ORDER BY total_revenue DESC;

-- Revenue by Segment
SELECT segment, SUM(revenue) AS segment_revenue
FROM revenue_data
GROUP BY segment;

-- Top Revenue-Generating Customers
SELECT customer_id, SUM(revenue) AS total_revenue
FROM revenue_data
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Seasonality Analysis (Month Only)
SELECT EXTRACT(MONTH FROM date) AS month, SUM(revenue) AS monthly_revenue
FROM revenue_data
GROUP BY month
ORDER BY month;

-- Customer Churn Revenue
SELECT 
    SUM(CASE WHEN churned = 1 THEN revenue END) AS churned_revenue,
    SUM(CASE WHEN churned = 0 THEN revenue END) AS active_revenue
FROM revenue_data;

-- ARPU (Average Revenue Per User)
SELECT month_year, SUM(revenue) / SUM(users) AS arpu
FROM revenue_data
GROUP BY month_year
ORDER BY month_year;

-- LTV 
SELECT 
    customer_id,
    SUM(revenue) / COUNT(DISTINCT month_year) * COUNT(DISTINCT month_year) AS LTV
FROM revenue_data
GROUP BY customer_id;

-- Net Revenue Retention (NRR)
SELECT
    SUM(CASE WHEN churned = 0 THEN revenue END) / 
    SUM(revenue) AS nrr
FROM revenue_data;

-- New Revenue vs Churned Revenue
SELECT month_year,
    SUM(CASE WHEN churned = 1 THEN revenue END) AS churned_revenue,
    SUM(CASE WHEN churned = 0 THEN revenue END) AS retained_revenue
FROM revenue_data
GROUP BY month_year
ORDER BY month_year;

