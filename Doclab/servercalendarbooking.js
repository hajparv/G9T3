const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware to parse JSON data
app.use(bodyParser.json());

// Store appointment data
let appointmentData = null;

// Handle POST requests from booking.html
app.post('/appointment', (req, res) => {
  appointmentData = req.body;
  res.status(200).json({ message: 'Data received successfully.' });
});

// Handle GET requests from calendar.html
app.get('/appointment', (req, res) => {
  res.status(200).json(appointmentData);
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
