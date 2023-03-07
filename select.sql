-- WHERE 사용해보기
SELECT * FROM student;

-- 학과가 '컴퓨터공학과' 학생들의 이름과 학번을 조회하고 싶을 때 
SELECT student_id, name 
FROM student
WHERE major = '컴퓨터공학과';

-- student 테이블 
-- 1. grade가 3인 학생들 조회하기 
SELECT * FROM student
WHERE grade = 3;

-- 2. 이름이 홍길동인 학생 조회하기
SELECT * FROM student
WHERE name = '홍길동';

-- 3. 학번이 1부터 10까지인 학생들 조회하기
SELECT * FROM student
WHERE student_id BETWEEN 1 AND 10;

-- 4. 학과가 디자인학과이고, 학년이 1학년인 학생들 조회하기
SELECT * FROM student
WHERE major = '디자인학과'
AND grade = 1;

-- 5. 학과가 컴퓨터공학과 이거나 학년이 2학년인 학생들 조회하기
SELECT * FROM student
WHERE major = '컴퓨터공학과'
OR grade = 2;

-- 6. 학생 이름이 홍길동이 아닌 학생들 조회하기
SELECT * 
FROM student
WHERE name != '홍길동';
-- WHERE name <> '홍길동';

-- 7. 학생들의 학년이 2학년 이상인 학생들 조회하기
SELECT *
FROM student
WHERE grade >= 2;

-- 8. 학생들의 학년이 2학년 미만인 학생들 조회하기
SELECT *
FROM student
WHERE grade < 2;

-- 9. 학년이 1학년이거나 3학년인 학생들 조회하기 (IN)
SELECT *
FROM student
WHERE grade IN(1, 3);

--
DROP TABLE subject;
DROP TABLE customer;

CREATE TABLE subject (
  subject_id INT AUTO_INCREMENT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);
INSERT INTO subject (subject_id, subject_name, credit, department, professor)
VALUES
(1, '영어회화', 3, '외국어학과', '김영희'),
(2, '프로그래밍 기초', 3, '컴퓨터공학과', '박철수'),
(3, '데이터베이스 개론', 3, '컴퓨터공학과', '이승호'),
(4, '컴퓨터 시스템 개론', 3, '컴퓨터공학과', '홍길동'),
(5, '선형대수학', 3, '수학과', '김영수'),
(6, '미적분학', 3, '수학과', '박순영'),
(7, '국어문학사', 3, '국어국문학과', '최지혜'),
(8, '국어문법론', 3, '국어국문학과', '이상호'),
(9, '일본어회화', 3, '외국어학과', '김현진'),
(10, '중국어학', 3, '외국어학과', '최영식'),
(11, '미국사', 3, '사학과', '박영진');

CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  address VARCHAR(100) NOT NULL
);
INSERT INTO customer (id, name, email, address) VALUES
(1, '김철수', 'kim@example.com', '서울시 강남구'),
(2, '박영희', 'park@example.com', '서울시 서초구'),
(3, '이민수', NULL, '경기도 성남시 분당구'),
(4, '최영진', 'choi@example.com', '서울시 송파구'),
(5, '한미영', 'han@example.com', '경기도 수원시 장안구'),
(6, '강종현', 'kang@example.com', '서울시 강서구'),
(7, '신영수', 'shin@example.com', '경기도 의정부시'),
(8, '유승환', 'yoo@example.com', '경기도 부천시'),
(9, '서민지', 'seo@example.com', '서울시 종로구'),
(10, '임진우', 'lim@example.com', '경기도 안양시 동안구');

-- subject 예제
SELECT * FROM subject;
-- 1. 과목 이름이 '미국사'인 데이터를 조회하세요
 SELECT *
 FROM subject
 WHERE subject_name = '미국사';
-- 2. 학점이 3점인 과목 데이터를 조회하세요
SELECT *
FROM subject
WHERE credit = 3;
-- 3. 국어국문학과에서 개설된 과목 데이터를 조회하세요 
SELECT *
FROM subject
WHERE department = '국어국문학과';
-- 4. 과목 이름이 '영어회화'이거나 교수명이 '이승호'인 과목 데이터를 조회하세요
SELECT *
FROM subject
WHERE subject_name = '영어회화'
	OR professor = '이승호';
-- 5. 과목 번호가 5보다 큰 데이터를 조회하세요
SELECT *
FROM subject
WHERE subject_id > 5;
-- 6. 과목 이름이 '데이터베이스 개론'이 아닌 데이터를 조회하세요
-- MySQL에 서 문자열 값을 다룰 때는 공백도 하나의 값으로 생각한다.
SELECT *
FROM subject
WHERE subject_name <> '데이터베이스 개론';
-- 7. 학과가 '컴퓨터공학과'이고 교수명이 '박철수'인 과목 데이터를 조회하세요
SELECT *
FROM subject
WHERE department = '컴퓨터공학과'
	AND professor = '박철수';
-- 8. 교수명이 '김현진'이거나 '최영식'이면서 학과가 '외국어학과'인 과목 데이터를 조회하세요
SELECT *
FROM subject
WHERE professor IN('김현진', '최영식')
	AND department = '외국어학과';
-- 습관적으로 검증 쿼리를 출력해볼 것
SELECT *
FROM subject
WHERE professor = '홍길동';




-- customer 도전과제 

SELECT * FROM customer;

-- 1. email을 입력하지 않은 사람을 조회하세요 
SELECT *
FROM customer
WHERE email IS NULL;

-- 2. 고객 id가 1 ~ 5번인 고객의 이름과 email을 조회하세요
SELECT name, email
FROM customer
WHERE id BETWEEN 1 AND 5;

-- 3. 서울시 강남구, 강서구가 주소인 고객을 조회하세요
SELECT *
FROM customer
WHERE address IN('서울시 강남구','서울시 강서구');

-- 4. 고객 이름이 '서민지' 이거나 '박영희'이면서 고객 id가 5번보다 큰 고객의 이름과 주소를 조회하세요 
SELECT name, address
FROM customer
WHERE name IN('서민지', '박영희')
	AND id > 5;
    
-- 5. 고객 id가 8번 이하이면서 주소가 '경기도 수원시 장안구'인 고객을 조회하세요
SELECT *
FROM customer
WHERE id <= 8
	AND address = '경기도 수원시 장안구';
    
-- 6. 강남 3구에 사는 사람들을 조회하세요 (서초구, 송파구, 강남구)
SELECT *
FROM customer
WHERE address IN('서울시 서초구','서울시 송파구','서울시 강남구');

-- 7. email이 NULL이 아니고 주문번호가 2번이 넘으며 종로구에 사는 고객을 조회하세요 
SELECT *
FROM customer
WHERE email IS NOT NULL
	AND id > 2
    AND address = '서울시 종로구';
    
-- 8. 주소가 '서울'이면서 id가 5 이하인 고객을 조회하세요
SELECT *
FROM customer
WHERE address LIKE '서울시%'
	AND id <= 5;
    
-- 9. 서울시에 사는 고객을 조회하세요
SELECT *
FROM customer
WHERE address LIKE '서울시%';

-- 10. id가 3-8까지인 고객 중 '경기도 의정부'에 거주하며 이메일을 입력한 고객을 조회하세요 
SELECT *
FROM customer
WHERE id BETWEEN 3 AND 8
	AND address = '경기도 의정부시'
    AND email IS NOT NULL;

