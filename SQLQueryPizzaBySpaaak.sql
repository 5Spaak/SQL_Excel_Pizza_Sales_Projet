--- PIZZA STORE ANALYSIS WITH SQL

SELECT * FROM pizza_sales
-- Total revenue :  sum of total price of all order
SELECT CAST(SUM(total_price) AS decimal(10,2)) FROM pizza_sales;

-- Average Order value : the average amount spent per order
SELECT CAST(SUM(total_price)/COUNT(DISTINCT order_id) AS decimal(10,2)) FROM pizza_sales;

-- Total pizza sold : sum of all quantity
SELECT SUM(quantity) FROM pizza_sales;

-- Average price of pizza sold per order
SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))/
CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS decimal(10,2)) AS Avg_pizza_sold 
FROM pizza_sales;

-- Daily Trends
SELECT DATENAME(weekday, order_date) AS DAYS, COUNT(DISTINCT order_id) AS Total_order FROM pizza_sales
GROUP BY DATENAME(weekday, order_date)
ORDER BY  DATENAME(weekday, order_date) ASC;

-- Hourly Trends
SELECT DATENAME(hh, order_time) AS DAYS, COUNT(DISTINCT order_id) AS Total_order FROM pizza_sales
GROUP BY DATENAME(hh, order_time)
ORDER BY  DATENAME(hh, order_time) ;

-- Percentage of Sales by pizza category
SELECT pizza_category, ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) AS percentage_sale
from pizza_sales
group by pizza_category;

--Percentage of Sales by Pizza Size
select pizza_size, ROUND(sum(total_price)/(select sum(total_price) from pizza_sales)*100, 2) AS percentage_sales
from pizza_sales
group by pizza_size;

--Total Pizzas Sold by Pizza category
select pizza_category, sum(quantity) AS total_pizzas from pizza_sales
group by pizza_category;

-- Top 5 Best Sellers by total pizzas sold
select TOP 5 pizza_name, sum(quantity) as total_pizza_sold from pizza_sales
group by pizza_name
order by total_pizza_sold desc

-- Bottom 5 Worst Sellers by Total by pizzas Sold
select TOP 5 pizza_name, sum(quantity) as total_pizza_sold from pizza_sales
group by pizza_name
order by total_pizza_sold asc