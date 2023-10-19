# Use the official MySQL image as the base image
FROM mysql:8.0

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=test
ENV MYSQL_DATABASE=Demo

# Copy SQL initialization script into the container
COPY init.sql /docker-entrypoint-initdb.d/

# Copy the custom my.cnf to the container
COPY custom-my.cnf /etc/mysql/my.cnf
