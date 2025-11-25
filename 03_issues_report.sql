-- Combined issues report
WITH issues_cte AS(
	SELECT
		L.invoice_id,
		vendor,
		amount,
		currency,
		invoice_date,
		po_number,
		-- isues list
		TRIM(
			CONCAT(
				CASE WHEN dup.cnt > 1 THEN 'DUPLICATE_ID; ' ELSE '' END,
				CASE WHEN vendor IS NULL THEN 'MISSING_VENDOR; ' ELSE '' END,
				CASE WHEN amount IS NULL THEN 'MISSINGAMOUNT; ' ELSE '' END,
				CASE WHEN AMOUNT < 0 THEN 'NEGATIVE_AMOUNT; ' ELSE '' END,
				CASE WHEN UPPER(currency) NOT IN ('USD', 'EUR', 'GBP') THEN 'INVALID_CURRENCY; ' ELSE '' END,
				CASE WHEN NOT (LENGTH(invoice_date) = 10 AND SUBSTR(invoice_date,5,1)='-' AND SUBSTR(invoice_date,8,1)='-') THEN 'BAD_DATE_FORMAT; ' ELSE '' END,
				CASE WHEN po_number IS NULL THEN 'MISSING_PO; ' ELSE '' END
			)
		) AS issues
	FROM Legacy_Invoices L
	LEFT JOIN (
		SELECT invoice_id, COUNT(*) AS cnt
		FROM Legacy_Invoices
		GROUP BY invoice_id
		HAVING COUNT(*) > 1
	) dup ON L.invoice_id = dup.invoice_id
)
SELECT *
FROM issues_cte
WHERE issues IS NOT NULL AND issues <> ''
ORDER BY invoice_id;