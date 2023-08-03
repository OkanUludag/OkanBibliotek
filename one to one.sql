/*one to one relationship*/
/* Parent table */

CREATE TABLE employees (
	id INT PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(50),
	job_title VARCHAR(50)
);

INSERT INTO employees(id,name,email,job_title) VALUES(1,'Okan Uludag', 'Okan@outlook.com', 'Manager');

/*child table with foreign key*/

CREATE TABLE employee_details (
	employee_id INT PRIMARY KEY,
	date_of_birth DATETIME,
	adress VARCHAR(50),
	FOREIGN KEY(employee_id) REFERENCES employees(id)
);

INSERT INTO employee_details (employee_id, date_of_birth, adress) VALUES (1, '1996-12-23', 'Nystadsgatan 25');

SELECT employees.name, employees.email, employee_details.date_of_birth
FROM employees
INNER JOIN employee_details ON employees.id = employee_details.employee_id
WHERE employees.id = 1

INSERT INTO employees(id, name, email, job_title)
VALUES (2, ' Oskar Nilsson', 'Oscar@outlook.com', 'Sales Manager');

INSERT INTO employee_details (employee_id, date_of_birth, adress)
VALUES(2, '1990-11-15', 'Oslogatan 13');

SELECT employees.name, employees.email, employee_details.date_of_birth
FROM employees
INNER JOIN employee_details ON employees.id = employee_details.employee_id;

 