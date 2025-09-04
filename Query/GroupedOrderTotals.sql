-- Grand Total per Order
SELECT 
    o.order_id AS "Order ID",
    o.customer_id AS "Customer ID",
    o.store_id AS "Store ID",
	o.order_date as "Order Date",
    c.first_name + ' ' + c.last_name AS "Full Name",
    SUM(oi.list_price * oi.quantity) AS "Raw Total",
    SUM(oi.list_price * oi.quantity * oi.discount) AS "Discount Amount",
    SUM(oi.list_price * oi.quantity - oi.list_price * oi.quantity * oi.discount) AS "Order Total"
FROM [Bike Store].[dbo].[orders] AS o
LEFT JOIN dbo.customers AS c ON c.customer_id = o.customer_id
LEFT JOIN dbo.order_items AS oi ON o.order_id = oi.order_id
GROUP BY 
    o.order_id, 
    o.customer_id, 
    o.store_id, 
	o.order_date,
    c.first_name, 
    c.last_name
ORDER BY o.order_id;
