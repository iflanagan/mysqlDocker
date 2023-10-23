
Steps to create the image 

pre-requisities:

Have docker installed, I use docker desktop 
Be logged into docker 
Be logged into github 
have node.js installed locally or whever you want to run this from

Open a terminal window:
cd to that directory where you want to copy the files 

git pull https://github.com/iflanagan/mysqlDocker.git

# builds the image 
docker build -t mysqldemo .  

# starts the container of the image 
docker run -d -p 0.0.0.0:3306:3306 --name mysqlcontainer mysqldemo

# connect to the shell of the container

docker exec -it -u 0 mysqlcontainer  bash

mysql -u root -p (password is in the init.sql file) 
show databases;
use Demo;
select * FROM users;

now in the command prompt run the db connect node js script

node dbconnect.js <username> <password>

Make sure it can connect to the DB 

now run the testim test

https://app.testim.io/#/project/yUHggaUM53fuXM0PejOu/branch/master/test/neNt4O06k4cL55fQ
