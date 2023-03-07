CREATE TABLE school(
	school_id INT PRIMARY KEY,
    school_name VARCHAR(20) NOT NULL,
    city VARCHAR(20)
);
DROP TABLE student;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    grade VARCHAR(3) NOT NULL,
    school_id INT,
    FOREIGN KEY(school_id) REFERENCES school(school_id)
);
INSERT INTO school(school_id, school_name, city)
VALUES 
	(1, '서울대학교', '서울'),
    (2, '고려대학교', '서울'),
    (3, '연세대학교', '서울'),
    (4, '한양대학교', '서울');
SELECT * FROM school;

INSERT INTO student(student_id, student_name, grade, school_id)
VALUES
	(1, '홍길동', '1학년', 1),
    (2, '김유신', '2학년', 2),
    (3, '이순신', '1학년', 3),
    (4, '유관순', '3학년', 1),
    (5, '안중근', '2학년', 4);

-- 제약 키 FK 사용하게 된다면 여러가지 제약사항이 생기게 된다.
SELECT * FROM student;
DESC student;

INSERT INTO student(student_id, student_name, grade, school_id)
VALUES (6, '야스오', 1, 10);
/*
Error Code: 1452. 
Cannot add or update a child row: a foreign key constraint fails 
(`mydb`.`student`, CONSTRAINT `student_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`))
*/


-- 야구 팀과 야구선수 관계 1 : N
CREATE TABLE team(
	id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) NOT NULL
);
CREATE TABLE player(
	player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(50) NOT NULL,
    team_id INT,
    FOREIGN KEY(team_id) REFERENCES team(id)
);
INSERT INTO team (id, team_name)
VALUES
	(1, 'LG트윈스'),
    (2, 'NC다이노스'),
    (3, '두산베어스');
INSERT INTO player(player_id, player_name, team_id)
VALUES 
	(1, '허경민', 1),
    (2, '김하성', 2),
    (3, '최원준', 3);
    
-- 부서와 직원 관계 설계 
DROP TABLE department;
CREATE TABLE department(
	id INT PRIMARY KEY,
    department_name VARCHAR(10) NOT NULL
);
DROP TABLE employee;
CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES department(id)
);
DROP TABLE product;
DROP TABLE `order`;

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    price INT NOT NULL
);
CREATE TABLE `order`(
	order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES product(id)
);
INSERT INTO product(id, name, price)
VALUES
	(1, '노트북', 1000000),
    (2, '스마트폰', 700000),
    (3, '키보드', 500000);
INSERT INTO `order`(order_id, order_date, product_id)
VALUES
	(1, '2022-02-15', 2),
    (2, '2022-02-16', 1),
    (3, '2022-02-17', 3);




