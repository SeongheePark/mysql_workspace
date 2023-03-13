CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    professor VARCHAR(50) NOT NULL
);

CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(subject_id) REFERENCES subject(subject_id)
);

-- 학생과 수강 테이블의 관계는? 1 : N
-- 과목과 수강 테이블의 관계는? 1 : N


-- 한 사람이 여러 개의 도시에서 여러번 여행을 다녀온 경우를 테이블로 구축해보세요
-- 사람과 도시의 관계를 관계차수로 표현해보세요 
-- 한 사람이 여러 도시 방문 / 한 도시에 여러 사람이 방문 
CREATE TABLE person(
	person_id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL 
);
CREATE TABLE city(
	city_id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
-- 중간 테이블 만들기
CREATE TABLE travel(
	person_id INT,
    city_id INT,
    trip_date DATE,
    PRIMARY KEY(person_id, city_id, trip_date),
    FOREIGN KEY(person_id) REFERENCES person(person_id),
	FOREIGN KEY(city_id) REFERENCES city(city_id)
);
INSERT INTO person
VALUES
	(1, '김영희'),
    (2, '박철수'),
    (3, '이민호'),
    (4, '한지민'),
    (5, '송혜교');
INSERT INTO city
VALUES
	(1, '서울'),
    (2, '부산'),
    (3, '제주'),
    (4, '홍콩'),
    (5, '도쿄');
INSERT INTO travel
VALUES
	(1, 1, '2022-07-10'),
    (1, 2, '2022-07-10'),
    (2, 5, '2022-07-10'),
    (2, 4, '2022-07-10'),
    (3, 3, '2022-07-10'),
    (4, 5, '2022-07-10'),
    (1, 4, '2022-07-10');
SELECT * FROM travel;

-- JOIN 구문을 활용해서 출력해보기
-- 1. 서울에 방문한 사람의 이름과 여행 날짜를 출력하세요 
SELECT name, trip_date
FROM person
LEFT JOIN travel
ON person.person_id = travel.person_id
WHERE city_id = 1;

-- 2. '박철수' 가 방문한 도시의 이름을 출력하세요 (서울 제외)
SELECT name, city_id
FROM person
LEFT JOIN travel
ON person.person_id = travel.person_id
WHERE city_id != 1;

-- 고객, 상품정보, 주문목록 --> N : M --> 중간 테이블 : 주문목록
CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);
CREATE TABLE product(
	product_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);
CREATE TABLE `order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY(product_id) REFERENCES product(product_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
