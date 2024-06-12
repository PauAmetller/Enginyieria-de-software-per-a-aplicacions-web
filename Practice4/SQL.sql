CREATE DATABASE IF NOT EXISTS lab4;
USE lab4;

DROP TABLE IF EXISTS followers;
DROP TABLE IF EXISTS tweets;
DROP TABLE IF EXISTS users;

#Create Table to store the users
CREATE TABLE users (
		user_id int NOT NULL AUTO_INCREMENT,
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
  		PRIMARY KEY (user_id), 
  		UNIQUE KEY mail (mail),
        UNIQUE KEY usr(usr),
        UNIQUE KEY phone(phone)
);      

#Create Table to store the tweets
CREATE TABLE tweets (
		tweet_id int NOT NULL AUTO_INCREMENT,
        user_id int NOT NULL,
  		timestamp date NOT NULL,
        usr varchar(255) NOT NULL,
  		text varchar(255),
  		PRIMARY KEY (tweet_id),
        FOREIGN KEY (user_id) REFERENCES users(user_id),
		FOREIGN KEY (usr) REFERENCES users(usr)
);   
 
#Create Table to store the followers
CREATE TABLE IF NOT EXISTS followers(
	user_id int NOT NULL,
	user_id_follower int NOT NULL,
	PRIMARY KEY(user_id, user_id_follower), 
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (user_id_follower) REFERENCES users(user_id)
);


#Populate users table
INSERT INTO users (name, usr, mail, pwd, gender, phone, birthday, owner, species1, species2, species3) VALUES
('Marta', 'marta03', 'marta03@example.com', '123Abc*', 'Female', '605778899', '1980-01-01', 'Yes', 'Cat', 'Dog', 'Cat'),
('Carla', 'carla02', 'carla02@example.com', '123Abc*', 'Female', '708445533' , '1990-02-02', 'No', NULL, NULL, NULL),
('Alexia', 'alexia44', 'alicej@example.com', '123Abc*', 'Other', '639176698', '1985-03-03', 'Yes', 'Cat', NULL, NULL),
('Maria', 'maria_2003', 'maria2003@example.com', '123Abc*', 'Do not specify', '608545621', '2003-03-03', 'Yes', 'Ferret', 'Dog', NULL);

#Populate tweets table
INSERT INTO tweets (tweet_id, user_id, timestamp, usr, text) VALUES
(1, 1, '2024-01-01 13:45:00', 'marta03', 'Hello!!:)'),
(2, 2, '2024-02-01 22:12:33', 'carla02', 'This is my first tweet'),
(3, 3, '2024-03-01 11:23:05', 'alexia44', 'Have a nice day!'),
(4, 1, '2024-01-15 02:17:01', 'marta03', 'Another tweet'),
(5, 4, '2024-04-01 00:40:15', 'maria_2003', 'Today is sunny');

#Populate followers table
INSERT INTO followers (user_id, user_id_follower) VALUES
(1, 2),
(3, 1),
(2, 1),
(2, 4),
(3, 4);



SELECT * FROM users;
SELECT * FROM tweets;
SELECT * FROM followers;