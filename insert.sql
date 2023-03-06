-- 데이터 저장

-- DROP TABLE student;
-- DROP TABLE subject;
-- DROP TABLE product;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50)
);
DESC student;

-- INSERT 구문
-- INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...) VALUES (값1, 값2);
INSERT INTO student(student_id, name, grade, major)
VALUES (1, '홍길동', 3, '컴퓨터공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES(2, '김철수', 4, '전자공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (3, '이영희' ,2, '경영학과');

INSERT INTO student(student_id, name, grade, major)
VALUE (4, '티모', 1, '롤학과');

-- 테이블에 데이터를 삭제하는 명령어 사용해보기
DELETE FROM student; -- 테이블은 남겨두고 테이블 안에 있는 데이터만 삭제하는 명령어이다. 
-- 복수형으로 INSERT 쿼리문 작성하기
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1001, '김철수', 2, '컴퓨터공학과'),
    (1002, '이영희', 3, '수학과'),
    (1003, '박민수', 1, '전자공학과');
INSERT INTO student(student_id, name, grade, major)
VALUE 
	(1004, '홍길동', 1, '경영학과'),
    (1005, '이순신', 3, '컴퓨터공학과'),
    (1006, '진달래', 1, '미술학과');
-- INSERT 구문에서 복수행 쿼리를 실행할 때 하나라도 오류가 있으면 데이터는 정상 저장되지 않는다. 
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1007, '김철수2', 2, '컴퓨터공학과'),
    (1008, '이영희2', 3, '수학과'),
    (1008, '박민수2', 1, '전자공학과');
SELECT * FROM student;

-- 실습 1
SELECT * FROM customer;
INSERT INTO customer(id, name, email, address)
VALUES
	(1, '홍길동', 'hong@gmail.com', '전포동'),
    (2, '김철수', 'kim123@naver.com','연산동'),
    (3, '이영희', 'yy0980@naver.com', '중동'),
    (4, '이순신', 'lees@gmail.com', '전포동'),
    (5, '김은희', 'kimeunhee@daum.net', '장전동');

SELECT * FROM employee;
INSERT INTO employee(id, name, age, department)
VALUES
	(1, 'Rose', 32, '마케팅'),
    (2, 'Alice', 25, '세일즈'),
    (3, 'David', 44, '인사'),
    (4, 'Lily', 29, '회계'),
    (5, 'Andy', 35, '마케팅');
    
-- 실습 2
CREATE TABLE product(
	name VARCHAR(10) PRIMARY KEY,
    price INT NOT NULL,
    category VARCHAR(20)
);
DESC product;

INSERT INTO product(name, price, category)
VALUES ('의자', 105000, '가구');
INSERT INTO product(name, price, category)
VALUES ('사과', 5000, '과일');
INSERT INTO product(name, price, category)
VALUES ('립스틱', 50000, '화장품');
 
SELECT * FROM product;