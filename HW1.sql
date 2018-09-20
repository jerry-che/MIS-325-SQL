-- Problem #1
SELECT product_code,product_name,list_price,
       discount_percent
FROM products
ORDER BY list_price DESC;

-- Problem #2
SELECT last_name||', '||first_name AS full_name
FROM customers_mgs
WHERE (SUBSTR(last_name,1,1) IN ('E','G','H')) 
ORDER BY last_name;

--Problem #3
SELECT product_name,list_price,date_added
FROM products
WHERE list_price < 2000 and list_price > 500
ORDER BY date_added DESC;

--Problem #4
SELECT product_name, list_price, discount_percent, 
       (list_price * (discount_percent/100)) AS discount_amount,
       list_price -  (list_price * (discount_percent/100)) AS discount_price
FROM products
WHERE ROWNUM <= 5
ORDER BY discount_price DESC;

--Problem #5
SELECT item_id, item_price, discount_amount,
       quantity, item_price * quantity AS price_total, 
       discount_amount * quantity AS discount_total,
       (item_price - discount_amount) * quantity AS item_total
FROM (SELECT * 
      FROM order_items
      ORDER BY (item_price - discount_amount) * quantity DESC)
WHERE ROWNUM <= 6;

--Problem #6
SELECT order_id, order_date, ship_date
FROM orders_mgs
WHERE ship_date IS NULL;

--Problem #7
SELECT SYSDATE AS today_unformatted, 
       To_Char(SYSDATE,'MM-DD-YYYY') as today_formatted
FROM Dual;

--Problem #8
SELECT 100 AS PRICE,
       .07 AS tax_rate,
       (100 * .07) AS tax_amount,
       100 + (100 * .07) AS total
FROM Dual;
           
