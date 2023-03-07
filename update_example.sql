-- 도전과제 테이블 설계하기
CREATE TABLE movie(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director VARCHAR(10) NOT NULL,
    release_date DATE NOT NULL,
    genre VARCHAR(10) NOT NULL,
    rating DOUBLE NOT NULL
);
INSERT INTO movie (title, director, release_date, genre, rating)
VALUES
	('괴물', '봉준호', '2006-07-27', '드라마', 8.28),
    ('극한직업', '이병헌', '2019-01-23', '코미디', 9.20),
    ('명량', '김한민', '2014-07-30', '사극', 9.17),
    ('신과함께-죄와 벌', '김용화', '2017-12-20', '판타지', 7.56),
    ('밀양', '임권택', '2016-09-07', '드라마', 7.76),
    ('반도', '연상호', '2020-07-15', '액션', 6.71),
    ('베테랑', '류승완', '2015-08-05', '액션', 8.49),
    ('변호인', '양우석', '2013-12-18', '드라마', 8.41),
    ('군함도', '류승완', '2017-07-26', '사극', 8.01),
    ('암살', '최동훈', '2015-07-22', '액션', 8.37);
    
SELECT * FROM movie;
DESC movie;

-- 1. 장르가 '코미디'인 영화의 감독 이름을 '봉준호'로 수정 
UPDATE movie
SET director = '봉준호'
WHERE genre = '코미디';

-- 2. 2015년 개봉영화들의 평점 9.50으로 수정 
UPDATE movie
SET rating = 9.50
WHERE release_date LIKE '2015%';