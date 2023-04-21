CREATE DATABASE bank;

-- user table 설계
CREATE TABLE user_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

-- 사용자의 계좌 정보 table
CREATE TABLE account_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,
    balance BIGINT NOT NULL COMMENT '계좌 잔액',
	user_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

-- 사용자들의 history table 설계
-- 입금 내역 저장, 출금 내역 저장, 사용자 간 이체 내역 저장
-- BIGINT : 8바이트 크기의 정수형 데이터 타입
CREATE TABLE history_tb(
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT '거래 내역 ID',
    amount BIGINT NOT NULL COMMENT '거래 금액',
    w_account_id INT COMMENT '출금 계좌 ID',
    d_account_id INT COMMENT '입금 계좌 ID',
    w_balance BIGINT COMMENT '출금 요청된 계좌 잔액',
    d_balance BIGINT COMMENT '입금 요청된 계좌 잔액',
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

INSERT INTO user_tb(username, password, fullname, created_at) values('길동', '1234','고', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('둘리', '1234','애기공룡', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('콜', '1234','마이', now());

INSERT INTO account_tb(number, password, balance, user_id, created_at) values('1111', '1234', 900, 1, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at) values('2222', '1234', 1100, 2, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at) values('333', '1234', 0, 3, now());
SELECT * FROM account_tb;

-- history 추적 내용 (이체, 입금, 출금)
-- 이체 내역을 기록 (1번계좌 -> 2번 계좌에 100원을 이체 한다)
INSERT INTO history_tb(amount, w_balance, d_balance, w_account_id, d_account_id, created_at)
values (100, 900, 1100, 1, 2, now());

-- 출금 내역 (1번 계좌에서 100원 출금 처리)
INSERT INTO history_tb(amount, w_balance, d_balance, w_account_id, d_account_id, created_at)
values (100, 800, null, 1, null, now());

-- 입금 내역 (1번 계좌에 500원 입금 처리)
INSERT INTO history_tb(amount, w_balance, d_balance, w_account_id, d_account_id, created_at)
values (500, null, 700, null, 1, now());

SELECT * FROM history_tb;
DELETE FROM history_tb;
ALTER TABLE history_tb AUTO_INCREMENT = 1;


-- 출금 내역 (3번이 1000원 출금, 잔액 0원인 상태 거래 내역 기록)
INSERT INTO history_tb(amount, w_balance, d_balance, w_account_id, d_account_id, created_at)
values (1000, 1000, null, 3, null, now());

SELECT * FROM history_tb;
SELECT * FROM account_tb;

SELECT *
FROM history_tb AS h
LEFT JOIN account_tb AS a
ON h.id = a.id;


-- 4/18 문제 풀어보기
-- 문제 1. history_tb 에서 계좌 id 1번인 입금 내역 만드시오 
SELECT *
FROM history_tb
WHERE d_account_id = 1;
-- 문제 2. history_tb 에서 계좌 id 1번인 출금 내역 만드시오
SELECT *
FROM history_tb
WHERE w_account_id = 1;
-- 문제 3. history_tb 에서 계좌 id 1번인 입출금 쿼리를 만드시오 
SELECT *
FROM history_tb
WHERE w_account_id = 1 or d_account_id = 1;

-- 4/19 문제 풀어보기
-- 문제 1 
-- history_tb 에서 입금 내역과 입금 계좌 번호를 join 을 사용해서 출력 하시오
SELECT h.*, a.number AS '입금 계좌번호'
FROM history_tb AS h
LEFT JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE d_account_id IS NOT NULL;

-- 문제 2 
-- history_tb 에서 출금 내역과 출금 계좌 번호를 join 을 사용해서 출력 하시오 
SELECT h.*, a.number AS '출금 계좌번호'
FROM history_tb AS h
LEFT JOIN account_tb AS a
ON h.w_account_id = a.id
WHERE w_account_id IS NOT NULL;

-- 4/20 쿼리 만들기
-- 입금 기록이 있는 사람의 이름과 계좌 잔액을 출력하세요 
SELECT username FROM user_tb;
SELECT balance FROM account_tb;
SELECT * FROM history_tb;
SELECT * FROM history_tb WHERE d_account_id IS NOT NULL; 


-- 입금 기록이 있는 사람의 이름과 계좌 잔액을 출력하세요 
SELECT u.username, a.balance
FROM user_tb AS u
JOIN account_tb AS a
ON u.id = a.user_id
WHERE u.id IN (SELECT d_account_id FROM history_tb WHERE d_account_id IS NOT NULL);



