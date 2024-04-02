const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root1', // Replace with your user
    password: 'Sairaj@12345', // Replace with your password
    database: 'digipanchayat', // Replace with your database name
    port: 3306, // Assuming standard MySQL port
});

module.exports = pool;
