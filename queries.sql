-- 1. Showing all expenses with their category name
SELECT E.expense_date, E.description, E.amount, C.category_name 
FROM Expenses E
JOIN Categories C ON E.category_id = C.category_id;

-- 2. Calculating the total cost by each category
SELECT C.category_name, SUM(E.amount) AS total_amount
FROM Expenses E
JOIN Categories C ON E.category_id = C.category_id
GROUP BY C.category_name;

-- 3. වListing from highest to lowest cost
SELECT * FROM Expenses 
ORDER BY amount DESC;
