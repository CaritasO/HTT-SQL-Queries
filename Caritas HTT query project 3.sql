--Question: Write an SQL query to join 2 tables and retrieve 6 columns, 3 columns from each chosen table
--Joining the accounts table web_events table

--Tables:
--Accounts: id (primary key)
--web_events: account_id (foreign key)

SELECT accounts. name,
       accounts. website,
	   accounts. lat,
	   web_events. id,
	   web_events. account_id,
	   web_events. occurred_at
FROM accounts
JOIN web_events
ON accounts. id = web_events. account_id;

-- Question: Write an SQL query to calculate total sales and average order value by region.
--Joining orders and accounts tables
--Joining sales_reps and accounts tables
--Joining region and sales_reps tables

--Tables: 
--region: id (Primary key)
--sales_reps: region_id (foreign key), id (primary key)
--accounts: sales_rep_id (foreign key), id (primary key)
--orders: account_id (foreign key)
SELECT region.name AS region_name,
       SUM(orders.total_amt_usd) AS sum_total_amt_used,
	   AVG(orders.total_amt_usd) AS average_order_value  
FROM orders
JOIN accounts
ON orders. account_id = accounts. id
JOIN sales_reps
ON accounts. sales_rep_id = sales_reps.id
JOIN region
ON region.id = sales_reps. region_id
GROUP BY region.name;

-- Question: using a subquery, find customers who have made orders above the average order value
SELECT accounts.name AS customer_name, 
       accounts.id AS customer_id, 
	   orders.total_amt_usd AS average_order_value
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
WHERE orders.total_amt_usd > (SELECT AVG(orders.total_amt_usd) FROM orders);


--Joining the orders table and account table
--Tables:
--orders: account_id--foreign key
--web_events: account_id--foreign key
--Account: id--primary key 

SELECT accounts. id, 
       accounts. name, 
	   accounts. website,
	   orders. account_id, 
	   orders. standard_qty,
	   orders. standard_amt_usd   
FROM orders
JOIN accounts
ON orders. account_id = accounts. id
JOIN web_events
ON accounts. id = web_events. account_id;

 SELECT *
 FROM accounts;
 
SELECT *
 FROM sales_reps;
 
 SELECT *
 FROM region;

SELECT *
 FROM orders;

 SELECT *
 FROM web_events;
 
 
 
--query to cal the revenue generated per_month
SELECT to_char (occurred_at, 'month') AS month_name, 
       sum(total_amt_usd) AS revenue_usd
FROM orders
GROUP BY month_name
ORDER BY revenue_usd DESC

--which paper type generates the most revenue?
SELECT sum(standard_amt_usd) AS standard_paper_revenue_usd,
       sum(gloss_amt_usd) AS gloss_paper_revenue_usd,
	   sum(poster_amt_usd) AS poster_paper_revenue_usd
FROM orders;

--which paper type has the highest demand
SELECT sum(standard_qty) AS standard_qty, 
       sum(gloss_qty) AS gloss_qty,
	   sum(poster_qty) AS poster_qty
FROM orders;

--what is the distribution of revenue by region
SELECT 

--How many customers placed an order per year in Parch and Posey 
SELECT DATE_PART('year', occurred_at) AS year,
       COUNT(DISTINCT account_id) AS number_of_customers
FROM orders
GROUP BY year
ORDER BY year DESC;

--what is the date of the most recent transaction
--This is to enable us to understand the reason for the low count in 2017
SELECT MAX(occurred_at) AS --Question: Write an SQL query to join 2 tables and retrieve 6 columns, 3 columns from each chosen table
--Joining the accounts table web_events table

--Tables:
--Accounts: id (primary key)
--web_events: account_id (foreign key)

SELECT accounts. name,
       accounts. website,
	   accounts. lat,
	   web_events. id,
	   web_events. account_id,
	   web_events. occurred_at
FROM accounts
JOIN web_events
ON accounts. id = web_events. account_id;

-- Question: Write an SQL query to calculate total sales and average order value by region.
--Joining orders and accounts tables
--Joining sales_reps and accounts tables
--Joining region and sales_reps tables

--Tables: 
--region: id (Primary key)
--sales_reps: region_id (foreign key), id (primary key)
--accounts: sales_rep_id (foreign key), id (primary key)
--orders: account_id (foreign key)
SELECT region.name AS region_name,
       SUM(orders.total_amt_usd) AS sum_total_amt_used,
	   AVG(orders.total_amt_usd) AS average_order_value  
