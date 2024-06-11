CREATE DATABASE IF NOT EXISTS lab4;
USE lab4;

#Create Table to store the users
DROP TABLE IF EXISTS followers;
DROP TABLE IF EXISTS tweets;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
		id int NOT NULL AUTO_INCREMENT,
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
  		PRIMARY KEY (id), 
  		UNIQUE KEY mail (mail),
        UNIQUE KEY usr(usr),
        UNIQUE KEY phone(phone)
);      
CREATE TABLE tweets (
		id int NOT NULL AUTO_INCREMENT,
		user_id int NOT NULL,
 		user_name varchar(255) NOT NULL,
		postdatetime timestamp,
        content varchar(255),
  		PRIMARY KEY (id),
        FOREIGN KEY (user_id) REFERENCES users(id),
		FOREIGN KEY (user_name) REFERENCES users(usr)
);      

CREATE TABLE IF NOT EXISTS followers(
	user_id int NOT NULL,
	user_id_follower int NOT NULL,
	PRIMARY KEY(user_id, user_id_follower),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (user_id_follower) REFERENCES users(id)
);

SELECT * FROM users;
SELECT * FROM tweets;
SELECT * FROM followers;