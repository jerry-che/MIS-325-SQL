--Question 1
SET SERVEROUTPUT ON;

DECLARE
    product_count NUMBER;
BEGIN 
    SELECT COUNT(product_id)
    INTO product_count
    FROM products;
    
    IF product_count >= 7 THEN
        DBMS_OUTPUT.PUT_LINE('The number of products is greater than or equal to 7');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number of products is less than 7');
    END IF;
END;
/

--Question 2
SET SERVEROUTPUT ON;

DECLARE
    product_count NUMBER;
    list_price_avg NUMBER(9,3);
    
BEGIN
    SELECT COUNT(product_id), AVG(list_price)
    INTO product_count, list_price_avg
    FROM products;
    
    IF product_count >= 7 THEN
        DBMS_OUTPUT.PUT_LINE('product count: ' || product_count);
        DBMS_OUTPUT.PUT_LINE('list price average: ' || list_price_avg);
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number of prodcuts is less than 7');
    END IF;
END;
/
        
        
--Question 3
SET SERVEROUTPUT ON;

BEGIN 
    INSERT INTO categories VALUES(1,'Guitars');
    DBMS_OUTPUT.PUT_LINE('1 row inserted.');
    
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Row was not inserted - duplicate entry.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected exception occurred.');       
END;
/
--Question 4
CREATE OR REPLACE FUNCTION test_glaccounts_description
(
    account_descr_param VARCHAR2 
)
RETURN NUMBER
AS
    found_var NUMBER;
BEGIN
    SELECT 1 INTO found_var
    FROM general_ledger_accounts
    WHERE account_description = account_descr_param;
    RETURN found_var;
EXCEPTION
    WHEN no_data_found THEN
        found_var :=0;
    RETURN found_var;
END;
/

        
-- Question 5
SET SERVEROUTPUT ON;

BEGIN
    
    IF test_glaccounts_description('Book Inventory') = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Account description already in use');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Account description is available.');
    END IF;
END;
/

