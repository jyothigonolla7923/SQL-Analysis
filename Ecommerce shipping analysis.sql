CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE shipping_data (
    ID INT,
    Warehouse_block VARCHAR(5),
    Mode_of_Shipment VARCHAR(20),
    Customer_care_calls INT,
    Customer_rating INT,
    Cost_of_the_Product INT,
    Prior_purchases INT,
    Product_importance VARCHAR(20),
    Gender CHAR(1),
    Discount_offered INT,
    Weight_in_gms INT,
    Reached_on_Time_Y_N TINYINT
);


-- Average Product Cost by Shipment Mode
SELECT Mode_of_Shipment, AVG(Cost_of_the_Product) AS Avg_Product_Cost
FROM Shipping_data
GROUP BY Mode_of_Shipment
ORDER BY Avg_Product_Cost DESC;


-- Total Shipments and Delays by Warehouse 
SELECT Warehouse_block,
       COUNT(*) AS Total_Shipments,
       SUM(CASE WHEN Reached_on_Time_Y_N = 0 THEN 1 ELSE 0 END) AS Delayed_Shipments
FROM Shipping_data
GROUP BY Warehouse_block
ORDER BY Delayed_Shipments DESC;


-- Average Rating by Product Importance
SELECT Product_importance, AVG(Customer_rating) AS Avg_Rating
FROM Shipping_data
GROUP BY Product_importance
ORDER BY Avg_Rating DESC;


-- Customers Who Purchased Above Average Product Cost
SELECT *
FROM Shipping_data
WHERE Cost_of_the_Product > (
    SELECT AVG(Cost_of_the_Product)
    FROM Shipping_data
);


-- Create a View – On-Time Delivery Performance
CREATE VIEW OnTime_Performance AS
SELECT ID, Mode_of_Shipment, Warehouse_block, Reached_on_Time_Y_N
FROM Shipping_data
WHERE Reached_on_Time_Y_N = 1;


-- Optimize Query – Add Index for Faster Lookup on Delays
CREATE INDEX idx_reached_on_time 
ON Shipping_data (Reached_on_Time_Y_N);

-- Find All On-Time Deliveries
SELECT *
FROM Shipping_data
WHERE Reached_on_Time_Y_N = 1;

-- Avg Product Cost for On-Time vs Delayed
SELECT Reached_on_Time_Y_N, AVG(Cost_of_the_Product) AS avg_cost
FROM Shipping_data
GROUP BY Reached_on_Time_Y_N;





