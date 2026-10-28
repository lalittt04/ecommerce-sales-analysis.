```sql
-- PROJECT: E-Commerce Sales Analysis
-- DATABASE: MySQL

-- 1. Create Database
CREATE DATABASE ecommerce_db;

USE ecommerce_db;

-- 2. Create Sales Table
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    city VARCHAR(50)
);

-- 3. Insert Sample Data
INSERT INTO sales VALUES
(1, 'Amit', 'Laptop', 'Electronics', 1, 55000, '2026-01-10', 'Pune'),
(2, 'Priya', 'Headphones', 'Electronics', 2, 1500, '2026-01-12', 'Mumbai'),
(3, 'Rahul', 'Shoes', 'Fashion', 1, 2500, '2026-01-15', 'Pune'),
(4, 'Sneha', 'Watch', 'Accessories', 2, 1200, '2026-02-01', 'Delhi'),
(5, 'Amit', 'Keyboard', 'Electronics', 1, 1800, '2026-02-05', 'Mumbai'),
(6, 'Neha', 'T-Shirt', 'Fashion', 3, 700, '2026-02-10', 'Pune'),
(7, 'Rahul', 'Mouse', 'Electronics', 2, 800, '2026-02-15', 'Delhi'),
(8, 'Priya', 'Jeans', 'Fashion', 1, 2000, '2026-03-01', 'Mumbai'),
(9, 'Sneha', 'Bag', 'Accessories', 1, 1800, '2026-03-05', 'Pune'),
(10, 'Neha', 'Monitor', 'Electronics', 1, 12000, '2026-03-10', 'Delhi');

-- 4. View All Sales
SELECT * FROM sales;

-- 5. Calculate Total Revenue
SELECT SUM(quantity * price) AS total_revenue
FROM sales;

-- 6. Find Revenue by Product Category
SELECT category,
       SUM(quantity * price) AS category_revenue
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;

-- 7. Find Top-Selling Products by Quantity
SELECT product_name,
       SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
ORDER BY total_quantity DESC;

-- 8. Calculate Revenue by City
SELECT city,
       SUM(quantity * price) AS city_revenue
FROM sales
GROUP BY city
ORDER BY city_revenue DESC;

-- 9. Calculate Monthly Revenue
SELECT DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
       SUM(quantity * price) AS monthly_revenue
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- 10. Find the Highest-Value Order
SELECT order_id, customer_name, product_name,
       quantity * price AS order_value
FROM sales
ORDER BY order_value DESC
LIMIT 1;

-- 11. Find Customer Spending
SELECT customer_name,
       SUM(quantity * price) AS total_spending
FROM sales
GROUP BY customer_name
ORDER BY total_spending DESC;
```
