select * from public.sales
select distinct category from public.sales
where description = 'Notebook'
select distinct description from public.sales

--Total sales by year ordered by sales
select extract('year' from invoicedate) as year, round(sum(sales.unitprice*sales.quantity)::numeric,0) as total_sales
from public.sales
group by year
order by total_sales desc

--Total sales by month ordered by sales
select extract('month' from invoicedate) as month, round(sum(sales.unitprice*sales.quantity)::numeric,0) as total_sales
from public.sales
group by month
order by total_sales desc

--Top 5 sales by country
select distinct country as country, round(sum(sales.unitprice*sales.quantity)::numeric,0) as total_sales
from public.sales
group by country
order by total_sales desc
limit 5

--Top 5 sales by category
select distinct category as category, round(sum(sales.unitprice*sales.quantity)::numeric,0) as total_sales
from public.sales
group by category
order by total_sales desc
limit 5

--Top 5 sales by product
select distinct description as product, round(sum(sales.unitprice*sales.quantity)::numeric,0) as total_sales
from public.sales
group by product
order by total_sales desc
limit 5

--Sales by sales channel
select saleschannel, round(sum(sales.unitprice*sales.quantity)::numeric,0) as total_sales
from public.sales
group by saleschannel

--Percentage by payment method
select paymentmethod, round(count(*)*100.0/(select count(*) from public.sales),1) as percentage
from public.sales
group by paymentmethod

--Percentage by return status
select returnstatus, round(count(*)*100.0/(select count(*) from public.sales),1) as percentage
from public.sales
group by returnstatus

--Most items has been returned
select distinct description, count(*)
from public.sales
where returnstatus = 'Returned'
group by description
order by count(*) desc

--Returned by warehouse location
select returnstatus, warehouselocation, round(count(*)*100.0/(select count(*) from public.sales),1) as percentage
from public.sales
where returnstatus = 'Returned'
group by returnstatus, warehouselocation