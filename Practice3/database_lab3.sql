CREATE DATABASE IF NOT EXISTS lab3;
USE lab3;

#Create Table to store the users
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  		name varchar(255) NOT NULL,
        usr varchar(255) NOT NULL,
  		mail varchar(255) NOT NULL,
  		pwd varchar(255) NOT NULL,
        gender varchar(255) NOT NULL,
        phone varchar(255) NOT NULL,
        birthday date,
        owner varchar(255) NOT NULL,
        species1 varchar(255),
        species2 varchar(255),
        species3 varchar(255),
  		PRIMARY KEY (usr), 
  		UNIQUE KEY mail (mail),
        UNIQUE KEY usr(usr),
        UNIQUE KEY phone(phone)
);      

SELECT * FROM users;