FROM orders
JOIN accounts
ON orders. account_id = accounts. id
JOIN sales_reps
ON accounts. sales_rep_id = sales_reps.id
JOIN region
ON region.id = sales_reps. region_id
GROUP BY region.name;

-- Question: using a subquery, 
--find customers who have made orders above the average order value
SELECT accounts.name AS customer_name, 
       accounts.id AS customer_id, 
	   orders.total_amt_usd AS average_order_value
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
WHERE orders.total_amt_usd > (SELECT AVG(orders.total_amt_usd) FROM orders)
ORDER BY average_order_value DESC;


--Joining the orders table and account table
--Tables:
--orders: account_id--foreign key
--web_events: account_id--foreign key
--Account: id--primary key 

SELECT accounts. id, 
       accounts. name, 
	   accounts. website,
	   orders. account_id, 
	   orders. standard_qty,
	   orders. standard_amt_usd   
FROM orders
JOIN accounts
ON orders. account_id = accounts. id
JOIN web_events
ON accounts. id = web_events. account_id;

--retrieve the total sales for each channel from which clients access the company. 
--Highlight high-value and low-value channels.
SELECT channel AS communication_channel, 
       SUM(total_amt_usd) AS total_sales,
       CASE WHEN SUM(total_amt_usd) > 60000000 THEN 'high_value'
	   ELSE 'low_value'
	   END AS value_category
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
JOIN web_events
ON web_events.account_id = accounts.id
GROUP BY channel
ORDER BY total_sales DESC;


--What is the total amount spent by each customer 
--Highlight the highest, medium, and lowest based on their specific channels.
SELECT orders.account_id, accounts.name AS customer_name, web_events.channel AS communication_channel,
       SUM(orders.total_amt_usd)AS total_money_spent,
    CASE 
        WHEN SUM(orders.total_amt_usd) > 850000 THEN 'Highest_customer'
        WHEN SUM(orders.total_amt_usd) BETWEEN 450000 AND 850000 THEN 'medium_customer'
        ELSE 'low_customer'
        END AS customer_category
FROM orders 
JOIN accounts  
ON orders.account_id = accounts.id
JOIN web_events
ON web_events.account_id = accounts.id
WHERE channel IN ('facebook', 'twitter', 'banner') 
GROUP BY accounts.name,  orders.account_id, web_events.channel
HAVING SUM(orders.total_amt_usd)> 350000  
ORDER BY total_money_spent DESC; 



 SELECT *
 FROM accounts;
 
SELECT *
 FROM sales_reps;
 
 SELECT *
 FROM region;

SELECT *
 FROM orders;

 SELECT *
 FROM web_events;
 
 
 
--calculate the revenue generated per month?
SELECT to_char(occurred_at, 'month') AS month_name, 
       sum(total_amt_usd) AS revenue_usd
FROM orders
GROUP BY month_name
ORDER BY revenue_usd DESC;

--Which paper type generated the most revenue in the last year(2016)?
SELECT sum(standard_amt_usd) AS standard_paper_revenue_usd,
       sum(gloss_amt_usd) AS gloss_paper_revenue_usd,
	   sum(poster_amt_usd) AS poster_paper_revenue_usd
FROM orders
WHERE orders.occurred_at::text LIKE '2016%';

--find customers who have made orders above the average order value
SELECT accounts.name AS customer_name, 
       accounts.id AS customer_id, 
	   orders.total_amt_usd AS average_order_value
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
WHERE orders.total_amt_usd > (SELECT AVG(orders.total_amt_usd) FROM orders)
ORDER BY average_order_value DESC;

--which paper type has the highest demand per quantity?
SELECT sum(standard_qty) AS standard_qty, 
       sum(gloss_qty) AS gloss_qty,
	   sum(poster_qty) AS poster_qty
FROM orders;

--what is the distribution of revenue by region?
SELECT region.id, region.name, SUM(total_amt_usd) AS total_revenue
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON sales_reps.region_id = region.id
GROUP BY region.name, region.id
ORDER BY total_revenue DESC;

--How many customers placed an order per year in Parch and Posey 
SELECT DATE_PART('year', occurred_at) AS year,
       COUNT(DISTINCT account_id) AS number_of_customers
FROM orders
GROUP BY year
ORDER BY year DESC;

--what is the date of the most recent transaction
--This is to enable us to understand the reason for the low count in 2017
SELECT MAX(occurred_at) AS latest_date
FROM orders;

