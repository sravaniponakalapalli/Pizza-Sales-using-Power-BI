/* This query will retrieve all columns from a table */
select *
from pizza_sales

/* Total revenue */
select SUM(total_price) as total_revenue
from pizza_sales

/* Average order value */
select SUM(total_price)/COUNT(distinct order_id) as Average_order_value
from pizza_sales

/* Total pizzas sold */
select SUM(quantity) as Total_pizzas_sold
from pizza_sales

/* Total orders */
select COUNT(distinct order_id) as total_orders
from pizza_sales

/* Average pizzas per order */
select cast(cast(SUM(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2))as decimal(10,2))
from pizza_sales

/* Daily trends for total orders */
select DATENAME(dw,order_date) as Order_day,COUNT(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(dw,order_date)

select DATENAME(MONTH,order_date) as order_month,COUNT(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(MONTH,order_date)
order by Total_orders desc

/* Percentage of sales by pizza category */
select pizza_category,SUM(total_price) *100/(select sum(total_price) from pizza_sales as Percentage_sales_category)
from pizza_sales
group by pizza_category 

/* Percentage of sales by pizza size */
select pizza_size,SUM(total_price) *100/(select SUM(total_price) from pizza_sales as percentage_sales_size)
from pizza_sales
group by pizza_size

/* Top 5 best sellers by revenue,total quantity,total order */
select top 5 pizza_name,SUM(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc

select top 5 pizza_name,SUM(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc

select top 5 pizza_name,COUNT(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc

/* Bottom 5 best sellers by revenue,total quantity,total orders */
select top 5 pizza_name,SUM(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue asc

select top 5 pizza_name,SUM(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity asc

select top 5 pizza_name,COUNT(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders asc