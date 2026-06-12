# Task-03-Anchal-Damani
# Project 3: SQL Data Analysis 

##  Overview
This project demonstrates SQL proficiency using **Google BigQuery**.  
The dataset contains customer orders with details such as products, payment methods, order statuses, referral sources, and coupon codes.  
The goal was to query and analyze the dataset to extract meaningful business insights.

---

##  Dataset Schema
| Column Name   | Description                          |
|---------------|--------------------------------------|
| OrderID       | Unique order identifier              |
| Date          | Order date (numeric format)          |
| CustomerID    | Unique customer code                 |
| Product       | Item purchased                       |
| Quantity      | Number of units                      |
| UnitPrice     | Price per unit                       |
| TotalPrice    | Quantity × UnitPrice                 |
| PaymentMethod | Cash, Card, Gift Card, Online        |
| OrderStatus   | Delivered, Cancelled, Returned, etc. |
| ReferralSource| Instagram, Facebook, Google, Email   |
| CouponCode    | Discount applied                     |

---

##  Queries Log 

### Q1: Dataset Preview
```sql
SELECT * 
FROM `orders_dataset.orders_table`
LIMIT 10;

<img width="865" height="540" alt="Screenshot 2026-06-13 040639" src="https://github.com/user-attachments/assets/c687aa14-a586-46c7-8773-7a48abed1e77" />


-- Orders by payment method
SELECT PaymentMethod, COUNT(*) AS total_orders
FROM `orders_dataset.orders_table`
GROUP BY PaymentMethod;

<img width="847" height="458" alt="Screenshot 2026-06-13 041734" src="https://github.com/user-attachments/assets/4b60d2fd-a0a3-401c-9ffd-441a98a284ad" />


-- Top 3 referral sources by revenue
SELECT ReferralSource, SUM(TotalPrice) AS total_revenue
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered'
GROUP BY ReferralSource
ORDER BY total_revenue DESC
LIMIT 3;

<img width="855" height="355" alt="Screenshot 2026-06-13 041829" src="https://github.com/user-attachments/assets/eea73386-756f-416d-ae8a-49f0fbe0795f" />


-- Top 5 customers by total spending
SELECT CustomerID, SUM(TotalPrice) AS total_spent
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered'
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 5;

<img width="861" height="475" alt="Screenshot 2026-06-13 041939" src="https://github.com/user-attachments/assets/fe6a07cc-9dc4-4b75-8fae-1ed534f76bb2" />


-- Referral sources with highest average order value
SELECT ReferralSource, AVG(TotalPrice) AS avg_order_value
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered'
GROUP BY ReferralSource
ORDER BY avg_order_value DESC;

<img width="815" height="400" alt="Screenshot 2026-06-13 042524" src="https://github.com/user-attachments/assets/6f02081a-ee89-4550-a265-f6006c889c79" />


-- Orders with unusually high or low unit prices
SELECT OrderID, Product, UnitPrice
FROM `orders_dataset.orders_table`
WHERE UnitPrice < 20 OR UnitPrice > 600;

<img width="862" height="307" alt="Screenshot 2026-06-13 042649" src="https://github.com/user-attachments/assets/cd585488-4383-4207-829b-a94418fa0aeb" />


-- Orders with unusually high or low unit prices
SELECT OrderID, Product, UnitPrice
FROM `orders_dataset.orders_table`
WHERE UnitPrice < 20 OR UnitPrice > 600;

<img width="883" height="315" alt="Screenshot 2026-06-13 042744" src="https://github.com/user-attachments/assets/07954428-a91e-43a7-a5eb-d650403838f8" />


##  Insights Summary
- **Products** → Laptops generate the highest revenue, Monitors are most frequent.  
- **Payment Methods** → Credit/Debit Cards are reliable; Cash/Gift Cards linked with cancellations.  
- **Order Status** → Delivered ~30%, Cancelled ~25%, Returned ~20%.  
- **Referral Sources** → Instagram & Facebook drive sales but also high returns; Google is stable.  
- **Customers** → Top 5 customers contribute a large share of revenue (loyalty program potential).

---

##  Anomalies & Observations
- Printer price = **12.1** (too low).  
- Laptop price = **664.42** (too high).  
- Coupon **SAVE10** linked with many cancellations.  
- Gift Card payments → high cancellation/return rate.  
- Certain customers have **>3 cancelled orders** (possible churn risk).




























