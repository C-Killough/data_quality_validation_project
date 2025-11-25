-- Find duplicate invoice IDs (list and count)
SELECT invoice_id, COUNT(*) AS cnt
FROM Legacy_Invoices
GROUP BY invoice_id
HAVING COUNT(*) > 1;

-- Check for rows missing vendor OR amount

SELECT *
FROM Legacy_Invoices
WHERE vendor IS NULL OR amount IS NULL;

-- Check for invalid currency

SELECT *
FROM Legacy_Invoices
WHERE UPPER(currency) NOT IN ('USD', 'EUR', 'GBP');

-- Check for date formatting using length and dash positions
SELECT *
FROM Legacy_Invoices
WHERE NOT (
	Length(invoice_date) = 10
	AND SUBSTR(invoice_date,5,1) = '-'
	AND SUBSTR(invoice_date,8,1) = '-'
	AND SUBSTR(invoice_date,1,4) BETWEEN '1900' AND '2099'
);

-- Check for missing PO numbers
SELECT *
FROM Legacy_Invoices
WHERE po_number IS NULL;

-- Find invoices with a negative amount
SELECT *
FROM Legacy_Invoices
WHERE amount < 0;