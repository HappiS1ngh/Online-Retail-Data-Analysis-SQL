sql_queries/Advanced_level_queries.sql
-- Advanced-Level Queries

-- Products with High Return Rates
SELECT product_name, COUNT(return_id) AS return_count
FROM returns
GROUP BY product_name
HAVING return_count > (SELECT AVG(return_count) FROM returns);

-- Average Order Value by Customer Segment
SELECT customer_segment, AVG(order_value) AS avg_order_value
FROM orders
GROUP BY customer_segment
ORDER BY avg_order_value DESC;

-- Monthly Revenue Trends
SELECT MONTH(order_date) AS month, SUM(sales_amount) AS monthly_revenue
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;

-- Customer Lifetime Value (CLV) Analysis
SELECT customer_id, SUM(order_value) AS lifetime_value
FROM orders
GROUP BY customer_id
ORDER BY lifetime_value DESC;

-- Category-Wise Sales Insights
SELECT category_name, SUM(sales_amount) AS category_revenue
FROM products
JOIN sales ON products.product_id = sales.product_id
GROUP BY category_name
ORDER BY category_revenue DESC;

-- Sales Forecasting for Next Quarter
WITH quarterly_sales AS (
    SELECT QUARTER(order_date) AS quarter, YEAR(order_date) AS year, SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY year, quarter
)
SELECT quarter, AVG(total_sales) AS predicted_sales
FROM quarterly_sales
GROUP BY quarter;