--what are the numbers of customers that used the different channels for communication in Parch and Posey
SELECT DISTINCT channel AS communication_channels, 
       COUNT (DISTINCT account_id) AS number_of_customers
FROM web_events
GROUP BY communication_channels
ORDER BY number_of_customers DESC;
	   
--How many responses were gotten from each channel
SELECT channel, COUNT(channel) AS total_channel_responses
FROM web_events
GROUP BY channel
ORDER BY total_channel_responses DESC;

          --Same answer as the above (a and b)
		  
--How many customers who interacted with a web event placed an order?
SELECT channel, COUNT(web_events.id) AS customers_order
FROM accounts
JOIN web_events
ON accounts.id = web_events.account_id
GROUP BY channel
ORDER BY customers_order DESC;

--What are the names of customers that have spent above 100000 USD
SELECT accounts.name AS customers_name, orders.account_id, 
       SUM(orders.total_amt_usd)AS total_money_spent
FROM orders 
JOIN accounts 
ON orders. account_id = accounts. id
GROUP BY orders.account_id, name
HAVING SUM(total_amt_usd)>100000
ORDER BY total_money_spent;

--Which customer accounts generate the highest sales revenue
--what are their key attributes, such as industry, location, and purchase history? 

SELECT accounts.name AS customers_name, region.name AS region, orders.account_id, 
       SUM(orders.total_amt_usd)AS total_money_spent
FROM orders 
JOIN accounts 
ON orders. account_id = accounts. id
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON sales_reps.region_id = region.id
GROUP BY orders.account_id, accounts.name, region.name
ORDER BY total_money_spent DESC;

--What did each sales rep generate in revenue in the 2016 year
SELECT sales_reps.name,
     SUM(orders.total_amt_usd) AS revenue_generated
FROM sales_reps
JOIN accounts
ON sales_reps.id = accounts.sales_rep_id
JOIN orders
ON accounts.id = orders.account_id
WHERE orders.occurred_at::text LIKE '2016%'
GROUP BY sales_reps.name
ORDER BY revenue_generated DESC;

--What is the total number of sales reps by region
SELECT region.name AS region_name,
       COUNT(DISTINCT sales_reps.name) AS total_sales_reps
FROM sales_reps
JOIN region 
ON sales_reps.region_id = region.id
GROUP BY region.name
ORDER BY total_sales_reps DESC;

--How has sales revenue evolved
--what are the trends across different periods (daily, monthly, and yearly)?


latest_date
FROM orders


--what are the numbers of customers that used the different channels for communication in Parch and Posey
SELECT DISTINCT channel AS communication_channels, 
       COUNT (DISTINCT account_id) AS number_of_customers
FROM web_events
GROUP BY communication_channels
ORDER BY number_of_customers DESC;
	   
--How many responses were gotten from each channel
SELECT channel, COUNT(channel) AS total_channel_responses
FROM web_events
GROUP BY channel
ORDER BY total_channel_responses DESC;

--What are the names of customers that have spent above 100000 usd
SELECT name, orders.account_id, 
       SUM(orders.total_amt_usd)AS total_money_spent
FROM orders 
JOIN accounts 
ON orders. account_id = accounts. id
GROUP BY orders.account_id, name
HAVING SUM(total_amt_usd)>100000
ORDER BY total_money_spent;

--What did each sales rep generate in revenue in the 2016 year
SELECT sales_reps.name,
     SUM(orders.total_amt_usd) AS revenue_generated
FROM sales_reps
JOIN accounts
ON sales_reps.id = accounts.sales_rep_id
JOIN orders
ON accounts.id = orders.account_id
WHERE orders.occurred_at::text LIKE '2016%'
GROUP BY sales_reps.name
ORDER BY revenue_generated DESC;

--What is the total number of sales reps by region
SELECT region.name AS region_name,
       COUNT(DISTINCT sales_reps.name) AS total_sales_reps
FROM sales_reps
JOIN region 
ON sales_reps.region_id = region.id
GROUP BY region.name
ORDER BY total_sales_reps DESC;

--retrieve the total sales for each channel from which clients access the company. 
--Highlight high value and low value channels.
SELECT channel AS communication_channel, 
       SUM(total_amt_usd) AS total_sales,
       CASE WHEN SUM(total_amt_usd) > 60000000 THEN 'high_value'
	   ELSE 'low_value'
	   END AS value_category
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
JOIN web_events
ON web_events.account_id = accounts.id
GROUP BY channel
ORDER BY total_sales DESC;


SELECT usename FROM pg_user;






