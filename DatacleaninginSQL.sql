--Checking the category for each item
select distinct description, category
from public.sales
group by description, category

--Relace the product to an appropriate category accordingly
update public.sales
set category = case when description = 'T-shirt' then replace(replace(replace(replace(category,'Electronics','Apparel'),'Stationery','Apparel'),
																		'Furniture','Apparel'),'Accessories','Apparel')
					when description = 'Headphones' then replace(replace(replace(replace(category,'Apparel','Electronics'),'Stationery','Electronics'),
																		'Furniture','Electronics'),'Accessories','Electronics')
					when description = 'USB Cable' then replace(replace(replace(replace(category,'Apparel','Electronics'),'Stationery','Electronics'),
																		'Furniture','Electronics'),'Accessories','Electronics')
					when description = 'Wireless Mouse' then replace(replace(replace(replace(category,'Apparel','Electronics'),'Stationery','Electronics'),
																		'Furniture','Electronics'),'Accessories','Electronics')
					when description = 'Backpack' then replace(replace(replace(replace(category,'Electronics','Accessories'),'Apparel','Accessories'),'Stationery','Accessories'),
																		'Furniture','Accessories')
					when description = 'Notebook' then replace(replace(replace(replace(category,'Accessories','Stationery'),'Apparel','Stationery'),'Electronics','Stationery'),
																		'Furniture','Stationery')
					when description = 'Blue Pen' then replace(replace(replace(replace(category,'Accessories','Stationery'),'Apparel','Stationery'),'Electronics','Stationery'),
																		'Furniture','Stationery')
					when description = 'Office Chair' then replace(replace(replace(replace(category,'Accessories','Furniture'),'Apparel','Furniture'),'Electronics','Furniture'),
																		'Stationery','Furniture')
					when description = 'Desk Lamp' then replace(replace(replace(replace(category,'Accessories','Furniture'),'Apparel','Furniture'),'Electronics','Furniture'),
																		'Stationery','Furniture')
					when description = 'Wall Clock' then replace(replace(replace(replace(category,'Accessories','Furniture'),'Apparel','Furniture'),'Electronics','Furniture'),
																		'Stationery','Furniture')
					when description = 'White Mug' then replace(replace(replace(replace(category,'Furniture','Accessories'),'Apparel','Accessories'),'Electronics','Accessories'),
																		'Stationery','Accessories')
				else category end;
