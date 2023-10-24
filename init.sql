
-- Create a new database
CREATE DATABASE IF NOT EXISTS Demo;

-- Use the newly created database
Use Demo;

-- Create a table for users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(100)
);

-- Insert data into the users table
INSERT INTO users (username, password, email) VALUES
    ('ronit', 'test@#$123', 'ronit@testim.io'),
    ('ianflanagan', 'test@#$123', 'ian@testim.io');

-- create stored proc
CREATE PROCEDURE GetUsers()
BEGIN
    SELECT username,password FROM users;
END;

-- Modify user authentication method for 'root' user
ALTER USER 'root'@'localhost' IDENTIFIED WITH 'caching_sha2_password' BY 'testim?5432';

-- Create a new MySQL user 'newuser'
CREATE USER 'newuser'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'testim123';

-- Grant all privileges to 'newuser' and 'root' (Be cautious with this, typically not recommended for security)
GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;


