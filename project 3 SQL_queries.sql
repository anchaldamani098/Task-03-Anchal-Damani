SELECT * FROM `fifth-name-490517-e4.orders_dataset.orders_table` LIMIT 10;

SELECT OrderID, Product, TotalPrice
FROM `fifth-name-490517-e4.orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered';

SELECT OrderID, CustomerID, TotalPrice
FROM `fifth-name-490517-e4.orders_dataset.orders_table`
ORDER BY TotalPrice DESC
LIMIT 5;

-- Orders by payment method
SELECT PaymentMethod, COUNT(*) AS total_orders
FROM `orders_dataset.orders_table`
GROUP BY PaymentMethod;

-- Average order value
SELECT AVG(TotalPrice) AS avg_order_value
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered';

SELECT Product, SUM(TotalPrice) AS total_sales
FROM `orders_dataset.orders_table`
GROUP BY Product
HAVING SUM(TotalPrice) > 2000;

-- Top 3 referral sources by revenue
SELECT ReferralSource, SUM(TotalPrice) AS total_revenue
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered'
GROUP BY ReferralSource
ORDER BY total_revenue DESC
LIMIT 3;

-- Cancelled orders percentage
SELECT 
  COUNTIF(OrderStatus = 'Cancelled') / COUNT(*) * 100 AS cancelled_percentage
FROM `orders_dataset.orders_table`;

-- Top 5 customers by total spending
SELECT CustomerID, SUM(TotalPrice) AS total_spent
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered'
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 5;

-- Average basket size (items per order)
SELECT AVG(ItemsInCart) AS avg_cart_size
FROM `orders_dataset.orders_table`;

-- Monthly sales trend for Laptops
SELECT Date, SUM(TotalPrice) AS monthly_sales
FROM `orders_dataset.orders_table`
WHERE Product = 'Laptop' AND OrderStatus = 'Delivered'
GROUP BY Date
ORDER BY Date;

-- Products with highest cancellation rate
SELECT Product,
       COUNTIF(OrderStatus = 'Cancelled') * 100.0 / COUNT(*) AS cancellation_rate
FROM `orders_dataset.orders_table`
GROUP BY Product
ORDER BY cancellation_rate DESC
LIMIT 5;

-- Revenue by coupon code
SELECT CouponCode, SUM(TotalPrice) AS total_revenue
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered'
GROUP BY CouponCode
ORDER BY total_revenue DESC;

-- Payment method reliability (delivered vs cancelled)
SELECT PaymentMethod,
       COUNTIF(OrderStatus = 'Delivered') AS delivered_orders,
       COUNTIF(OrderStatus = 'Cancelled') AS cancelled_orders
FROM `orders_dataset.orders_table`
GROUP BY PaymentMethod;

-- Referral sources with highest average order value
SELECT ReferralSource, AVG(TotalPrice) AS avg_order_value
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered'
GROUP BY ReferralSource
ORDER BY avg_order_value DESC;

-- Referral sources with most returns
SELECT ReferralSource, COUNTIF(OrderStatus = 'Returned') AS returned_orders
FROM `orders_dataset.orders_table`
GROUP BY ReferralSource
ORDER BY returned_orders DESC;

-- Orders with unusually high or low unit prices
SELECT OrderID, Product, UnitPrice
FROM `orders_dataset.orders_table`
WHERE UnitPrice < 20 OR UnitPrice > 600;

-- Customers with more than 3 cancelled orders
SELECT CustomerID, COUNT(*) AS cancelled_orders
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Cancelled'
GROUP BY CustomerID
HAVING COUNT(*) > 3;

-- Overall revenue, average order value, total orders
SELECT 
  SUM(TotalPrice) AS total_revenue,
  AVG(TotalPrice) AS avg_order_value,
  COUNT(*) AS total_orders
FROM `orders_dataset.orders_table`
WHERE OrderStatus = 'Delivered';

-- Delivered vs Cancelled vs Returned distribution
SELECT OrderStatus, COUNT(*) AS count,
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `orders_dataset.orders_table`) AS percentage
FROM `orders_dataset.orders_table`
GROUP BY OrderStatus;

