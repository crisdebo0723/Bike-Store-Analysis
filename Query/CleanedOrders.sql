--Cleaning Orders Table
SELECT
	   o.[order_id] as "Order ID"
      ,o.[customer_id] as "Customer ID"
      --,[order_status]
      ,[order_date]
      --,[required_date]
      --,[shipped_date]
      ,o.[store_id] as "Store ID"
     -- ,[staff_id]
	 ,c.[first_name] + ' ' + c.[last_name] as "Full Name"
	 ,oi.[product_id] as "Product ID"
	 ,p.[product_name] as "Product Name"
	 ,oi.[list_price] as "Price"
	 ,oi.quantity as "Quantity"
	 ,oi.[list_price] * oi.quantity as "Raw Total"
	 ,(oi.[list_price] * oi.quantity) * oi.discount as "Discount Amount"
	 ,(oi.[list_price] * oi.quantity) - ((oi.[list_price] * oi.quantity) * oi.discount) as "Order Total"
  FROM [Bike Store].[dbo].[orders] as o
  LEFT JOIN dbo.customers as c on c.customer_id = o.customer_id
  LEFT JOIN dbo.order_items as oi on o.order_id = oi.order_id
  LEFT JOIN dbo.products as p on oi.product_id = p.product_id