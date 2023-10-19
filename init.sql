-- Create a new database
CREATE DATABASE IF NOT EXISTS Demo;

-- Use the newly created database
Use Demo;

-- Create a table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(100)
);

-- Insert some data
INSERT INTO users (username,password, email) VALUES
    ('ronit','test@#$123', 'ronit@testim.io'),
    ('ianflanagan','test@#$123', 'ian@testim.io');

ALTER USER 'root'@'localhost' IDENTIFIED BY 'testim?5432'; 

CREATE USER 'newuser'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'testim123';

--GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'%' IDENTIFIED BY 'testim123';
--GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'testim?5432';

GRANT SELECT ON DEMO.* TO 'newuser'@'%';

GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

FLUSH PRIVILEGES;

