CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id Varchar(10), 
	birth_date Date,
	first_name Varchar(30),
	last_name Varchar(30),
	sex Varchar(5),
	hire_date Date,
	PRIMARY KEY (emp_no),
);


CREATE TABLE departments(
	dept_no Varchar(10) PRIMARY KEY,
	dept_name Varchar(30)
);


CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no Varchar(10),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no Varchar(10),
	emp_no INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary Float,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	title_id Varchar(10) PRIMARY KEY,
	title Varchar(30)
);


SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no;

SELECT first_name,last_name,hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date)=1986;

SELECT d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name
from departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no

SELECT d.dept_no,e.emp_no,e.last_name,e.first_name,d.dept_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no

SELECT first_name,last_name,sex
FROM employees
WHERE first_name='Hercules' AND last_name like 'B%';

SELECT e.emp_no,e.last_name,e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development');

SELECT last_name,count(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
