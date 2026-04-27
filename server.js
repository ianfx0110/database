const express = require('express');
const mysql = require('mysql2');
const app = express();
const dbconnn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '54321',
    database: 'Eldohub'
});

app.get('/students', (req, res) => {
    dbconnn.query('SELECT * FROM students', (err, results) => {
        if (err) {
            console.error('Error fetching students:', err);
            res.status(500).send('Error fetching students');
        } else {
            res.render("students.ejs", { students: results });
        }
    });
});
app.get("/newstudent", (req, res) => {
    res.render("newstudent.ejs");
});
app.post("/newstudent", (req, res) => {
    // insert new student into the database from a html form in to database
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});