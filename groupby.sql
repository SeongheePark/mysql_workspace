use employees;
SHOW tables;
SELECT * FROM salaries
limit 10; -- 10개만 출력
SELECT * FROM salaries
limit 10, 5; -- 10번째부터 5개 출력 

-- EMP_NO로 그룹화 시켜줌
-- GROUP BY 조건절을 사용할 때는 HAVING 절을 사용 
SELECT * 
FROM salaries
GROUP BY EMP_NO
HAVING EMP_NO = 10001;

SELECT *, count(salary)
FROM salaries
GROUP BY emp_no;

SELECT *, count(salary) as count, MAX(salary) as MAX, 
		MIN(salary) as MIN, SUM(salary) as sum, round(avg(salary), 2) as avg
FROM salaries
GROUP BY emp_no;

SELECT * FROM employees;


-- 1단계
SELECT *
FROM employees
GROUP BY gender;

-- 2단계
SELECT *, count(gender)
FROM employees
GROUP BY gender;

-- 조건 2개 걸기
SELECT *, count(hire_date)
FROM employees
GROUP BY hire_date, gender;

SELECT * FROM employees;
-- dept_emp(N) : employees(1)
SELECT * FROM departments;
-- employees(N) : departments(M)
-- N:M관계차수를 가진다. 중간테이블 dept_emp을 만들어 표현하고 있다.
SELECT * FROM dept_emp;
-- dept_emp(N) : departments(1)

-- 1단계 조인해보기
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no;

-- 2단계 조인 2개
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 3단계
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 4단계
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no
GROUP BY dept_no
HAVING dept_no = 'd001';