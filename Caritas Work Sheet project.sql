--generating all columns in the orders table
SELECT *
FROM orders;

--generating all information in the accounts table
SELECT *
FROM accounts;

--generate all information in the web_events table
SELECT *
FROM web_events;

--extract account_id, account_name, primary-poc from accounts table
SELECT id, name, primary_poc
FROM accounts; 

--generating the orders_id, total_qty, total_amount sold per order where amount is <= 1000
SELECT id, total, total_amt_usd
FROM orders
WHERE total_amt_usd <= 1000;

--generating how many times Facebook channel was used in the web_events table
SELECT COUNT (*) AS facebook_count
FROM web_events
WHERE channel = 'facebook'
LIMIT 3;

-- generating the first 6 rows in the orders table
SELECT *
FROM orders
LIMIT 6;

--generating the sales reps_id, names, by only 1o rows
SELECT id, name
FROM sales_reps
LIMIT 10;

--generating the first 3 times the Facebook channel was used in web_events
SELECT *
FROM web_events
WHERE channel = 'facebook'
LIMIT 3;
 
--return the 5 least orders in terms of largest total sales,
--include id, account_id, total_amt_usd to the smallest
 
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

--return the 5 top orders in terms of smallest total sales
-- include id, acount_id, total_amt_usd to the largest
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd ASC
LIMIT 5;

--what are the 5 last account names alphabetically
SELECT *
FROM accounts
ORDER BY name DESC
LIMIT 5;

--list the company names that start with e and sort them in desc_order
SELECT name
FROM accounts
WHERE name LIKE '%e' 
ORDER BY name DESC;

-- List the company names that contain 'one' somewhere
SELECT name
FROM accounts
WHERE name LIKE '%one';

--list the primary_poc of a company, but the company name starts with 'De'
SELECT primary_poc
FROM accounts
WHERE primary_poc LIKE 'De%';

--list the accounts_name and websites of all accounts whose URL starts with 'www'
SELECT name, website
FROM accounts
WHERE website LIKE 'www%';

--from web_events, find all info regarding individuals whose channels are organic, AdWords
--sort by the earliest date 
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords', 'facebook');

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords', 'facebook');

-- Get the list of orders where the standard_qty is >100
--account_id's (1001, 2671, and 3111. Sort the output by order_id.)
SELECT id, standard_qty, account_id
FROM orders
WHERE standard_qty >100 AND account_id IN (1001, 2671, 3111);

--Get orders where poster quantity < 50 and account_id is not in (1001, 2671,
3111) and sort by order_id in a descending order
SELECT * 
FROM orders
WHERE poster_qty <50 AND account_id NOT IN (1001, 2671, 3111)
ORDER BY id DESC;

--display the names, longitude, and latitude in the accounts table, 
--where lat is >50 or long is < -100
SELECT name, lat, long 
FROM accounts
WHERE lat >50 OR long <-100;

--Display the order ID, account_id, total_amt where the total_amt in USD exceeds 500
SELECT id, account_id, total_amt_usd
FROM orders
WHERE total_amt_usd >500;

--Display the order ID and total amount for orders between the range of $1000 to $5000.
SELECT id, total_amt_usd
FROM orders
WHERE total_amt_usd BETWEEN 1000 AND 50000;


