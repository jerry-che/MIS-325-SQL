--Problem 1
SELECT category_name,product_name,list_price
FROM categories c JOIN Products p
     ON c.category_id = p.category_id;
     
-- Problem 2
SELECT first_name,last_name,
       line1,city,state,zip_code
FROM Addresses a JOIN customers_mgs c
     ON a.customer_id = c.customer_id
WHERE c.email_address = 'allan.sherwood@yahoo.com';,
    
--Problem 3
SELECT last_name,first_name, 
       order_date,product_name,item_price
       discount_amount,quantity
FROM Customers_Mgs c 
     JOIN Orders_Mgs o ON c.Customer_Id = o.Customer_Id
     JOIN Order_Items oi ON o.Order_Id = oi.Order_Id
     JOIN Products p ON  oi.Product_Id = p.Product_Id
ORDER BY last_name,order_date,product_name;

--Problem 4
SELECT p1.Product_name,p1.List_price
FROM Products p1,Products p2
WHERE p1.list_Price = p2.list_price AND p1.Product_Id <> p2.Product_Id
ORDER BY product_name;

--Problem 5
SELECT category_name,product_id
FROM Categories c LEFT JOIN Products p 
     ON c.Category_Id = p.Category_Id
WHERE product_id IS NUll;

--Product 6
    SELECT 'SHIPPED' AS ship_status, order_id, order_date
    FROM Orders_mgs
    WHERE ship_date IS NOT NULL
UNION
    SELECT 'NOT SHIPPED' AS ship_status,order_id,order_date
    FROM Orders_mgs
    WHERE ship_date IS NULL
    ORDER BY order_date;
