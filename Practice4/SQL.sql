CREATE DATABASE IF NOT EXISTS lab4;
USE lab4;

DROP TABLE IF EXISTS comment_like;
DROP TABLE IF EXISTS tweet_like;
DROP TABLE IF EXISTS comments;
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

#Create Table to store the comments
CREATE TABLE IF NOT EXISTS comments(
	comment_id int NOT NULL AUTO_INCREMENT,
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



ALTER TABLE comments ADD FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE comments ADD FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id);
ALTER TABLE comment_like ADD FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE comment_like ADD FOREIGN KEY (comment_id) REFERENCES comments(comment_id);
ALTER TABLE tweet_like ADD FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE tweet_like ADD FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id);

#Populate users table
INSERT INTO users (name, usr, mail, pwd, gender, phone, birthday, owner, species1, species2, species3) VALUES
('Marta', 'marta03', 'marta03@example.com', '123Abc*', 'Female', '605778899', '1980-01-01', 'Yes', 'Cat', 'Dog', 'Cat'),
('Carla', 'carla02', 'carla02@example.com', '123Abc*', 'Female', '708445533' , '1990-02-02', 'No', NULL, NULL, NULL),
('Alexia', 'alexia44', 'alicej@example.com', '123Abc*', 'Other', '639176698', '1985-03-03', 'Yes', 'Cat', NULL, NULL),
('Maria', 'maria_2003', 'maria2003@example.com', '123Abc*', 'Do not specify', '608545621', '2003-03-03', 'Yes', 'Ferret', 'Dog', NULL);

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
INSERT INTO comments (user_id, tweet_id, text) VALUES
(2, 1, "Hi!"),
(3, 1, "Great" ),
(4, 2, "Welcome :)"),
(1, 3, "You too"),
(2, 4, "Yess!");

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
#SELECT T.* FROM tweets T
#JOIN followers F ON T.user_id = F.user_id
#WHERE F.user_id_follower = 1;
#SELECT tweet_id,timestamp,text,usr FROM tweets AS T JOIN followers AS F ON T.user_id = F.user_id_follower WHERE T.user_id = 1 GROUP BY T.tweet_id ORDER BY timestamp DESC LIMIT 0,8 ;