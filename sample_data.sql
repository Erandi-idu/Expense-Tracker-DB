-- 1. Entering users
INSERT INTO Users (user_id, full_name, email) VALUES 
(1, 'Erandi Indunil', 'erandi@example.com'),
(2, 'John Doe', 'john@example.com');

-- 2.Entering expense types
INSERT INTO Categories (category_id, category_name) VALUES 
(1, 'Food'),
(2, 'Transport'),
(3, 'Education'),
(4, 'Entertainment');

-- 3. Entering expense reports
INSERT INTO Expenses (expense_id, user_id, category_id, amount, expense_date, description) VALUES 
(1, 1, 1, 1500.00, '2026-02-20', 'Dinner with friends'),
(2, 1, 3, 5000.00, '2026-02-21', 'SQL Course Fee'),
(3, 2, 2, 800.00, '2026-02-21', 'Bus fare to University');
