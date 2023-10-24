-- Ian Flanagan Tricentis 2023 

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

-- create table results 

CREATE TABLE results (
    date_time DATETIME NOT NULL,
    result_url VARCHAR(255) NOT NULL
);

INSERT INTO results(date_time,result_url) VALUES(SELECT CURRENT_TIMESTAMP(),'https://app.testim.io/#/project/yUHggaUM53fuXM0PejOu/branch/master/test/CJnj0amO8qxeHyBH?result-id=mYAyHifMHUTZ123d');


-- create stored proc to get users 

CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT email,password FROM users;
END;

-- add and edit users 
ALTER USER 'root'@'localhost' IDENTIFIED WITH 'caching_sha2_password' BY 'testim?5432';

CREATE USER 'newuser'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'testim123';

CREATE USER 'readproc'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'testim123.#$';

GRANT EXECUTE ON PROCEDURE Demo.GetAllUsers TO 'readproc'@'%';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'readproc'@'%';


GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';


FLUSH PRIVILEGES;

