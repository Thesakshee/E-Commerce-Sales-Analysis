-- 1. Total Sales and Profitability by Country
SELECT 
    Country, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM financials
GROUP BY Country
ORDER BY Total_Profit DESC;

-- 2. Discount Impact on Profit (Data for your Scatter Plot)
SELECT 
    Product, 
    AVG(Discount_Band) AS Avg_Discount, 
    SUM(Profit) AS Net_Profit
FROM financials
GROUP BY Product;

-- 3. Monthly Sales Growth Trend
SELECT 
    Month_Name, 
    Year, 
    SUM(Sales) AS Monthly_Revenue
FROM financials
GROUP BY Year, Month_Number, Month_Name
ORDER BY Year, Month_Number;
