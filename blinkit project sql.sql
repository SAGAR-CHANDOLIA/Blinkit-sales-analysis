SELECT * FROM public.blinkitdata

select count(*) from blinkitdata

update blinkitdata
set item_fat_contents=
case
when item_fat_contents in ('LF','low fat') then 'Low Fat'
when item_fat_contents = 'reg' then 'Regular'
else item_fat_contents
end;

--KEY PERFORMING INDICATORS

--Total sales 
select cast(sum(total_sales)/1000000 as Decimal(10,2)) as Total_revenue
from blinkitdata;
()
--Average Sales

select cast(avg(total_sales)as decimal(10,2)) as average_sales
from blinkitdata;

--Total items

select count(*) as total_items
from blinkitdata;

--Average rating
select cast(avg(rating)as decimal(10,1))as Average_rating from blinkitdata;


--Total sales according to fat content

select item_fat_contents , 
cast(sum(total_sales)/1000000 as decimal(10,2))as total_sales_millions,
cast(avg(total_sales)as decimal(10,2)) as average_sales,
count(*) as total_items,
cast(avg(rating)as decimal(10,1))as Average_rating
from blinkitdata
group by(item_fat_contents)
order by total_sales_millions desc;


--Total 5 sales by item_types

select item_types,
cast(sum(total_sales)/1000 as decimal(10,2))as total_sales_thousands,
cast(avg(total_sales)as decimal(10,2)) as average_sales,
count(*) as total_items,
cast(avg(rating)as decimal(10,1))as Average_rating
from blinkitdata
group by item_types
order by total_sales_thousands desc
limit 5;

--Fat content by outlets for total sales

select outlet_location_type, item_fat_contents,
cast(sum(total_sales)/1000 as decimal(10,2))as total_sales_thousands,
cast(avg(total_sales)as decimal(10,2)) as average_sales,
count(*) as total_items,
cast(avg(rating)as decimal(10,1))as Average_rating
from blinkitdata
group by outlet_location_type, item_fat_contents
order by total_sales_thousands desc;

--total sales according to outlet location and fat contents
select outlet_location_type,
coalesce(sum(case when item_fat_contents='Low Fat' then total_sales End), 0)as Low_fat,
coalesce(sum(case when item_fat_contents='Regular' then total_sales End), 0)as Regular
from blinkitdata
group by outlet_location_type
order by outlet_location_type;


--total sales according to establishment year

select outlet_establishment_year,
	cast(sum(total_sales)as decimal(10,2))as TotalSales
	from blinkitdata
	group by outlet_establishment_year
	order by outlet_establishment_year asc;

--Percentage sales by outlet_size

select outlet_size,
		cast(sum(total_sales)as decimal(10,2))as total_sales,
		cast((sum(total_sales)*100)/(select sum(total_sales) from blinkitdata)as decimal(10,2))as percentage_sales
		from blinkitdata
		group by outlet_size;

--sales by outlet type

select outlet_location_type,
cast(sum(total_sales)/1000 as decimal(10,2))as total_sales_thousands,
cast(avg(total_sales)as decimal(10,2)) as average_sales,
count(*) as total_items,
cast(avg(rating)as decimal(10,1))as Average_rating
from blinkitdata
group by outlet_location_type
order by total_sales_thousands desc;


