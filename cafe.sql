CREATE DATABASE cafe;
USE cafe;

CREATE TABLE coffeeOrder(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL,
    menu TEXT NOT NULL,
    count INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELETE FROM coffeeOrder;


SELECT * FROM coffeeOrder;

DROP TABLE coffeeOrder;

INSERT INTO coffeeOrder(name, menu, count)
VALUES ('성희', '아메리카노', 55);
INSERT INTO coffeeOrder(name, menu, count)
VALUES ('홍길동', '카푸치노', 1);
INSERT INTO coffeeOrder(name, menu, count)
VALUES ('성희', '케이크', 3);
INSERT INTO coffeeOrder(name, menu, count)
VALUES ('강아지', '유자차', 2);

CREATE TABLE menu(
	id INT PRIMARY KEY AUTO_INCREMENT,
    menu VARCHAR(20) NOT NULL,
    price INT NOT NULL
);

INSERT INTO menu(id, menu, price)
VALUES 
(1, '에스프레소', 9000),
(2, '아메리카노', 10000),
(3, '카페라떼', 12000),
(4, '카푸치노', 12000),
(5, '자몽에이드', 15000),
(6, '청포도에이드', 15000),
(7, '유자차', 10000),
(8, '브라우니', 8000),
(9, '케이크', 13000),
(10, '스콘', 8000);

SELECT * FROM menu;

INSERT INTO menu(menu, price) VALUES ('베이글', 9000);
DELETE FROM menu  WHERE menu = '베이글';
UPDATE menu SET price = 10000 WHERE menu = '케이크';

DROP TABLE menu;
