USE startersql;

SHOW TABLES;

SELECT * FROM customer_behavior LIMIT 10;

DESCRIBE customer_behavior;

SELECT Gender,
       SUM(`Purchase Amount (USD)`) AS revenue
FROM customer_behavior
GROUP BY Gender;

SELECT `Customer ID`,
       `Purchase Amount (USD)`
FROM customer_behavior
WHERE `Discount Applied` = 'Yes'
  AND `Purchase Amount (USD)` >= (
      SELECT AVG(`Purchase Amount (USD)`)
      FROM customer_behavior
  );
  
  SELECT `Item Purchased`,
       AVG(`Review Rating`) AS `Avg Product Rating`
FROM customer_behavior
GROUP BY `Item Purchased`
ORDER BY `Avg Product Rating` DESC
LIMIT 5;


SELECT `Shipping Type`,
       ROUND(AVG(`Purchase Amount (USD)`), 2) AS avg_purchase_amount
FROM customer_behavior
WHERE `Shipping Type` IN ('Standard', 'Express')
GROUP BY `Shipping Type`;


SELECT `Subscription Status`,
       COUNT(`Customer ID`) AS `Total Customers`,
       ROUND(AVG(`Purchase Amount (USD)`), 2) AS avg_purchase_amount,
       ROUND(SUM(`Purchase Amount (USD)`), 2) AS total_revenue
FROM customer_behavior
GROUP BY `Subscription Status`
ORDER BY total_revenue DESC, avg_purchase_amount DESC;
