-- 여성과 남성을 구분하고 총 몇명인지 생성해주세요 
SELECT *, count(gender) as total
FROM employees
GROUP BY gender;

-- first_name이 A로 시작하는 사람을 묶어주세요 
SELECT *
FROM employees
GROUP BY emp_no
HAVING first_name LIKE 'A%';

SELECT * FROM salaries;
SELECT * FROM titles;
-- to_date별로 묶어 출력하세요 
SELECT *
FROM titles
GROUP BY to_date;

-- title 별로 출력하고 몇명인지 알려주세요 
SELECT *, count(title) as count
FROM titles
GROUP BY title;

SELECT * FROM dept_emp;

-- emp_no로 그룹을 나누고 title table에서 title과 salaries table에서 salary를 출력하세요 (join사용)
SELECT t.title, s.salary
FROM titles AS t
LEFT JOIN salaries AS s
ON t.emp_no = s.emp_no;

-- 위에서 출력한 값에서 연봉이 65000 이상인 사람만 출력하세요 (몇명인지도 출력)
SELECT t.title, s.salary, count(s.salary >= 65000) AS count
FROM titles AS t
LEFT JOIN salaries AS s
ON t.emp_no = s.emp_no
WHERE s.salary >= 65000;

-- Engineer(시니어 어시스턴트 일반 모두 포함) 이라는 직책을 가진 사원들의 최고 연봉을 출력하세요 
SELECT * FROM titles;
SELECT * FROM salaries;
SELECT MAX(salary)
FROM salaries
LEFT JOIN titles
ON salaries.emp_no = titles.emp_no
WHERE title LIKE '%Engineer%';

-- 각 부서에는 몇 명이 있는지 출력해보자 
SELECT * FROM departments; 

-- 각 직급 별로 몇명이 있는지 출력해보자
SELECT * FROM dept_manager;

-- employees 테이블과 salaries 테이블을 활용해서 남자 직원의 최고 연봉을 구하세요 