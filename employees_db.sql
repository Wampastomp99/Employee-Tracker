
DROP DATABASE IF EXISTS employees_db;

CREATE DATABASE employees_db;

USE employees_db;

DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS employee;


CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE role (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  department_id INT, 
  PRIMARY KEY (id)
);

CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR (50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  role_id INT NOT NULL, 
  manager_id INT, 
  PRIMARY KEY (id)
);

INSERT INTO department (name)
VALUES ("Sales"), ("Engineering"), ("Human Resources"), ("Legal"), ("Finance"), ("Artist"), ("Executive");

INSERT INTO role (title, salary, department_id)
VALUES ("CEO", "100000", "1"), ("Software Developer", "70000", "2"), ("Lawyer", "60000", "3"), ("Lawyer", "60000", "4"), ("Actuary", "60000", "5"), ("Artist", "70000", "6"), ("Salesperson", "40000", "7");

INSERT INTO employees (first_name, last_name, role_id, manager_id)
VALUES ("Marion", "Knight", "1"), ("Bill", "Gates", "2", "1"), ("Rob", "Robson", "3", "1"), ("Ted", "Tenderoni", "4", "3"), ("Cisar", "Sarabius", "5", "1"), ("Tupac", "Shakur", "Artist", "6", "1"), ("Jordan", "Belfort", "1", "1");

SELECT e.id, e.first_name, e.last_name, d.name AS department, r.title, r.salary, CONCAT_WS(" ", m.first_name, m.last_name) AS manager FROM employees e LEFT JOIN employees m ON m.id = e.manager_id INNER JOIN role r ON e.role_id = r.id INNER JOIN department d ON r.department_id = d.id ORDER BY e.id ASC;

SELECT  r.id, r.title, r.salary, d.name as Department_Name FROM role AS r INNER JOIN department AS d ON r.department_id = d.id;

SELECT id, CONCAT_WS(' ', first_name, last_name) AS Employee_Name FROM employees;

-- UPDATE employees SET role_id = 3 WHERE id = 8;
UPDATE employees SET role_id = ? WHERE id = ?;

DELETE FROM department WHERE id = 13;