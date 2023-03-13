
CREATE DATABASE seongheeblog;
USE seongheeblog;

CREATE USER 'heebloguser'@'%' IDENTIFIED BY '1q2w3e4r5t';

USE mysql;
SELECT user, host
FROM user;
SELECT *
FROM user
WHERE user = 'heebloguser';

GRANT ALL PRIVILEGES ON *.* TO 'heebloguser'@'%'; -- 오류

CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20),
    createDate TIMESTAMP
);
CREATE TABLE board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content BLOB,
    readCount int DEFAULT 0,
    userId INT,
    FOREIGN KEY(userId) REFERENCES user(id)
);


