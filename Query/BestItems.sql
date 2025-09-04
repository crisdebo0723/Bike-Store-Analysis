SELECT --[order_id]
      --,[item_id]
      oi.[product_id]
      ,SUM([quantity]) as "Total Sold"
	  ,p.[product_name] as "Product Name"
     -- [list_price]
      --[discount]
  FROM [Bike Store].[dbo].[order_items] as oi
  LEFT JOIN dbo.products as p on p.product_id = oi.product_id
  GROUP BY oi.product_id, p.product_name
  order by [Total Sold] desc