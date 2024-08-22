-----------------------------------------DATA ENGINEERING------------------------------------------

CREATE TABLE EMPLOYEES (
	EMP_NO INT PRIMARY KEY,
	EMP_TITLE_ID VARCHAR(10),
	BIRTH_DATE DATE NOT NULL,
	FIRST_NAME VARCHAR(50) NOT NULL,
	LAST_NAME VARCHAR(50) NOT NULL,
	SEX CHAR(1) NOT NULL,
	HIRE_DATE DATE NOT NULL
);
CREATE TABLE DEPARTMENTS (
	DEPT_NO VARCHAR(10) PRIMARY KEY,
	DEPT_NAME VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE SALARIES (
	EMP_NO INT PRIMARY KEY,
	SALARY INT NOT NULL,
	FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO)
);
CREATE TABLE TITLES (
	TITLE_ID VARCHAR(10) PRIMARY KEY,
	TITLE VARCHAR(50) NOT NULL
);
CREATE TABLE DEPT_EMP (
	EMP_NO INT,
	DEPT_NO VARCHAR(10),
	PRIMARY KEY (EMP_NO,DEPT_NO),
	FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO),
	FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENTS(DEPT_NO)
);
CREATE TABLE DEPT_MANAGER (
	DEPT_NO VARCHAR(10) NOT NULL,
	EMP_NO INT NOT NULL,
	PRIMARY KEY (DEPT_NO, EMP_NO),
	FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO),
	FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENTS(DEPT_NO)	
);

-------------------------------------------DATA ANALYSIS-------------------------------------------

-- List the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW employee_salaries AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;
SELECT * FROM employee_salaries;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW employees_hired_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
SELECT * FROM employees_hired_1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW manager_info AS
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name  
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;
SELECT * FROM manager_info;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW employee_department_info AS
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;
SELECT * FROM employee_department_info;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW hercules_b AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
SELECT * FROM hercules_b;

-- List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW sales_department AS
SELECT e.emp_no, e.last_name, e.first_name 
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.dept_no = 'd007';
SELECT * FROM sales_department;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_and_development AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.dept_no IN ('d007', 'd005');
SELECT * FROM sales_and_development;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW frequency_counts AS
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
SELECT * FROM frequency_counts;