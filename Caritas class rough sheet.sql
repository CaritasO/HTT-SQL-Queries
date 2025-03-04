--how many customers do we have in Parch and posey 
SELECT COUNT (id)
FROM accounts

--how many customers placed an order in Parch and posey
SELECT COUNT (DISTINCT account_id)
FROM orders;

-- What are the names of the channels for communication between P and P and its customers 
SELECT DISTINCT channel AS communication_channel
FROM web_events; 

--What is the total amount, average amount, MIN, and MAX amount  tool by P and P
SELECT SUM(total_amt_usd) AS total_amt,
       AVG(total_amt_usd) AS average_total_amt,
	   MIN(total_amt_usd) AS Min_total_amt,
	   MAX(total_amt_usd) AS Max_total_amt
FROM orders;

--how much has each customer spent
SELECT 
FROM 
GROUP BY
ORDER BY

SELECT name, TRIM(name)
FROM accounts

--categorize the amount paid for the order into high_amt and low_amt
SELECT total_amt_usd, CASE 
              WHEN total_amt_usd >10000 THEN 'high_amt'
			  WHEN total_amt_usd <10000 THEN 'low_amt'
			  ELSE 'not_included'
			  END
FROM orders
ORDER BY total_amt_usd DESC;

SELECT DISTINCT account_id
FROM orders


SELECT *
FROM accounts 
WHERE lat > 42 or sales_rep_id = 321640
ORDER BY name desc;

SELECT *
FROM web_events

SELECT *
FROM orders

--JOIN
--Table A/B refers to the table names, Primary/foreign key refers to the corresponding column names
--Table A with primary key
--Table B with foreign key

SELECT --columns from both tables
FROM table A
JOIN table B
ON table A.primary key = Table B.foreign key


SELECT *
FROM accounts

SELECT *
FROM orders

--Table A = 'accounts' table, primary key = 'id' column
--Table B = 'orders' table, foreign key = 'account_id'

SELECT accounts.name, orders.occurred_at, id
FROM accounts
JOIN orders
ON accounts.id = orders.account_id

-- 
Fruit_set_A : (pear, banana, apple, grapes, orange)
Fruit_set_B: (watermelon, pear, apple, banana, pineapple, strawberry)

LEFT JOIN : (pear, banana, apple, grapes, orange, pear, apple, banana)
RIGHT JOIN: (watermelon, pear, apple, banana, pineapple, strawberry, pear, banana, apple)
INNER JOIN: (pear, apple, banana)
FULL OUTER JOIN: (pear, banana, apple, grapes, orange,watermelon, pear, apple, banana, pineapple, strawberry )



--TO INDICATE THE TYPE OF JOIN YOU WANT

SELECT --columns from both tables
FROM table A
FULL JOIN table B
ON table A.primary key = Table B.foreign key


--join region and sales_rep.
--join orders and web_events

-- Joining more than 2 tables
SELECT *
FROM table A
JOIN table B
ON table A.primary key = Table B.foreign key
JOIN Table C
ON table A.primary key = Table c. foreign key


Tables:
Orders : account_id --foreign key
web_events : account_id --foreign key
accounts: id -- primary key

SELECT orders.id Order_id, web_events.id Web_events_id
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
JOIN web_events
ON accounts.id = web_events.account_id


select count(DISTINCT account_id)
from orders

select *
from accounts

select *
from orders



--Inner Join
SELECT COUNT (DISTINCT accounts.id)
FROM accounts
FULL JOIN orders
ON accounts.id = orders.account_id

SELECT account_id, occurred_at
FROM web_events
UNION ALL
SELECT account_id,
		occurred_at
FROM orders











