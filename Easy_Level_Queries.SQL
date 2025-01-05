sql_queries/easy_level_queries.sql
-- Easy-level SQL queries will be added here.
-- Top-Selling Product by Revenue
SELECT product_name, SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Most Frequent Customers
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;
