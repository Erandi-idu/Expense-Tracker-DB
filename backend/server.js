const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const app = express();
const PORT = 3000;

app.use(express.json());

// Connecting to the Database and Creating Tables
const db = new sqlite3.Database('./expenses.db', (err) => {
    if (err) console.error(err.message);
    console.log('Connected to the SQLite database.');
});

// Create a table if it does not exist (to test)
db.run(`CREATE TABLE IF NOT EXISTS Expenses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    category_id INTEGER,
    amount REAL,
    expense_date TEXT,
    description TEXT
)`);

// 1. Get all expenses (GET)
app.get('/expenses', (req, res) => {
    db.all("SELECT * FROM Expenses", [], (err, rows) => {
        if (err) return res.status(400).json({"error": err.message});
        res.json({ "message": "success", "data": rows });
    });
});

// 2. Add a new expense (POST)
app.post('/expenses', (req, res) => {
    const { user_id, category_id, amount, expense_date, description } = req.body;
    const sql = 'INSERT INTO Expenses (user_id, category_id, amount, expense_date, description) VALUES (?,?,?,?,?)';
    const params = [user_id, category_id, amount, expense_date, description];

    db.run(sql, params, function(err) {
        if (err) return res.status(400).json({"error": err.message});
        res.json({ "message": "Expense added!", "id": this.lastID });
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
