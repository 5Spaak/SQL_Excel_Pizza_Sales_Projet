# SQL_Excel_Pizza_Sales_Projet

## PROBLEM STATEMENT
### KPI’S REQUIREMENT
> We need to analyze key indicators for our pizza sales data to gains Insignts into our business performance. Specifically, we want to calculate the following metrics

#### 1. Total Revenue: The sum of total price of all pizza orders
#### 2.	Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of records
#### 3.	Total pizza Sold: The sum of the quantities of all pizzas sold
#### 4.	Total Orders: The total number of orders placed
#### 5.	Average Pizzas Per order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders
> She wants to visualize KPI indicators from data that she provides us in order to gain insights into our business performance.
### CHARTS REQUIREMENT
> We would like to visualize various aspects of our pizza sales to gain insights and understand key trends. We have identified the following requirements for creating charts:
#### 1.	Daily Trend for Total Orders:
> Create a bar chart that displays the daily trend of Total orders over a specific time period. This chart will help us identify any patterns or fluctuations in order volumes on a daily basis
#### 2.	Hourly Trend for Total Orders:
> Create a line chart that illustrates the hourly trends of total order throughout the day. This chart will allow us to identify peak hours or periods of high order activity.
#### 3.	Percentage of Sales by Pizza Category:
> Create a pie chart that shows the distribution of Sales across different pizza categories. This chart will provide insights into the popularity of various categories and their contribution to overall sales.
#### 4.	Percentage of Sales by Pizza Size:
> Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. This chart will help us understand customers preferences for pizza sizes and their impact on sales.
#### 5.	Total Pizzas Sold by Pizza category:
> Create a funnel chart that present the total number of pizzas sold for each pizza category. This chart will allow us to compare the sales performance of different pizza categories.
#### 6.	Top 5 Best Sellers by total Pizzas Sold:
> Create a bar chart highlighting the top 5 best-selling pizzas based on the total number of pizzas sold. This chart helps us identify the most popular pizza options.
#### 7.	Bottom 5 Worst Sellers by Total Pizzas Sold:
> Create a bar chart showcasing the bottom 5 worst-selling pizzas based on the total number of pizzas sold. This chart will enable us to identify underperforming or less popular pizza options.

## DATA ANALYSIS USING SQL SERVER

1. **-- Database**
   
`SELECT * FROM pizza_sales;`

3. **--Total Revenue**
   
`SELECT CAST(SUM(total_price) as decimal(10,2)) as Revenue FROM pizza_sales;`

4. **-- Total Pizza Sold**
   
`SELECT SUM(quantity) as Total_Pizza_Sold FROM pizza_sales;`

3. **-- Total Orders**
   
`SELECT COUNT(DISTINCT(order_id)) FROM pizza_sales;`

5. **-- Average Order Value**

`SELECT CAST(CAST(SUM(total_price) as decimal(10,2))/CAST(COUNT(DISTINCT(order_id)) as decimal(10,2)) as decimal(10,2)) FROM pizza_sales;`

7. **-- Average Pizza Sold Per Order**

`SELECT SUM(quantity)/COUNT(DISTINCT(order_id)) FROM pizza_sales;`

9. **--Daily Trend for Total Orders**

`SELECT COUNT(DISTINCT(order_id)) AS Total_Order, DATENAME(WEEKDAY,order_date) AS Weekdays FROM pizza_sales GROUP BY DATENAME(WEEKDAY,order_date);`

11. **-- Hourly Trend for Total Orders**
    
`SELECT COUNT(DISTINCT(order_id)) AS Total_Order, DATEPART(HOUR, order_time) AS order_hours FROM pizza_sales GROUP BY DATEPART(HOUR, order_time) ORDER BY order_hours`

13. **-- Percentage of Sales by Pizza Category**
    
`SELECT pizza_category, (SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales))*100 FROM pizza_sales GROUP BY pizza_category;`

15. **-- Total Pizzas Sold by Pizza category**
    
`SELECT pizza_category, SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales GROUP BY pizza_category`;

17. **-- Top 5 Best Sellers by total Pizzas Sold**
    
`SELECT TOP 5 pizza_name, SUM(quantity) AS Pizza_Sold FROM pizza_sales GROUP BY pizza_name ORDER BY Pizza_Sold DESC`;

19. **-- Bottom 5 Worst Sellers by Total Pizzas Sold**
    
`SELECT TOP 5 pizza_name, SUM(quantity) AS Pizza_Sold FROM pizza_sales GROUP BY pizza_name ORDER BY Pizza_Sold ASC`;


## Pizza Sales Dashboard Excel 

|![Pizza Sales Dashboard Excel](PizzaSales.png)|
