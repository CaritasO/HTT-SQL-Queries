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

--How many customers placed an order in Parch and Posey 
SELECT COUNT(DISTINCT account_id) AS total_account_id
FROM orders;

--what are the different channels for communication used btw Parch and Posey
SELECT DISTINCT channel AS communication_channels
FROM web_events;
	   
--How many responses were gotten from each channel
SELECT channel, COUNT(channel) AS total_channel_responses
FROM web_events
GROUP BY channel
ORDER BY total_channel_responses DESC;

--What are the names of customers that have spent above 1000 usd
SELECT name, orders.account_id, 
       SUM(orders.total_amt_usd)AS total_money_spent
FROM orders 
JOIN accounts 
ON orders. account_id = accounts. id
GROUP BY orders.account_id, name
HAVING SUM(total_amt_usd)>100000
ORDER BY total_money_spent;





 
