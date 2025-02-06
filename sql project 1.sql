-- creating a Retail_Sales project
create database project;
use project;
-- create Table
create Table sales(transactions_id INT,	
sale_date DATE,	
sale_time TIME,	
customer_id INT,	
gender VARCHAR(10),	
age INT,
category VARCHAR(15),	
quantiy INT,	
price_per_unit FLOAT,	
cogs FLOAT,	
total_sale FLOAT);
select * from sales;
select count(*) from sales;


select count(*) from sales;
drop table sales;
select * from sales;
truncate table sales;
drop table sales;
create Table sales(
transactions_id INT,	
sale_date DATE,	
sale_time TIME,	
customer_id INT,	
gender VARCHAR(10),	
age INT,
category VARCHAR(15),	
quantiy INT,	
price_per_unit FLOAT,	
cogs FLOAT,	
total_sale FLOAT);
select * from sales;
select count(*) from sales;

drop database project;
create database project;
use project;
create Table sales(transactions_id INT,	
sale_date DATE ,	
sale_time TIME,	
customer_id INT,	
gender VARCHAR(10),	
age INT,
category VARCHAR(15),	
quantiy INT,	
price_per_unit FLOAT,	
cogs FLOAT,	
total_sale FLOAT);
select * from sales;
select count(*) from sales;
truncate table sales;
select * from sales;
select * from sales limit 10;
select avg(total_sale) from sales;
select * from sales where transactions_id is null;
select * from sales where 
transactions_id is null
or 
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or 
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;
-- data exploration
-- how many unique customers we have-
select count(distinct(customer_id)) from sales;
-- how many unique category -3
select count(distinct(category)) from sales;
-- busniess analysis
-- Q- want all columns details where catogery is clothing and quantity is equal to 4;
select * from sales where sale_date='2022-11-05';
select * from sales where category='Clothing'
and quantiy=4;
-- 	Q- write a query to calculate total sales categorywise and total orders.
select category,sum(total_sale),count(*) as total_orders from sales group by 1;
select category, avg(age) from sales group by 1;
-- Write a sql to find the transcations_id where total sale is greater than 1000
select * from sales where total_sale>1000;
-- write a sql query to find out total transctions made by each gender by each category
select category,gender,count(*) from sales group by 1,2 order by 1;
-- write a sql query for avg sale for each month, find best selling month in each year.
select
extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) from sales group by 1,2 order by 1,3 desc;
-- write a sql query to find top 5 customers basis highest total sales
select customer_id,sum(total_sale) from sales group by 1 order by 2 desc limit 5;
-- write a sql query to find out unique customer to purchase from each category
select category,count(distinct(customer_id)) as  unique_customers from sales group by 1;
-- write a sql query to create each shift and numbers of orders (example morning <=12, afternoon 12 to 17 , evening >17)
with hourly_sale as(select *,
case 
when extract(hour from sale_time)<12 then 'morning'
when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
else 'evening'
end as shift
from sales)
select shift,count(*) from hourly_sale group by shift;
-- END OF PROJECT--









