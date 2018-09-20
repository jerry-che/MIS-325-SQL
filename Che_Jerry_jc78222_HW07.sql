--Question 1
INSERT INTO categories
VALUES
    (5, 'Woodwinds');
    
--Question 2
UPDATE categories
SET category_name = 'Brass'
WHERE category_id = 5;

--Question 3
INSERT INTO products
    (product_id, category_id, product_code, product_name, description,
    list_price, discount_percent, date_added)
VALUES
    (11,5,'yas_480', 'Yamaha YAS-480 Saxophone', 'Long description to come',
    790.99, 0, SYSDATE);

--Question 4
UPDATE products
SET discount_percent = 35.5
WHERE product_id = 11;

--Question #5
DELETE FROM products
WHERE product_id = 11;

DELETE FROM categories
WHERE category_id = 5;

COMMIT;
    
