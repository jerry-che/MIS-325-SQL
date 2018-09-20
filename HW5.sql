--Question 1
CREATE view A5T1 AS
SELECT COUNT(*) AS order_count,SUM(tax_amount) AS tax_total, 
       MAX(tax_amount) AS tax_max
FROM orders_mgs;

-- Question 2
CREATE VIEW A5T2 AS
SELECT Category_Name,COUNT(*) AS product_count,
        MAX(p.List_price) AS most_expensive_product
FROM Categories ca JOIN
     Products p ON ca.Category_Id = p.Category_Id
GROUP BY category_name
ORDER BY product_count DESC;

--Question 3
CREATE VIEW A5T3 AS
SELECT email_address, SUM(item_price*quantity) AS item_price_total,
       SUM(discount_amount * quantity) AS discount_amount_total
FROM customers_mgs cm JOIN
     orders_mgs om ON cm.customer_id = om.customer_id JOIN
     order_items oi ON om.order_id = oi.order_id
GROUP BY email_address
ORDER BY item_price_total DESC;

--Question 4
CREATE VIEW A5T4 AS
SELECT email_address, COUNT(*) AS order_count,
       SUM((item_price-discount_amount)*quantity) AS order_total
FROM customers_mgs cm JOIN
     orders_mgs om ON cm.customer_id = om.customer_id JOIN
     order_items oi ON om.order_id = oi.order_id
GROUP BY email_address
HAVING COUNT(*) > 1
ORDER BY order_total DESC;

--Question 5
CREATE VIEW A5T5 AS
SELECT email_address, COUNT(*) AS order_count,
       SUM((item_price-discount_amount)*quantity) AS order_total
FROM customers_mgs cm JOIN
     orders_mgs om ON cm.customer_id = om.customer_id JOIN
     order_items oi ON om.order_id = oi.order_id
WHERE item_price > 400
GROUP BY email_address
HAVING COUNT(*) > 1
ORDER BY order_total DESC;

--Question 6
CREATE VIEW A5T6 AS
SELECT email_address, COUNT(DISTINCT product_id) AS number_of_products
FROM customers_mgs cm JOIN
     orders_mgs om ON cm.customer_id = om.customer_id JOIN
     order_items oi ON om.order_id = oi.order_id
GROUP BY email_address
HAVING COUNT(DISTINCT product_id) > 1
ORDER BY email_address;



     
