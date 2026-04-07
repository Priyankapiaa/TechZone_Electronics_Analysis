USE Tech_Zone;
SELECT * FROM techzone_sales;
SELECT COUNT(*) FROM techzone_sales;

SELECT TOP 5 * FROM techzone_sales
WHERE Order_ID = 'Order_ID' OR Order_ID IS NULL;

DELETE FROM techzone_sales
WHERE Order_ID = 'Order_ID' OR Order_ID IS NULL;

SELECT COUNT(*) FROM techzone_sales;

-- Revenue & Profit by Category

SELECT Category,
       SUM(Revenue) AS Total_Revenue,
       SUM(Profit) AS Total_Profit,
       ROUND((SUM(Profit)/SUM(Revenue))*100, 2) AS Total_Profit_Margin,
       SUM(Units_Sold) AS Total_Units
FROM techzone_sales
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- City Performance

SELECT City,
       SUM(Revenue) AS Total_Revenue,
       SUM(Profit) AS Total_Profit,
       ROUND((SUM(Profit)/SUM(Revenue))*100, 2) AS Profit_Margin,
       COUNT(Order_ID) AS Total_Orders
FROM techzone_sales
GROUP BY City
ORDER BY Total_Profit DESC;

-- Discount Impact on Profit
SELECT Discount_Pct,
       COUNT(Order_ID) AS Total_Orders,
       ROUND(SUM(Revenue), 2) AS Total_Revenue,
       ROUND(SUM(Profit), 2) AS Total_Profit,
       ROUND((SUM(Profit)/SUM(Revenue))*100, 2) AS Profit_Margin
FROM techzone_sales
GROUP BY Discount_Pct
ORDER BY Discount_Pct ASC;

--Inventory Stock Analysis
SELECT Product,
       Category,
       SUM(Stock_Available) AS Total_Stock,
       SUM(Units_Sold) AS Total_Sold,
       Stock_Status,
       ROUND((SUM(Profit)/SUM(Revenue))*100, 2) AS Profit_Margin
FROM techzone_sales
GROUP BY Product, Category, Stock_Status
ORDER BY Total_Stock DESC;

--Monthly Sales Trend
SELECT Month, Quarter,
       ROUND(SUM(Revenue), 2) AS Total_Revenue,
       ROUND(SUM(Profit), 2) AS Total_Profit,
       SUM(Units_Sold) AS Total_Units
FROM techzone_sales
GROUP BY Month, Quarter
ORDER BY MIN(MONTH(Date)) ASC;

--Top & Bottom 3 Products by Profit
-- Top 3
SELECT TOP 3 Product, 
       ROUND(SUM(Revenue),2) AS Revenue,
       ROUND(SUM(Profit),2) AS Profit,
       ROUND((SUM(Profit)/SUM(Revenue))*100,2) AS Margin
FROM techzone_sales
GROUP BY Product
ORDER BY Profit DESC;

-- Bottom 3
SELECT TOP 3 Product,
       ROUND(SUM(Revenue),2) AS Revenue,
       ROUND(SUM(Profit),2) AS Profit,
       ROUND((SUM(Profit)/SUM(Revenue))*100,2) AS Margin
FROM techzone_sales
GROUP BY Product
ORDER BY Profit ASC;

--Customer Type Analysis
SELECT Customer_Type,
       COUNT(Order_ID) AS Total_Orders,
       ROUND(SUM(Revenue),2) AS Total_Revenue,
       ROUND(AVG(Rating),2) AS Avg_Rating
FROM techzone_sales
GROUP BY Customer_Type
ORDER BY Total_Revenue DESC;

--Sales Rep Performance
SELECT Sales_Rep,
       COUNT(Order_ID) AS Total_Orders,
       ROUND(SUM(Revenue),2) AS Total_Revenue,
       ROUND(SUM(Profit),2) AS Total_Profit,
       ROUND((SUM(Profit)/SUM(Revenue))*100,2) AS Profit_Margin
FROM techzone_sales
GROUP BY Sales_Rep
ORDER BY Total_Profit DESC;