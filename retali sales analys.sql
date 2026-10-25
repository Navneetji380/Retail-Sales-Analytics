select * from retaill_sales;

---Who are the first 10 sales transtion in the dataset?
select * from retaill_sales
limit 10

select 
count(*)
from retaill_sales;

----Check a null valve 

select * from retaill_sales
where transection_id IS  NULL

Select * from retaill_sales
where

Sales_time IS  NULL
OR
Sales_data IS  NULL
OR
Gender IS  NULL
OR
Age_category IS NULL
OR
Price_per_unit IS NULL
OR
Cogs IS NULL
OR
Total_sales is NULL

--WHO many unique sales we have?

Select count(distinct customer_id ) as total_sales
from retaill_sales

--- Who many unique COGS valve unique customers are there?

Select count(distinct cogs) as total_sales
from retaill_sale

-- What was the sales transaction recorded at 1:18:13 PM on January 1, 2025?

SELECT * 
FROM  retaill_sales
WHERE Sales_time = '2025-01-01 13:18:13';
 
-- What is the total sales revenue for each product category?

Select 
Sales_data,
Sum(total_sales) as Net_sale,
Count(*) as total_orders
From retaill_sales
Group by sales_data;

---average age to find the average age of customer eho purched item the 'Sneakers' 'sales data'
Select 
Round(AVG(price_per_unit),2) AS
Avg_price
From retaill_sales
Where sales_data = 'Dress' 

--wrrte sql query  to find the transtion(transtion_id) is mode by each other in each category
select * from retaill_sales
where total_sales >100


select 
sales_data
gender,
count(*) as total_transection_id
from retaill_sales
group
by 
sales_data,
gender
order by 1

------averge sales for each year
SELECT
    EXTRACT(YEAR FROM sales_time) AS year,
    EXTRACT(MONTH FROM sales_time) AS month,
    ROUND(AVG(total_sales), 2) AS avg_sale
FROM retaill_sales
GROUP BY
    EXTRACT(YEAR FROM sales_time),
    EXTRACT(MONTH FROM sales_time)
ORDER BY year, month;

---top5 
select
customer_id,
SUM(total_sales) as total_sales
from retaill_sales
group by customer_id
order by  TOTAL_SALES desc
LIMIT 5;

-- Who many unique customers purchased from each product category?
 
SELECT
    sales_data,
    COUNT(DISTINCT customer_id) AS unique_customer_id
FROM retaill_sales
GROUP BY sales_data;

--Which time of period has the hight numder of sales orders?

WITH hourly_sale AS (
    SELECT *,
        CASE
            WHEN EXTRACT(HOUR FROM sales_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sales_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retaill_sales
)
SELECT
    shift,
    COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;

---Which product category has the highest number of transtion?

select 
sales_data,
COUNT(transection_id) AS 
Total_transection_id
From retaill_sales
Group BY sales_data
order by total_transection_id DESC;

--What are the top 5 customers by revenue?

Select
Customer_id,
Sum(total_sales) as 
Total_sales
From retaill_sales
Group by customer_id
Order by total_sales  desc
Limit 5;


