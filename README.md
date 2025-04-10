# 📦 Ecommerce Shipping Analysis (SQL)

This project contains SQL-based analysis of the [Ecommerce Shipping Dataset](https://www.kaggle.com/datasets/safaeahb/ecommerce-shipping-sql-power-bi) from Kaggle.  
The goal was to explore, analyze, and optimize queries for better understanding of shipment performance.

---

## 📁 Dataset Source

- **Kaggle Link**: [Ecommerce Shipping SQL + Power BI](https://www.kaggle.com/datasets/safaeahb/ecommerce-shipping-sql-power-bi)

---

## 🛠️ Tools Used

- MySQL Workbench
- SQL
- CSV file import
- Views and indexing for query optimization

---

## 📌 Key SQL Concepts Applied

### ✅ Basic Queries & Filtering
- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- Filtered by `Reached_on_Time_Y_N`, `Cost_of_the_Product`, and other key fields.

### ✅ Subqueries
Used subqueries to find:
- Products above average cost
- Heaviest shipments
- Most used shipment modes

```sql
SELECT *
FROM Shipping_data
WHERE Cost_of_the_Product > (
    SELECT AVG(Cost_of_the_Product)
    FROM Shipping_data
);
```

### ✅ Views
Created views for reusable filters like on-time shipments:

```sql
CREATE VIEW OnTime_Performance AS
SELECT ID, Mode_of_Shipment, Warehouse_block, Reached_on_Time_Y_N
FROM Shipping_data
WHERE Reached_on_Time_Y_N = 1;
```

### ✅ Indexing for Optimization

```sql
CREATE INDEX idx_reached_on_time 
ON Shipping_data (Reached_on_Time_Y_N);
```

Improved performance of queries filtering by shipment delivery status.

---

## 🔍 Sample Insights

- Count of on-time vs delayed deliveries
- High-discount delayed shipments
- Top 5 most expensive products
- Customer care patterns based on delivery time

---

## 📂 Files Included

- `Ecommerce shipping analysis.sql`: Contains all SQL queries used
- `README.md`: Project overview and instructions

---

## 📊 Next Steps

- Power BI or Tableau integration for visualization
- Advanced customer segmentation and forecasting

---

## 🤝 Contribution

Feel free to fork or submit a pull request for new insights or optimizations!
