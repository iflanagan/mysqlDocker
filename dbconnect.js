const mysql = require('mysql2');

if (process.argv.length < 4) {
  console.log('Usage: node script.js <username> <password>');
  process.exit(1);
}

const username = process.argv[2];
const password = process.argv[3];

// Create a connection pool
const connection = mysql.createConnection({
  host: 'localhost', // The host name or IP of your Docker container
  user: username,       // MySQL user (default is 'root')
  password: password,   // Your MySQL password
  database: 'Demo' // The name of your database
});

// Attempt to connect to the database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }

  console.log('Connected to MySQL database');

  // You can now execute SQL queries here
  // For example, retrieving data from a table:
  connection.query('SELECT * FROM users', (error, results, fields) => {
    if (error) {
      console.error('Error querying database:', error);
      return;
    }
    console.log('Query results:', results);
  });

  // Don't forget to close the connection when you're done
  connection.end((err) => {
    if (err) {
      console.error('Error closing MySQL connection:', err);
    } else {
      console.log('Connection closed');
    }
  });
});

