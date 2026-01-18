CREATE DATABASE SuperstoreDB;
USE SuperstoreDB;
 select COUNT(*) As Total_Orders
 from Sales;

#Total Sales

  SELECT SUM(Sales) AS total_sales
FROM Sales;
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;


#Sales by Category

  SELECT 
    Category,
    SUM(Sales) AS total_sales
FROM Sales
GROUP BY Category
ORDER BY total_sales DESC;

SELECT TOP 10
    Sub_Category,
    SUM(Sales) AS total_sales
FROM Sales
GROUP BY Sub_Category
ORDER BY total_sales DESC;

#Sales by Segment

SELECT 
    Segment,
    SUM(Sales) AS total_sales,
    COUNT(*) AS orders_count,
    AVG(Sales) AS avg_order_value
FROM Sales
GROUP BY Segment
ORDER BY total_sales DESC;


SELECT 
    YEAR(Order_Date) AS order_year,
    SUM(Sales) AS total_sales
FROM Sales
WHERE Order_Date IS NOT NULL
GROUP BY YEAR(Order_Date)
ORDER BY order_year;


#Sales by Region

SELECT 
    Region,
    SUM(Sales) AS total_sales
FROM Sales
GROUP BY Region
ORDER BY total_sales DESC;


SELECT 
    Category,
    SUM(Sales) AS total_sales
FROM Sales
GROUP BY Category
HAVING SUM(Sales) > 500000
ORDER BY total_sales DESC;

SELECT 
    Category,
    SUM(Sales) AS category_sales,
    SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER () AS sales_percentage
FROM Sales
GROUP BY Category;