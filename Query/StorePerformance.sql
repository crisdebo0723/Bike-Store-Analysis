SELECT 
    o.store_id AS "Store ID",
	s.store_name as "Store Name",
    SUM(oi.list_price * oi.quantity - oi.list_price * oi.quantity * oi.discount) AS "Total Revenue"
FROM [Bike Store].[dbo].[orders] AS o
LEFT JOIN dbo.order_items AS oi ON o.order_id = oi.order_id
LEFT JOIN dbo.stores AS s ON o.store_id = s.store_id
GROUP BY o.store_id, s.store_name
ORDER BY "Total Revenue" ASC;
