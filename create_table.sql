-- 데이터베이스 생성
-- create database <데이터베이스 이름>
CREATE DATABASE mydb;
-- DB를 사용하려면 사용한다고 명령어를 실행해야 한다.
USE mydb;
-- 테이블 생성 or SQL 작성 시 어떤 DB를 사용해야 하는지 먼저 선택되어야 한다.

-- 테이블 생성
CREATE TABLE student(
	student_id INT,
    name VARCHAR(50) NOT NULL, -- VARCHAR : 0~50자까지 변할 수 있는 문자값을 받음
    grade INT NOT NULL,  -- NOT NULL : 비어있으면 안된다고 제약조건 설정
    major VARCHAR(50) NOT NULL
);

SELECT * FROM student;
desc student;

-- 과목 테이블 생성
CREATE TABLE subject(
	subject_id INT,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(50),
	professor CHAR(50) NOT NULL -- CHAR는 정해준 수대로 고정길이(50 지정하면 50만큼 길이 고정)
);

SELECT * FROM subject;
desc subject;

-- 이미 생성된 테이블에 PK(기본키(고유키) - 제약조건) 추가해보기
DESC student;
ALTER TABLE student ADD PRIMARY KEY(student_id);
-- 사전기반지식 : 특정 컬럼을 기본키로 만들게 되면 중복된 데이터를 허용하지 않고 NULL값이 있어서는 안된다. 

-- subject 테이블에 PK 추가 대상 - subject_id
DESC subject;
ALTER TABLE subject ADD PRIMARY KEY(subject_id);
-- 생성될 시점의 테이블 생성 명령어를 보여줘
SHOW CREATE TABLE student;

-- 테이블 삭제하는 명령어 확인 
DROP TABLE student;
DROP TABLE subject;

-- 테이블 생성 시에 PK를 추가하는 방법
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL
);
DESC student;

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(10) NOT NULL,
    professor VARCHAR(20) NOT NULL
);
DESC subject;

-- 도전과제 1
CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    age INT,
    department VARCHAR(10) NOT NULL
);
DESC employee;

-- 도전과제 2
CREATE TABLE customer(
	id INT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(50) NOT NULL
);
DESC customer;


CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT 
);
DESC product;

-- order 예약어 테이블 이름을 선점할 수 없다 
-- 하지만 강제적으로 `` 작은 따옴표를 사용해서 테이블 이름이라고 명시할 수 있다
CREATE TABLE `order`(
	id INT PRIMARY KEY,
    customer_order VARCHAR(50),
    product_name VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);
DESC `order`;

-- 도전과제 3
CREATE TABLE airplane(
	airplane_number INT PRIMARY KEY,
    flight_date DATETIME NOT NULL,
	seat_number INT NOT NULL,
    passenger_name VARCHAR(20) NOT NULL,
    airline_food BOOLEAN
);
DESC airplane;

Drop table airport;