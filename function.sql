
SELECT NOW(); -- 현재 날짜.시간
SELECT CURDATE(); -- 현재 날짜
SELECT CURTIME(); -- 현재 시간

-- String Function
SELECT ASCII('B');
SELECT CHAR_LENGTH('MY SQL TEST'); -- 공백 포함 문자열 길이
SELECT CONCAT('GREEN', 'CLASS', '100') AS title; -- 문자열 모두 더하기(공백도 입력 가능)
SELECT CONCAT_WS("->", "CLASS", "MYSQL", "홍길동"); -- 문자열 사이마다 첫번째 입력한것 추가
SELECT find_in_set('Q', 'S,Q,L'); -- 원하는 문자열의 위치를 숫자로 알려줌

SELECT format(2500.123, 0); -- 소수점 (0)번째 자리까지 출력
SELECT lcase('HELLO JAVA'); -- 소문자로 변경 
SELECT ucase('hello java'); -- 대문자로 변경 
SELECT trim('  MY  S Q L '); -- 문자 양 끝 공백 제거
SELECT replace('  MY  S Q L ', ' ', ''); -- ' '공백을 ''공백으로 변경

-- MySQL Numberic Function
SELECT * FROM buyTBL;
SELECT *, SUM(PRICE) AS '상품 가격의 총 합' FROM buyTBL;

SELECT *, (SELECT SUM(PRICE) FROM buyTBL) AS '총 합계'
FROM buyTBL;

SELECT * FROM buyTBL;
-- AVG
SELECT *, AVG(price) AS '상품 평균 가격'
FROM buyTBL;

SELECT *, (SELECT AVG(price) FROM buyTBL) AS 평균값
FROM buyTBL;


SELECT ceil(25.12); -- 올림 함수
SELECT round(123.67, 1); -- 반올림 함수
SELECT floor(25.75); -- 버림 함수

SELECT prodName, max(price)
FROM buyTBL;
SELECT min(price)
FROM buyTBL;
