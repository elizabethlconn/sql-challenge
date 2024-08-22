# sql-challenge
module-9-challenge

1. Employees Table:

	•	Diagram: You have emp_no as the primary key and emp_title_id as a foreign key linking to the titles table (title_id).
	•	SQL: This matches the SQL code where emp_no is defined as the primary key, and emp_title_id is a foreign key reference to the titles table.

2. Departments Table:

	•	Diagram: You have dept_no as the primary key and dept_name as a unique and not null column.
	•	SQL: This matches the SQL code where dept_no is the primary key, and dept_name is defined as NOT NULL UNIQUE.

3. Salaries Table:

	•	Diagram: You have emp_no as the primary key and a foreign key that references employees(emp_no).
	•	SQL: This aligns with the SQL code where emp_no is the primary key and also a foreign key to the employees table.

4. Titles Table:

	•	Diagram: You have title_id as the primary key.
	•	SQL: This is consistent with the SQL code where title_id is defined as the primary key, and title is defined as NOT NULL.

5. Department Employees (dept_emp) Table:

	•	Diagram: You have emp_no and dept_no as a composite primary key, both of which are foreign keys referencing employees(emp_no) and departments(dept_no), respectively.
	•	SQL: This matches the SQL code where emp_no and dept_no are defined as the composite primary key and foreign keys to the respective tables.

6. Department Managers (dept_manager) Table:

	•	Diagram: You have dept_no and emp_no as a composite primary key, both of which are foreign keys referencing departments(dept_no) and employees(emp_no), respectively.
	•	SQL: This matches the SQL code where dept_no and emp_no are defined as the composite primary key and foreign keys.


The relationships are as follows:

	•	One-to-Many: employees to salaries (One employee can have multiple salaries over time).
	•	One-to-Many: employees to titles (One employee can have multiple titles over time).
	•	One-to-Many: departments to dept_emp (One department can have multiple employees).
	•	One-to-One: departments to dept_manager (One department has one manager).


