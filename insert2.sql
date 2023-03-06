 
DESC student;

-- 이미 생성된 테이블 제약사항 변경하기
ALTER TABLE student MODIFY grade INT NULL;

INSERT INTO student(student_id, name, major)
VALUES (1, '홍길동', '검술학과');

-- grade 제약을 NOT NULL 변경해보기
ALTER TABLE student MODIFY grade INT NOT NULL;
-- 하나 행을 삭제하는 쿼리 - WHERE절 (조건절)
DELETE FROM student WHERE student_id = 1;
SELECT * FROM student;

-- major 컬럼 제약을 NOT NULL 변경해주세요 
ALTER TABLE student MODIFY major VARCHAR(50) NOT NULL;

-- 컬럼 선언 부분을 생략도 가능하다. 단, 전부 값을 넣으려고 하는 상황일 때 
INSERT INTO student VALUES (2, '홍길동2', 3, '검술학과');

-- INSERT 구문 컬럼명 선언 방식 
-- 1. 전부 작성하는 방법
-- 2. 제약사항이 NULL인 열이 있다면 넣고싶은 열만 지정해서 구문을 작성할 수 있다 
-- 3. 전부 데이터를 넣는 상황이라면 컬럼 선언부분을 생략 가능하다. 

-- NOT NULL과 디폴트 값 사용 
DROP TABLE student;
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
	major VARCHAR(50) DEFAULT '미정' NOT NULL
);
DESC student;

-- 디폴트 제약을 사용했을 때 값을 넣는 방법 - 1
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1, 'John', 3, '경영학과'),
	(2, 'Jane', 2, '경영학과'),
    (3, 'Mike', 1, DEFAULT),
    (4, 'David', 2, DEFAULT);
SELECT * FROM student;

-- 디폴트 제약을 사용했을 때 값을 넣는 방법 - 2
INSERT INTO student(student_id, name, grade)
VALUES 
	(5, '홍길동1', 2),
    (6, '홍길동2', 3),
    (7, '홍길동3', 1),
    (8, '홍길동4', 3);

-- professor 컬럼 제약사항을 DEFAULT로 추가하고 값을 빈 문자열로 만들어주세요 
-- 빈 문자열의 의미 ''
CREATE TABLE subject (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);
-- 테이블이 생성되어 있을 때 제약변경 DEFAULT 추가
ALTER TABLE subject MODIFY professor VARCHAR(50) DEFAULT "" NOT NULL;
    
    
    