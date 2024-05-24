CREATE DATABASE IF NOT EXISTS seminar3;
USE seminar3;

DROP TABLE IF EXISTS comment_like;
DROP TABLE IF EXISTS tweet_like;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS followers;
DROP TABLE IF EXISTS tweets;
DROP TABLE IF EXISTS users;

#Create Table to store the users
CREATE TABLE users (
		user_id int NOT NULL,
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
		tweet_id int NOT NULL,
        user_id int NOT NULL,
  		timestamp date NOT NULL,
        usr varchar(255) NOT NULL,
  		text varchar(255),
  		PRIMARY KEY (tweet_id) 
);    

#Create Table to store the followers
CREATE TABLE IF NOT EXISTS followers(
	user_id int NOT NULL,
	user_id_follower int NOT NULL,
	PRIMARY KEY(user_id, user_id_follower)  
);

#Create Table to store the comments
CREATE TABLE IF NOT EXISTS comments(
	comment_id int NOT NULL,
	user_id int NOT NULL,
	tweet_id int NOT NULL,
    text varchar(255),
	PRIMARY KEY(comment_id)  
);

#Create Table to store the comments
CREATE TABLE IF NOT EXISTS comment_like(
	user_id int NOT NULL,
	comment_id int NOT NULL,
	PRIMARY KEY(user_id, comment_id)  
);

#Create Table to store the comments
CREATE TABLE IF NOT EXISTS tweet_like(
	user_id int NOT NULL,
	tweet_id int NOT NULL,
	PRIMARY KEY(tweet_id, user_id)  
);


ALTER TABLE tweets ADD FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE followers ADD FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE followers ADD FOREIGN KEY (user_id_follower) REFERENCES users(user_id);
ALTER TABLE comments ADD FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE comments ADD FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id);
ALTER TABLE comment_like ADD FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE comment_like ADD FOREIGN KEY (comment_id) REFERENCES comments(comment_id);
ALTER TABLE tweet_like ADD FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE tweet_like ADD FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id);

#Populate users table
INSERT INTO users (user_id, name, usr, mail, pwd, gender, phone, birthday, owner, species1, species2, species3) VALUES
(1, 'Marta', 'marta03', 'marta03@example.com', 'pAssword123*', 'Female', '605778899', '1980-01-01', 'Yes', 'Cat', 'Dog', 'Cat'),
(2, 'Carla', 'carla02', 'carla02@example.com', 'paSsword456/', 'Female', '708445533' , '1990-02-02', 'No', NULL, NULL, NULL),
(3, 'Alexia', 'alexia44', 'alicej@example.com', 'passWOrd789_', 'Other', '639176698', '1985-03-03', 'Yes', 'Cat', NULL, NULL),
(4, 'Maria', 'maria_2003', 'maria2003@example.com', 'passwOrD321!', 'Do not specify', '608545621', '2003-03-03', 'Yes', 'Ferret', 'Dog', NULL);

#Populate tweets table
INSERT INTO tweets (tweet_id, user_id, timestamp, usr, text) VALUES
(1, 1, '2024-01-01', 'marta03', 'Hello!!:)'),
(2, 2, '2024-02-01', 'carla02', 'This is my first tweet'),
(3, 3, '2024-03-01', 'alexia44', 'Have a nice day!'),
(4, 1, '2024-01-15', 'marta03', 'Another tweet'),
(5, 4, '2024-04-01', 'maria_2003', 'Today is sunny');

#Populate followers table
INSERT INTO followers (user_id, user_id_follower) VALUES
(1, 2),
(3, 1),
(2, 1),
(2, 4),
(3, 4);

#Populate comments table
INSERT INTO comments (comment_id, user_id, tweet_id, text) VALUES
(1, 2, 1, "Hi!"),
(2, 3, 1, "Great" ),
(3, 4, 2, "Welcome :)"),
(4, 1, 3, "You too"),
(5, 2, 4, "Yess!");

#Populate comment_like table
INSERT INTO comment_like (user_id, comment_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

#Populate tweet_like table
INSERT INTO tweet_like (user_id, tweet_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

SELECT * FROM users;
SELECT * FROM tweets;
SELECT * FROM followers;
SELECT * FROM comments;
SELECT * FROM comment_like;
SELECT * FROM tweet_like;


#QUERIES
#Query the tweets from all the users a concrete user is currently following. In this case user 1 is following user 2 and 3
SELECT T.* FROM tweets T
JOIN followers F ON T.user_id = F.user_id
WHERE F.user_id_follower = 1;
