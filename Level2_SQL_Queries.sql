USE ecommerce;

-- Task 1: Basic Queries --

-- Q1: Total sales by region
SELECT region, SUM(sales) AS total_sales
FROM ecommerce_data_clean
GROUP BY region
ORDER BY total_sales DESC;

-- Q2: Total profit by category
SELECT category, SUM(profit) AS total_profit
FROM ecommerce_data_clean
GROUP BY category
ORDER BY total_profit DESC;

-- Q3: Top 10 customers by sales
SELECT customer_name, SUM(sales) AS total_sales
FROM ecommerce_data_clean
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Q4: Total orders per segment
SELECT segment, COUNT(order_id) AS total_orders
FROM ecommerce_data_clean
GROUP BY segment
ORDER BY total_orders DESC;

-- Q5: Average discount by category
SELECT category, ROUND(AVG(discount), 2) AS avg_discount
FROM ecommerce_data_clean
GROUP BY category;

-- Task 2: Advanced Queries --

-- Q1: Most profitable sub-categories
SELECT sub_category, 
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin_pct
FROM ecommerce_data_clean
GROUP BY sub_category
ORDER BY total_profit DESC;

-- Q2: Sales by ship mode
SELECT ship_mode,
       COUNT(order_id) AS total_orders,
       SUM(sales) AS total_sales,
       ROUND(AVG(shipping_cost), 2) AS avg_shipping_cost
FROM ecommerce_data_clean
GROUP BY ship_mode
ORDER BY total_sales DESC;

-- Q3: Year-wise sales growth
SELECT YEAR(order_date) AS year,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM ecommerce_data_clean
GROUP BY YEAR(order_date)
ORDER BY year;

-- Q4: Loss making orders
SELECT order_id, customer_name, 
       product_name, sales, profit
FROM ecommerce_data_clean
WHERE profit < 0
ORDER BY profit ASC
LIMIT 10;

-- Q5: Country wise top sales
SELECT country,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       COUNT(order_id) AS total_orders
FROM ecommerce_data_clean
GROUP BY country
ORDER BY total_sales DESC
LIMIT 10;