-- Creating the Sales Table
CREATE TABLE ecom_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_region VARCHAR(50),
    category VARCHAR(50),
    sales_amount DECIMAL(10,2),
    profit DECIMAL(10,2)
);

-- KPI 1: Monthly Sales Growth
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales_amount) AS total_revenue,
    (SUM(sales_amount) - LAG(SUM(sales_amount)) OVER (ORDER BY DATE_TRUNC('month', order_date))) / LAG(SUM(sales_amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)) * 100 AS growth_percentage
FROM ecom_sales
GROUP BY 1;

-- KPI 2: Top Performing Categories
SELECT category, SUM(profit) as total_profit
FROM ecom_sales
GROUP BY category
ORDER BY total_profit DESC;
