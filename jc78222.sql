SELECT *
FROM invoices;

SELECT invoice_id, invoice_total, payment_total
FROM invoices;

SELECT SUM(payment_total)
FROM invoices;

SELECT invoice_total,
FROM INVOICES;

SELECT invoice_id, invoice_number,
invoice_total - credit_total-payment_total AS "Total Balance Due"
FROM INVOICES
WHERE (invoice_total - credit_total-payment_total) <> 0;

SELECT *
FROM invoices;

SELECT invoice_number, invoice_date, invoice_total
FROM invoices
ORDER BY invoice_total;

SELECT invoice_id,invoice_total,
       (credit_total + payment_total) AS total_credits
FROM invoices
WHERE invoice_id = 17;

SELECT due_date, invoice_total, (invoice_total * 0.1) AS "10%", invoice_total+ (invoice_total * 0.1) AS "Plus 10%"
FROM invoices
WHERE invoice_total >=