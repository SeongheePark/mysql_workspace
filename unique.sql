CREATE TABLE member(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(100) NOT NULL
);
INSERT INTO member (name, email, phone, address)
VALUES 
('홍길동', 'hong@test.com', '010-1234-5678', '서울시 강남구'),
('김영희', 'kim@test.com', '010-2345-6789', '서울시 서초구'),
('이철수', 'lee@test.com', '010-3456-7890', '서울시 종로구'),
('박민지', 'park@test.com', '010-4567-8901', '서울시 마포구'),
('최재영', 'choi@test.com', '010-5678-9012', '서울시 강서구'),
('강영식', 'kang@test.com', '010-6789-0123', '서울시 송파구');

SELECT * FROM member;
UPDATE member
SET address = '서울시 중구'
WHERE name = '이철수';

INSERT INTO member (name, email, phone, address)
VALUES 
('홍길동2', 'hong@test.com', '010-1234-5678', '서울시 강남구');

-- id가 2인 회원의 이름과 전화번호를 각각 '임성준' '010-9876-5432'로 수정 
UPDATE member
SET name = '임성준', phone = '010-9876-5432'
WHERE id = 2;
-- id가 5인 회원의 이메일과 주소를 각각 'leejaehyun@test.com' '서울시 강서구'로 수정
UPDATE member
SET email = 'leejaehyun@test.com', address = '서울시 강서구'
WHERE id = 5;
    