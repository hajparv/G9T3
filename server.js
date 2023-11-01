const express = require("express");
const cors = require('cors')
const app = express();
const mysql = require('mysql');
const port = 5000;
app.use(express.json());
app.use(cors())
app.use(
    express.urlencoded({
        extended: true,
    })
);

// Create a MySQL database connection
const db = mysql.createConnection({
    host: 'localhost', // Replace with your MySQL host
    user: 'root', // Replace with your MySQL username
    password: '', // Replace with your MySQL password
    database: 'healthrecord', // Replace with your MySQL database name
});

db.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL database: ' + err.stack);
        return;
    }
    console.log('Connected to MySQL database as id ' + db.threadId);
});

app.get("/", (req, res) => {
    res.json({ message: "ok" });
});

app.post("/appointment", (req, res) => {
    console.log('req', req.body)
    const appointment = req.body;

    // Insert the appointment data into the database
    const sql = "INSERT INTO healthrecord.appointments (name, email, time, date, mobile, service, special_request) VALUES (?, ?, ?, ?, ?, ?, ?)";
    const values = [appointment.name, appointment.email, appointment.time, appointment.date, appointment.mobile, appointment.service, appointment.specialRequest];

    console.log('sql', sql)
    console.log('values', values)
    db.query(sql, values, (err, result) => {
        if (err) {
            console.error('Error inserting data into the database: ' + err.message);
            return res.status(500).send('Error saving appointment data to the database');
        }

        console.log('Appointment data saved to the database');
        res.status(201).json({ message: 'Appointment saved successfully' });
    });
});

app.get("/calendar/appointment", (req, res) => {
    const query = "SELECT * FROM healthrecord.appointments";
    db.query(query, (err, result) => {
        if (err) {
            console.error('Error getting data from the appointment database: ' + err.message);
            return res.status(500).send('Error getting data from the appointment database');
        }

        res.status(200).json(result);
    });
});


app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});


    