--generating the sales reps_id, names, by only 1o rows
SELECT id, name
FROM sales_reps
LIMIT 10;

--what are the 5 last account names alphabetically
SELECT name
FROM accounts
ORDER BY name DESC
LIMIT 5;

-- List the company names that contain 'one' 
SELECT name
FROM accounts
WHERE name LIKE '%one%';

--list the primary_poc of a company whose name starts with 'De'
SELECT name, primary_poc
FROM accounts
WHERE name LIKE 'De%';

--list the accounts_name and websites of all accounts whose URL starts with 'www'
SELECT name, website
FROM accounts
WHERE website LIKE 'www%';

-- Get the list of orders where the standard_qty is >100
--account_id's (1001, 2671, and 3111. Sort the output by order_id)
SELECT id standard_qty, account_id
FROM orders
WHERE standard_qty >100 AND account_id IN (1001, 2671, 3111)
ORDER BY id;

--Get the orders where poster quantity <50 and account_id is not in (1001, 2671,3111)
--sort by order_id in a descending order
SELECT id, account_id, poster_qty
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


