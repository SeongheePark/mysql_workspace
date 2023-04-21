-- 트랜잭션 처리해보기
START TRANSACTION;

INSERT INTO user_tb(username, password, fullname)
VALUES ('seonghee', '1234', 'park');

INSERT INTO user_tb(username, password, fullname)
VALUES ('John', '5678', 'park');

ROLLBACK;

SELECT * FROM user_tb;


/*
	계좌 간 이체
    A 계좌 잔액 : 3000원   B 계좌 잔액 : 0원 
    A 계좌 --> B 계좌 3000원 이체하기
*/

-- test table 설정
UPDATE account_tb SET balance = 3000 WHERE id = 1;
UPDATE account_tb SET balance = 0 WHERE id = 2;
SELECT * FROM account_tb; 
SELECT * FROM history_tb; 

START TRANSACTION;
UPDATE account_tb SET balance = balance - 3000 WHERE id = 1; 
UPDATE account_tb SET balance = balance + 3000 WHERE id = 2; 
INSERT INTO history_tb(amount, w_balance, d_balance, w_account_id, d_account_id)
VALUES 
	(3000, 
	(SELECT balance FROM account_tb WHERE id = 1), 
    (SELECT balance FROM account_tb WHERE id = 2),
    1, 2);
COMMIT;

-- 4/20
SELECT * FROM history_tb;
-- 1번 계좌 출금 내역
SELECT * FROM history_tb WHERE w_account_id = 1;

-- 1번 계좌 입금 내역
SELECT * FROM history_tb WHERE d_account_id = 1;

-- 1번 계좌 입금 내역에 계좌번호 정보까지 결과 집합 만들기
SELECT h.id, h.amount, h.d_balance, a.number AS sender, h.created_at
FROM history_tb AS h
INNER JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE h.d_account_id = 1;

-- 1번 계좌의 출금 내역
SELECT h.id, h.amount, h.w_balance, a.number, h.created_at
FROM history_tb AS h
INNER JOIN account_tb AS a
ON h.w_account_id = a.id
WHERE h.w_account_id = 1;


-- 2단계
-- 1번 출금내역
SELECT h.id, h.amount, h.w_balance, wa.number AS sender, 
ifnull(h.d_account_id, 'ATM') AS receiver
FROM history_tb as h
LEFT JOIN account_tb as wa
ON h.w_account_id = wa.id
WHERE h.w_account_id = 1;

-- 1번 입금내역 
SELECT h.id, h.amount, h.d_balance, h.created_at, da.number AS receiver,
ifnull(h.w_account_id, 'ATM') AS sender
FROM history_tb as h
LEFT JOIN account_tb as da
ON h.d_account_id = da.id
WHERE h.d_account_id = 1;


-- 3단계 
-- receiver, sender의 계좌도 표시하기
SELECT h.id, h.amount, h.w_balance, wa.number AS sender, 
ifnull(h.d_account_id, 'ATM') AS receiver, da.number
FROM history_tb as h
LEFT JOIN account_tb as wa
ON h.w_account_id = wa.id
LEFT JOIN account_tb as da
ON h.d_account_id = da.id
WHERE h.w_account_id = 1;

-- 1번 계좌 입금 내역 + 출금 계좌 번호(이체)
SELECT h.id, h.amount, h.d_balance, h.created_at, da.number AS receiver,
ifnull(h.w_account_id, 'ATM') AS sender, wa.number
FROM history_tb as h
LEFT JOIN account_tb as da
ON h.d_account_id = da.id
LEFT JOIN account_tb as wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1;

-- 입출금내역
SELECT *
FROM history_tb 
WHERE w_account_id = 1 or d_account_id = 1;

SELECT h.id, h.amount, h.d_balance, h.created_at, da.number AS receiver,
ifnull(h.w_account_id, 'ATM') AS sender, wa.number
FROM history_tb as h
LEFT JOIN account_tb as da
ON h.d_account_id = da.id
LEFT JOIN account_tb as wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1 or h.w_account_id = 1;



-- 쿼리 결정
-- 입금 내역
SELECT h.id, h.amount, h.d_balance AS balance, h.created_at,
	ifnull(wa.number, 'ATM') AS sender, da.number AS receiver
FROM history_tb as h
LEFT JOIN account_tb as da
ON h.d_account_id = da.id
LEFT JOIN account_tb as wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1;

-- 출금 내역
SELECT h.id, h.amount, h.w_balance AS balance, h.created_at,
	ifnull(da.number, 'ATM') AS receiver, wa.number AS sender
FROM history_tb as h
LEFT JOIN account_tb as wa
ON h.w_account_id = wa.id
LEFT JOIN account_tb as da
ON h.d_account_id = da.id
WHERE h.w_account_id = 1;

-- CASE WHEN THEN END
SELECT h.id, h.amount, h.d_balance, h.created_at, da.number AS receiver,
ifnull(h.w_account_id, 'ATM') AS sender, wa.number
FROM history_tb as h
LEFT JOIN account_tb as da
ON h.d_account_id = da.id
LEFT JOIN account_tb as wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1 or h.w_account_id = 1;

SELECT h.id, h.amount,
CASE WHEN h.w_account_id = 1 THEN (h.w_balance)
	 WHEN h.d_account_id = 1 THEN (h.d_balance) END AS balance,
     ifnull(wa.number, 'ATM') AS sender,
     ifnull(da.number, 'ATM') AS receiver,
     h.created_at
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1 or h.w_account_id = 1;
