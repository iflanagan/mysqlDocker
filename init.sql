-- Ian Flanagan Tricentis 2023 
-- Create a new database
CREATE DATABASE IF NOT EXISTS Demo;

-- Use the newly created database
USE Demo;

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

-- Create a table for results
CREATE TABLE results (
    date_time DATETIME NOT NULL,
    result_url VARCHAR(255) NOT NULL
);

-- Insert data into the results table
INSERT INTO results (date_time, result_url)
VALUES (CURRENT_TIMESTAMP(), 'https://app.testim.io/#/project/yUHggaUM53fuXM0PejOu/branch/master/test/CJnj0amO8qxeHyBH?result-id=mYAyHifMHUTZ123d');

-- Create a stored procedure to get users' email and password
CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT email, password FROM users;
END;

-- Modify user authentication method for 'root' user
ALTER USER 'root'@'localhost' IDENTIFIED WITH 'caching_sha2_password' BY 'testim?5432';

-- Create a new MySQL user 'newuser'
CREATE USER 'newuser'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'testim123';

-- Create a new MySQL user 'readproc' and grant execute privilege on GetAllUsers stored procedure
CREATE USER 'readproc'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'testim123.#$';
GRANT EXECUTE ON PROCEDURE Demo.GetAllUsers TO 'readproc'@'%';

-- Revoke all privileges from 'readproc'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'readproc'@'%';

-- Grant all privileges to 'newuser' and 'root' (Be cautious with this, typically not recommended for security)
GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;


