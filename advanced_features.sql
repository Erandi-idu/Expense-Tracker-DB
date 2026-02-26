-- 1. View showing monthly expense summary
CREATE VIEW Monthly_Expense_Summary AS
SELECT 
    strftime('%Y-%m', expense_date) AS month,
    C.category_name,
    SUM(E.amount) AS total_amount
FROM Expenses E
JOIN Categories C ON E.category_id = C.category_id
GROUP BY month, C.category_name;

-- 2. Performance optimization using Indexes
CREATE INDEX idx_expense_date ON Expenses(expense_date);

-- To speed up the search for expenses by user
CREATE INDEX idx_user_id ON Expenses(user_id);
