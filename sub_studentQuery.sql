-- 중첩 쿼리문을 사용하여 각 부서의 번호와 해당되는 부서의 현재 
-- 매니저의 사번, 성, 이름, 생일을 조회해보자
SELECT * FROM employees;
SELECT * FROM dept_manager;


SELECT d.dept_no, d.emp_no, e.first_name, e.last_name, e.birth_date
FROM employees AS e
LEFT JOIN dept_manager AS d
ON d.emp_no = e.emp_no
WHERE d.emp_no IN (SELECT e.emp_no FROM dept_manager WHERE to_date = '9999-01-01'); 

-- 사원 중 남자인 직원들의 emp_no, dept_no, from_date, to_date를
-- join을 사용하지 않고 서브쿼리를 이용하여 출력해보자 
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT * 
FROM dept_emp AS d
WHERE d.emp_no IN (SELECT emp_no FROM employees WHERE gender = 'M');

SELECT emp_no, dept_no, from_date, to_date, gender
FROM (
	SELECT d.emp_no, d.dept_no, d.from_date, d.to_date, e.gender
    FROM dept_emp AS d
    RIGHT JOIN employees AS e
    ON d.emp_no = e.emp_no
    WHERE e.gender = 'M'
) AS employees;

--  from_date가 1990-01-01 보다 이상인 사원의 개발 부서와 emp_no, dept_no, from_date를 출력하세요. 중첩쿼리문을 꼭 사용하세요!
SELECT * FROM dept_emp WHERE from_date >= '1990-01-01' ORDER BY from_date;
SELECT * FROM departments WHERE dept_name = 'development';

SELECT d.dept_no, e.emp_no, e.from_date, d.dept_name
FROM departments AS d
LEFT JOIN dept_emp AS e
ON d.dept_no = e.dept_no
WHERE e.dept_no IN (SELECT dept_no FROM dept_emp WHERE e.from_date >= '1990-01-01') 
		AND d.dept_name IN (SELECT dept_name FROM departments WHERE dept_name = 'development')
ORDER BY from_date;

-- 개발 부서중 Susumu Picht 보다 입사일이 늦은사람 모두의 부서이름과 입사일, 사원정보를 출력하세요
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;

SELECT * FROM employees WHERE first_name = 'Susumu' AND last_name = 'Picht';   -- 1986-10-19
SELECT * FROM departments WHERE dept_no = 'd005';

select e.first_name, e.last_name 
from employees as e
inner join
(SELECT de.*
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
WHERE d.dept_no = 'd005' AND de.from_date > ALL
(SELECT de.from_date 
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
WHERE e.first_name = 'Susumu' AND e.last_name = 'Picht')
) as s
on e.emp_no = s.emp_no;

 SELECT * FROM departments AS d
    JOIN dept_emp AS de
    ON d.dept_no = de.dept_no
    WHERE d.dept_name='Development' AND from_date > 
    ALL(SELECT de.from_date FROM dept_emp AS de
    JOIN employees AS e
    ON e.emp_no=de.emp_no
    WHERE e.last_name='Picht'AND e.first_name='Susumu');

-- 중첩쿼리를 사용해서 개발부(Development)에서 아직 일하는 사람 중 생일이 4월인 사람의 first_name, birth_date, dept_name,to_date를 출력하시오.
 SELECT * FROM departments WHERE dept_name = 'Development';
 SELECT * FROM employees WHERE MONTH(birth_date) = '04';
 SELECT * FROM dept_emp WHERE to_date = '99990101';
select *
from
(  
SELECT de.*, d.dept_name
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
WHERE de.to_date = '99990101' AND d.dept_name = 'development'
) as t
inner join employees AS e
ON t.emp_no = e.emp_no
WHERE MONTH(e.birth_date) = '04';


SELECT e.first_name,e.birth_date,d.dept_name,de.to_date FROM employees AS e
    JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
    JOIN departments AS d
    ON de.dept_no = d.dept_no
    WHERE e.birth_date LIKE '%-04-%'
    AND e.emp_no 
    IN (SELECT de.emp_no FROM dept_manager WHERE de.to_date='99990101' AND de.dept_no 
    IN (SELECT d.dept_no FROM departments WHERE d.dept_name='Development'));


-- 인라인 뷰를 이용하여 성이 K로 시작하는 퇴사한 사람들의 
-- 가장 높은 연봉과 퇴사일 출력
SELECT * FROM employees WHERE first_name LIKE 'K%';
SELECT * FROM dept_emp WHERE to_date < '9999-01-01';
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM salaries;

SELECT em.emp_no, max(s.salary)
FROM (
SELECT e.* , d.to_date
FROM employees AS e
JOIN dept_emp AS d
ON e.emp_no = d.emp_no
WHERE e.first_name LIKE 'K%' AND d.to_date < '9999-01-01'
) AS em
Inner JOIN salaries AS s
ON em.emp_no = s.emp_no
GROUP BY em.emp_no;


SELECT e.first_name,d.to_date,max(s.salary)
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
WHERE d.to_date != '9999-01-01'
AND e.first_name LIKE 'K%'
GROUP BY first_name
order by max(s.salary) desc;

-- 종류별로 ->group by
-- table여러개 join, union



-- employees DB에 기록된 58~60년생 사이 사원들의 부서번호를 검색해보세요
-- 출력 조건은 상관X(최소 emp_no, dept_no는 나와야합니다)
SELECT * FROM employees WHERE YEAR(birth_date) BETWEEN '1958' AND '1960';
SELECT * FROM dept_emp;

SELECT * 
FROM employees AS e
JOIN dept_emp AS d
ON e.emp_no = d.emp_no
WHERE YEAR(birth_date) BETWEEN '1958' AND '1960';

select *
from dept_emp as d
inner join (
    select emp_no
    from employees
    where year(birth_date) between 1958 and 1960
    order by birth_date 
    ) as e
on d.emp_no = e.emp_no;

-- Marketing 부서중 2000년 01월 01 일 이후에(from_date) 입사한 남자의 
-- 이름과 생일,성별을 출력하시오.
SELECT * FROM departments WHERE dept_no = 'd001';
SELECT * FROM employees WHERE gender = 'M';
SELECT * FROM dept_emp WHERE from_date > '20000101';

SELECT e.first_name, e.last_name, e.birth_date, e.gender
FROM dept_emp AS de
JOIN employees AS e
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE e.gender = 'M' AND de.from_date > '20000101' AND d.dept_no = 'd001';

SELECT birth_date, first_name, last_name , gender
FROM employees
WHERE gender = 'M' AND emp_no IN (
SELECT de.emp_no FROM departments AS d
JOIN dept_emp AS de
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing' AND YEAR(from_date)='2000');

-- 현재 Engineer 중 입사일이 1989-08-24 이후인 사원들의
-- 사번, 직급, 성, 이름, 성별, 입사일을 입사일 기준 오름차순으로 출력해보자
SELECT * FROM titles WHERE title = 'Engineer';
SELECT * FROM employees;
SELECT * FROM dept_emp WHERE from_date > '1989-08-24';



