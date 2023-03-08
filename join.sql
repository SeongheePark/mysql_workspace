
CREATE DATABASE shopdb;
USE shopdb;

CREATE TABLE userTBL(
	username CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(13) NOT NULL,
    PRIMARY KEY(username)
);
DESC userTBL;

ALTER TABLE userTBL
MODIFY mobile VARCHAR(13);

CREATE TABLE buyTBL(
	username CHAR(3) NOT NULL,
    prodName CHAR(3) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY(username) REFERENCES userTBL(username)
);

INSERT INTO userTBL VALUES('이승기', 1987, '서울', '010-1234-1234');
INSERT INTO userTBL VALUES('홍길동', 1911, '부산', '010-2222-3333');
INSERT INTO userTBL VALUES('이순신', 1999, '대구', '010-3333-4444');

INSERT INTO buyTBL VALUES('이승기', '운동화', 50, 1);
INSERT INTO buyTBL VALUES('이승기', '노트북', 150, 1);
INSERT INTO buyTBL VALUES('홍길동', '책', 10, 5);
INSERT INTO buyTBL VALUES('홍길동', '모니터', 200, 2);
INSERT INTO buyTBL VALUES('이순신', '청바지', 40, 1);
INSERT INTO buyTBL VALUES('이순신', '책', 10, 3);
-- 오류-> 부모테이블 userTBL에 '야스오'가 없는 사람이기 때문에 존재할 수 없다.
INSERT INTO buyTBL VALUES('야스오', '책', 10, 3);

SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- inner join
SELECT *
FROM userTBL
INNER JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- 회원 정보 추가하기
INSERT INTO userTBL(username, birthYear, addr, mobile)
VALUES ('야스오', 2020, '부산', '010-1234-1111');

-- left join
SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username;

SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username
WHERE buyTBL.username IS NOT NULL;

-- AS (별칭) 사용해서 다시 INNER JOIN
SELECT *
FROM userTBL AS U
INNER JOIN buyTBL AS B
ON U.username = B.username;

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username;

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE B.username IS NOT NULL;

-- LEFT JOIN 기준 테이블 선정
-- 기준 테이블 선정에 따라 결과집합이 다를 수 있다
-- 선정 기준은 작은 데이터를 기준으로 하는 것이 좋다
SELECT *
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.username = u.username;

-- RIGHT JOIN
SELECT u.username, b.prodName, b.price, b.amount
FROM userTBL AS u
RIGHT JOIN buyTBL as b
ON u.username = b.username;

SELECT 'a';
-- 함수 사용
SELECT u.username, b.prodName, b.price, b.amount, b.price * b.amount
FROM userTBL AS u
RIGHT JOIN buyTBL as b
ON u.username = b.username;


-- 1. 책을 구매한 사람의 이름과 전화번호를 조회하세요
SELECT u.username, u.mobile
FROM buyTBL AS b
INNER JOIN userTBL AS u
ON b.username = u.username
WHERE b.prodName = '책';

-- 2. 구매이력이 있는 사람을 조회하세요
SELECT *
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username
WHERE b.username IS NOT NULL;

-- 3. 구매금액이 50 이상인 사람의 이름, 생일, 주소를 조회하세요 
SELECT u.username, birthYear, addr
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username
WHERE b.price >= 50;

-- 4. 성이 '이'씨 이면서 태어난 연도가 1999년인 사람의 구매한 아이템 정보를 표시해주세요 
SELECT prodName, price, amount
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON b.username = u.username
WHERE u.username LIKE '이%'
	AND birthYear = 1999;
    
-- 5. 기준 테이블을 userTBL로 하고 LEFT JOIN을 사용하여 정보를 출력해보자
-- 단 주문 정보가 없는 경우 출력하지 않는다.
SELECT *
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username
WHERE prodName IS NOT NULL;

-- 6. LEFT JOIN을 사용하여 NULL 값도 확인할 수 있게 출력해보자
SELECT *
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username;

-- 7. userTBL 기준으로 INNER JOIN하고 buyTBL에서 수량이 3개 이상인 데이터만 조회
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE amount >= 3;

-- 8. buyTBL 기준으로 RIGHT JOIN하고 username이 '이승기'이거나 '야스오'이면서
-- userTBL의 username이 null이 아닌 데이터를 조회 
SELECT *
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON b.username = u.username
WHERE b.username IN ('이승기', '야스오')
	AND u.username IS NOT NULL;

-- 9. buyTBL 기준으로 태어난 연도가 1900 - 1990 사이이며,
-- 주소가 서울이 아닌 사람의 이름과 구매정보, 총 금액을 출력하세요 
SELECT b.username, prodName, price, amount, (price*amount) AS total
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON b.username = u.username
WHERE birthYear BETWEEN 1900 AND 1990
	AND addr != '서울'; 

-- 10. 기준 테이블로 buyTBL을 사용해서 LEFT JOIN을 수행하고 
-- 1999년에 태어난 사람은 총 몇개의 물품을 구매했는지 출력하세요 
SELECT b.username, amount
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.username = u.username
WHERE birthYear = 1999;
-- 11. 기준 테이블로 userTBL을 사용해서 INNER JOIN을 수행하고
-- '책'을 구매한 사람들의 이름과 전화번호를 출력하세요 
SELECT u.username, mobile
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE prodName = '책';
-- 12. 기준 테이블로 buyTBL을 사용해서 RIGHT JOIN을 수행하고
-- '대구'에 사는 사람이 구매한 물품들을 출력하세요
