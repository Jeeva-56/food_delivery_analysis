-- Active: 1779699435542@@127.0.0.1@3306@food_delivery_analysis
# 1. Identify top-spending customers

SELECT
    Customer_ID,
    sum(Final_Amount) as Total_Amount
FROM food_delivery
GROUP BY Customer_ID
ORDER BY Total_Amount DESC
LIMIT 10;

# 2. Analyze age group vs order value

SELECT
    Cus_Age_Group as Age_Group,
    sum(Order_Value) as Total_Amount
FROM food_delivery
GROUP BY Cus_Age_Group
ORDER BY Total_Amount DESC ;

# Weekend vs weekday order patterns

SELECT
    Order_Day,
    COUNT(*) as Total_Orders,
    sum(Order_Value) as Total_Amount,
    AVG(Order_Value) as Total_Average
FROM food_delivery
GROUP BY Order_Day
ORDER BY Order_Day;

# 4. Monthly revenue trends

SELECT
    Ord_Month as Order_Month,
    count(*) as Total_Orders,
    SUM(Order_Value) as Total_Amount
FROM food_delivery
GROUP BY Ord_Month
ORDER BY Total_Amount DESC;

# 5. Impact of discounts on profit

SELECT
    Discount_Applied as Discount_amount,
    SUM(Final_Amount) as Total_Amount,
    sum((Final_Amount) * (Profit_Margin)) as Profit
FROM food_delivery
GROUP BY Discount_Applied
ORDER BY Total_Amount DESC;


# 6. High-revenue cities and cuisines

SELECT
    City,
    Cuisine_Type,
    SUM(Final_Amount) as Total_Amount,
    COUNT(*) as Total_Orders
FROM food_delivery
GROUP BY City, Cuisine_Type
ORDER BY Total_Orders DESC
LIMIT 5;


# 7. Average delivery time by city

SELECT
    City,
    AVG(Delivery_Time_Min) as Average_Delivery_Time
FROM food_delivery
GROUP BY City
ORDER BY Average_Delivery_Time;

# 8. Distance vs delivery delay analysis

SELECT
    CASE
        WHEN Distance_km BETWEEN 0 and 1 THEN '0-2 KM'
        WHEN Distance_km BETWEEN 2 and 5 THEN '2-5 KM'
        WHEN Distance_km BETWEEN 5 and 10 THEN '5-10 KM'
        WHEN Distance_km BETWEEN 10 and 15 THEN '10-15 KM'
        WHEN Distance_km BETWEEN 15 and 20 THEN '15-20 KM'
        WHEN Distance_km BETWEEN 20 and 25 THEN '20-25 KM'
        WHEN Distance_km BETWEEN 25 and 30 THEN '25-30 KM'
        WHEN Distance_km BETWEEN 30 and 35 THEN '30-35 KM'
        WHEN Distance_km BETWEEN 35 and 40 THEN '35-40 KM'
        ELSE '40+ KM'
        END as Distance_Range,
    COUNT(*) as Total_Orders,
    AVG(Delivery_Time_Min) as Average_Time
FROM food_delivery
GROUP BY Distance_Range
ORDER BY Total_Orders DESC;


# 9. Delivery rating vs delivery time

SELECT
    CASE
        WHEN Delivery_Time_Min BETWEEN 0 AND 20 THEN '0-20 Min'
        WHEN Delivery_Time_Min BETWEEN 20 AND 40 THEN '20-40 Min'
        WHEN Delivery_Time_Min BETWEEN 40 AND 60 THEN '40-60 Min'
        ELSE '60+ Min'
        END AS Time_Period,
    COUNT(*) as Total_Orders,
    AVG(Delivery_Rating) as Average_Rating
FROM food_delivery
GROUP BY Time_Period
ORDER BY Time_Period;


# 10. Top-rated restaurants

SELECT
    Restaurant_Name,
    Restaurant_Rating
FROM food_delivery
ORDER BY Restaurant_Rating DESC
LIMIT 5;

# 11. Cancellation rate by restaurant

SELECT
    Restaurant_ID,
    COUNT(*) as Total_Cancelled_Orders
FROM food_delivery
WHERE Order_Status = "Cancelled"
GROUP BY Order_Status, Restaurant_ID
ORDER BY Total_Cancelled_Orders DESC
LIMIT 5;


# 12. Cuisine-wise performance

SELECT
    Cuisine_Type,
    COUNT(*) as Total_Orders,
    SUM(Final_Amount) as Total_Amount,
    AVG(Final_Amount) as Average_Amount
FROM food_delivery
GROUP BY Cuisine_Type
ORDER BY Total_Amount DESC ;

# 13. Peak hour demand analysis

SELECT
    Peak_Hour,
    COUNT(*) as Total_Orders
FROM food_delivery
GROUP BY Peak_Hour
ORDER BY Total_Orders DESC;

# 14. Payment mode preferences

SELECT
    Payment_Mode,
    COUNT(*) as Total_Orders,
    sum(Final_Amount) as Total_Amount,
    AVG(Final_Amount) as Average_Amount
FROM food_delivery
GROUP BY Payment_Mode
ORDER BY Total_Orders DESC;

# 15. Cancellation Reason analysis

SELECT
    Cancellation_Reason,
    COUNT(*) as Total_Orders
FROM food_delivery
GROUP BY Cancellation_Reason
ORDER BY Total_Orders DESC
LIMIT 3 OFFSET 1;