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
app.post("/newstudent", express.urlencoded({ extended: true }), (req, res) => {
    // insert new student into the database from a html form in to database

    console.log(req.body);
    const insertStatement = `INSERT INTO Students (student_id, fullname, email, password, phone_number) VALUES ( ${req.body.id}, '${req.body.fullname}', '${req.body.email}', '${req.body.password}', '${req.body.phone}')`

    dbconnn.query(insertStatement, (err) => {
        if (err) {
            res.status(500).send('Error inserting student' + err);
        } else {
            res.redirect("/students");
        }
    });
});

app.get("/newcourse", (req, res) => {
    res.render("newcourse.ejs");
});
app.post("/newcourse", express.urlencoded({ extended: true }), (req, res) => {
    // insert new course into the database from a html form in to database

    console.log(req.body);
    const insertStatement = `INSERT INTO Courses (course_id, course_name, course_description, lecturer, duration_in_months) VALUES ( ${req.body.id}, '${req.body.coursename}', '${req.body.description}', '${req.body.lecturer}', '${req.body.duration}')`

    dbconnn.query(insertStatement, (err) => {
        if (err) {
            res.status(500).send('Error inserting course' + err);
        } else {
            res.redirect("/courses");
        }
    });
});
app.listen(3000, () => {
    console.log('Server is running on port 3000');
});