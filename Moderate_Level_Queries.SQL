sql_queries/Moderate_Level_Queries.SQL
-- Moderate-level SQL queries will be added here.
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
