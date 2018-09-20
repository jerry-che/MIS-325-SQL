--In-Class Exercise
SELECT account_description, COUNT(*) line_item_count, SUM(line_item_amt) 
       AS line_item_amt_sum 
FROM general_ledger_accounts gl 
     JOIN invoice_line_items li ON gl.account_number = li.account_number 
     JOIN invoices i ON li.Invoice_ID = i.Invoice_ID
WHERE i.Invoice_Date BETWEEN '01-APR-2014' AND '30-JUN-2014'
GROUP BY account_description
HAVING  COUNT(*) > 1
ORDER BY line_item_amt_sum DESC;
