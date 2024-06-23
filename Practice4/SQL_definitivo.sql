CREATE DATABASE IF NOT EXISTS lab4;
USE lab4;

DROP TABLE IF EXISTS tweet_retweet;
DROP TABLE IF EXISTS tweet_like;
DROP TABLE IF EXISTS following;
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
        admin boolean NOT NULL DEFAULT false,
  		PRIMARY KEY (user_id), 
  		UNIQUE KEY mail (mail),
        UNIQUE KEY usr(usr),
        UNIQUE KEY phone(phone)
);      

#Create Table to store the tweets
CREATE TABLE tweets (
		tweet_id int NOT NULL AUTO_INCREMENT,
        user_id int NOT NULL,
  		postDateTime datetime NOT NULL,
        usr varchar(255) NOT NULL,
  		text varchar(280),
        original_tweet_id INT DEFAULT 0,
  		PRIMARY KEY (tweet_id), 
        FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
        FOREIGN KEY (usr) REFERENCES users(usr) ON UPDATE CASCADE
);    

#Create Table to store the following
CREATE TABLE IF NOT EXISTS following(
	user_id int NOT NULL,
	user_id_follower int NOT NULL,
	PRIMARY KEY(user_id, user_id_follower),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
	FOREIGN KEY (user_id_follower) REFERENCES users(user_id) ON DELETE CASCADE
);

#Create Table to store the tweet likes
CREATE TABLE IF NOT EXISTS tweet_like(
	user_id int NOT NULL,
	tweet_id int NOT NULL,
	PRIMARY KEY(tweet_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id) ON DELETE CASCADE
);

#Create Table to store the retweets 
CREATE TABLE IF NOT EXISTS tweet_retweet(
	user_id int NOT NULL,
	tweet_id int NOT NULL,
	PRIMARY KEY(tweet_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id) ON DELETE CASCADE
);

#Populate users table
INSERT INTO users (name, usr, mail, pwd, gender, phone, birthday, owner, species1, species2, species3, admin) VALUES
('Marta', 'marta03', 'marta03@gmail.com', '123Abc*', 'Female', '605778899', '1983-08-01', 'Yes', 'Cat', 'Dog', 'Cat', false),
('Carla', 'carla02', 'carla02@gmail.com', '123Abc*', 'Female', '708445533' , '1990-06-02', 'No', NULL, NULL, NULL, false),
('Alexia', 'alexia44', 'alicej@gmail.com', '123Abc*', 'Other', '639176698', '1985-04-03', 'Yes', 'Cat', NULL, NULL, false),
('Fer', 'fer_2003', 'fer2003@gmail.com', '123Abc*', 'Do not specify', '608545621', '2003-09-03', 'Yes', 'Ferret', 'Dog', NULL, false),
('Admin', 'admin1', 'admin@example.com', '123Abc*', 'Male', '639137475', '2000-05-02', 'No', NULL, NULL, NULL, true);	

#Populate tweets table
INSERT INTO tweets (tweet_id, user_id, postDateTime, usr, text) VALUES
(1, 1, '2024-01-01 12:34:56', 'marta03', 'Hello!!:)'),
(2, 2, '2024-02-01 13:45:00', 'carla02', 'I love animals :)'),
(3, 3, '2024-03-01 14:56:30', 'alexia44', 'Have a nice day!'),
(4, 1, '2024-01-15 15:30:45', 'marta03', 'Did you know that octopuses have three hearts?'),
(5, 4, '2024-04-01 16:20:10', 'fer_2003', 'I just adopted a dog!');

#Populate following table
INSERT INTO following (user_id, user_id_follower) VALUES
(1, 2),
(3, 1),
(2, 1),
(2, 4),
(3, 4);

SELECT * FROM users;
SELECT * FROM tweets;
SELECT * FROM following ORDER BY user_id;
SELECT * FROM tweet_like;
SELECT * FROM tweet_retweet;