-- Creating Legacy Table

CREATE TABLE Legacy_Invoices (
	invoice_id VARCHAR(50),
	vendor VARCHAR(100),
	amount 	NUMERIC,
	currency VARCHAR (10),
	invoice_date VARCHAR(20),
	po_number VARCHAR(50)
);

-- Inserting Legacy Data
INSERT INTO Legacy_Invoices (invoice_id, vendor, amount, currency, invoice_date, po_number) VALUES
('5001', 'ACME', 550, 'USD', '2021-04-10', '123'),
('5002', 'ACME', NULL, 'USD', '4/11/21', '124'),
('5003', NULL, 720, 'EUR', '20210412', NULL),
('5003', 'ACME', 430, 'USD', '2021-04-12', '125'),
('5004', 'SupplierX', -50, 'GBP', '2021-05-01', '126'),
('5005', 'VendorY', 100, 'CAD', '2021-06-15', '127'); -- CAD is invalid for our rules