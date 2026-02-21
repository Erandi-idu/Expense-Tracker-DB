-- 1. Creating Tables

-- Information about those using the system
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

-- Expense types (e.g. Food, Travel, Rent)CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL
);

-- Actual expense reports
CREATE TABLE Expenses (
    expense_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    category_id INTEGER,
    amount DECIMAL(10, 2),
    expense_date DATE,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
