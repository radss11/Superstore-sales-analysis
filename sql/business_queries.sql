-- Q1a: Sales and Profit by Region
SELECT
    Region,
    ROUND(SUM(Sales), 2)                     AS Total_Sales,
    ROUND(SUM(Profit), 2)                    AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2)     AS Profit_Ratio_Pct
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Q1b: Flag underperforming regions (below average profit ratio)
WITH region_stats AS (
    SELECT
        Region,
        ROUND(SUM(Sales), 2)                     AS Total_Sales,
        ROUND(SUM(Profit), 2)                    AS Total_Profit,
        ROUND(SUM(Profit)/SUM(Sales)*100, 2)     AS Profit_Ratio_Pct
    FROM sales
    GROUP BY Region
),
avg_ratio AS (
    SELECT ROUND(AVG(Profit_Ratio_Pct), 2) AS Avg_Ratio
    FROM region_stats
)
SELECT
    r.*,
    a.Avg_Ratio,
    CASE
        WHEN r.Profit_Ratio_Pct < a.Avg_Ratio THEN 'Underperforming'
        ELSE 'Healthy'
    END AS Status
FROM region_stats r, avg_ratio a
ORDER BY r.Profit_Ratio_Pct ASC;

-- Q2: Discount buckets vs profitability
SELECT
    CASE
        WHEN Discount = 0     THEN '0% (No discount)'
        WHEN Discount <= 0.10 THEN '0-10%'
        WHEN Discount <= 0.20 THEN '10-20%'
        WHEN Discount <= 0.30 THEN '20-30%'
        ELSE                       '30%+'
    END                                   AS Discount_Band,
    COUNT(*)                              AS Num_Orders,
    ROUND(AVG(Sales), 2)                  AS Avg_Sales,
    ROUND(AVG(Profit), 2)                 AS Avg_Profit,
    ROUND(AVG(Profit/Sales*100), 2)       AS Avg_Margin_Pct
FROM sales
GROUP BY Discount_Band
ORDER BY Avg_Margin_Pct DESC;

-- Q3a: Top 10 loss-making products
SELECT
    "Product Name",
    COUNT(*)              AS Times_Ordered,
    ROUND(SUM(Sales), 2)  AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 10;

-- Q3b: Loss breakdown by sub-category
SELECT
    Category,
    "Sub-Category",
    COUNT(DISTINCT "Product Name") AS Loss_Products,
    ROUND(SUM(Profit), 2)          AS Total_Loss
FROM sales
WHERE Profit < 0
GROUP BY Category, "Sub-Category"
ORDER BY Total_Loss ASC;

-- Q4: Top 5 most profitable sub-categories
SELECT
    "Sub-Category",
    ROUND(SUM(Profit), 2)  AS Total_Profit,
    ROUND(SUM(Sales), 2)   AS Total_Sales,
    COUNT(*)               AS Total_Orders
FROM sales
GROUP BY "Sub-Category"
ORDER BY Total_Profit DESC
LIMIT 5;
