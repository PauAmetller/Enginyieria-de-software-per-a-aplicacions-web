CREATE DATABASE IF NOT EXISTS lab4;
USE lab4;

DROP TABLE IF EXISTS comment_like;
DROP TABLE IF EXISTS tweet_like;
DROP TABLE IF EXISTS comments;
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
  		PRIMARY KEY (user_id), 
  		UNIQUE KEY mail (mail),
        UNIQUE KEY usr(usr),
        UNIQUE KEY phone(phone)
);      

#Create Table to store the tweets
CREATE TABLE tweets (
		tweet_id int NOT NULL AUTO_INCREMENT,
        user_id int NOT NULL,
  		timestamp datetime NOT NULL,
        usr varchar(255) NOT NULL,
  		text varchar(255),
  		PRIMARY KEY (tweet_id), 
        FOREIGN KEY (user_id) REFERENCES users(user_id),
        FOREIGN KEY (usr) REFERENCES users(usr) ON UPDATE CASCADE
);    

#Create Table to store the following
CREATE TABLE IF NOT EXISTS following(
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
	PRIMARY KEY(tweet_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id)
);


ALTER TABLE comments ADD CONSTRAINT comments_fk1 FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE comments ADD CONSTRAINT comments_fk2 FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id) ON DELETE CASCADE;
ALTER TABLE comment_like ADD CONSTRAINT comment_like_fk1 FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE comment_like ADD CONSTRAINT comment_like_fk2 FOREIGN KEY (comment_id) REFERENCES comments(comment_id) ON DELETE CASCADE;
#ALTER TABLE tweet_like ADD CONSTRAINT tweet_like_fk1 FOREIGN KEY (user_id) REFERENCES users(user_id);
#ALTER TABLE tweet_like ADD CONSTRAINT tweet_like_fk2 FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id) ON DELETE CASCADE;
#Populate users table
INSERT INTO users (name, usr, mail, pwd, gender, phone, birthday, owner, species1, species2, species3) VALUES
('Marta', 'marta03', 'marta03@example.com', '123Abc*', 'Female', '605778899', '1980-01-01', 'Yes', 'Cat', 'Dog', 'Cat'),
('Carla', 'carla02', 'carla02@example.com', '123Abc*', 'Female', '708445533' , '1990-02-02', 'No', NULL, NULL, NULL),
('Alexia', 'alexia44', 'alicej@example.com', '123Abc*', 'Other', '639176698', '1985-03-03', 'Yes', 'Cat', NULL, NULL),
('Fer', 'fer_2003', 'fer2003@example.com', '123Abc*', 'Do not specify', '608545621', '2003-03-03', 'Yes', 'Ferret', 'Dog', NULL);

#Populate tweets table
INSERT INTO tweets (tweet_id, user_id, timestamp, usr, text) VALUES
(1, 1, '2024-01-01 12:34:56', 'marta03', 'Hello!!:)'),
(2, 2, '2024-02-01 13:45:00', 'carla02', 'This is my first tweet'),
(3, 3, '2024-03-01 14:56:30', 'alexia44', 'Have a nice day!'),
(4, 1, '2024-01-15 15:30:45', 'marta03', 'Another tweet'),
(5, 4, '2024-04-01 16:20:10', 'fer_2003', 'Today is sunny');

#Populate following table
INSERT INTO following (user_id, user_id_follower) VALUES
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
#INSERT INTO tweet_like (user_id, tweet_id) VALUES
#(1, 1),
#(2, 2),
#(3, 3),
#(4, 4);

SELECT * FROM users;
SELECT * FROM tweets;
#SELECT * FROM following ORDER BY user_id;
#SELECT * FROM comments;
#SELECT * FROM comment_like;
SELECT * FROM tweet_like;


#QUERIES
#Query the tweets from all the users a concrete user is currently following. In this case user 1 is following user 2 and 3
SELECT T.* FROM tweets T JOIN following F ON T.user_id = F.user_id_follower WHERE F.user_id = 1;

#Query followers
SELECT u.user_id, u.name FROM users u JOIN following f ON u.user_id = f.user_id WHERE f.user_id_follower = 1 ORDER BY u.name; 