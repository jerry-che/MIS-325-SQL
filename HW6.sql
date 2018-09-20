--Question 1
SELECT DISTINCT category_name
FROM categories
WHERE category_id IN (SELECT category_id FROM products)
ORDER BY category_name;

--Question 2
SELECT product_name, list_price
FROM products
WHERE list_price > ALL(SELECT AVG(list_price)
                    FROM products)
ORDER BY list_price DESC;

--Question 3
SELECT product_name, discount_percent
FROM products p1
WHERE discount_percent NOT IN (SELECT discount_percent
                               FROM products p2
                               WHERE p1.product_name <> p2.product_name)
ORDER BY product_name;

--Question 4
SELECT vendor_name,vendor_city,
       vendor_state
FROM vendors 
WHERE vendor_city||vendor_state NOT IN (SELECT vendor_city||vendor_state 
                                        FROM vendors 
                                        GROUP BY vendor_city||vendor_state
                                        HAVING COUNT(*)>1 )
ORDER BY vendor_state,vendor_city;
