
create database db_sale;

use db_sale;

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS orderlines;
DROP TABLE IF EXISTS products;

CREATE TABLE customers(
	customer_id INT primary key,
    cFirstName VARCHAR(50),
    cLastName VARCHAR(50),
    cEmail VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE orderlines(
	orderline_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    foreign key(order_id) REFERENCES orders(order_id)
);

CREATE TABLE products(
	product_id INT PRIMARY KEY,
    productName VARCHAR(100),
    productPrice DECIMAL(5,2)
);

INSERT INTO customers (customer_id, cFirstName, cLastName, cEmail) VALUES

(1, 'Alvaro', 'Monge', 'alvaro.monge@example.com'),

(2, 'Jane', 'Doe', 'jane.doe@example.com');


INSERT INTO orders (order_id, customer_id, order_date) VALUES

(1, 1, '2023-07-01'),

(2, 2, '2023-07-02');



INSERT INTO orderlines (orderline_id, order_id, product_id, quantity) VALUES

(1, 1, 1, 2),

(2, 1, 2, 1),

(3, 2, 1, 1);



INSERT INTO products (product_id, productName, productPrice) VALUES

(1, 'Laptop', 999.99),

(2, 'Smartphone', 499.99);

-- JOIN:

SELECT *
FROM customers
NATURAL JOIN orders;

-- MULTIPLE JOIN:

SELECT *
FROM customers
NATURAL JOIN orders
NATURAL JOIN orderlines
NATURAL JOIN products;

SELECT *
FROM customers
NATURAL JOIN orders
NATURAL JOIN orderlines
NATURAL JOIN products
WHERE cFirstName = 'Alvaro' AND cLastName = 'Monge';

-- concepts

DROP TABLE IF EXISTS students;

CREATE TABLE students(
	student_id INT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    middle_name VARCHAR(30) NOT NULL,
    birth_date DATE,
    gender char(1)
);

-- SET ORDER OF COLUMN
ALTER TABLE students
MODIFY COLUMN last_name VARCHAR(30) AFTER middle_name;

-- UPDATE THE COLUMN NAME:
ALTER TABLE students
CHANGE COLUMN middle_name middle_initial CHAR(1);

-- UPDATE THE TABLE NAME:
ALTER TABLE students
RENAME TO students_info;

-- CHANGE DATA TYPE OF A COLUMN:
ALTER TABLE students_info
MODIFY COLUMN middle_initial CHAR(2);

-- GET A PART OF A TEXT IN A COLUMN:
SELECT SUBSTRING(first_name, 1,3)
from students_info;
-- Start at index 1 and go three characters

-- first-name column, determine the instance of characters a --> at which index
SELECT INSTR(first_name , 'a') AS position_of_A
FROM students_info;

-- STORAGE ENGINES:
-- A storage engines are components in DBMS that handles
-- with data storage and management in my database
-- Each storage has many engines
-- You choose the engine according to your application
-- show engines

SET DEFAULT_STORAGE_ENGINE  = INNODB;

DROP DATABASE IF EXISTS db_grade_center;

CREATE DATABASE db_grade_center;

use db_grade_center;

CREATE TABLE tbl_grade_center(
	first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    student_number CHAR(10) NOT NULL,
    course CHAR(8) NOT NULL,
    grade TINYINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (student_number, course)
);

-- check the structure
DESC tbl_grade_center;

INSERT INTO tbl_grade_center VALUES ('Phineas', 'Flynn', '1234510001','COMP2003', 88);

INSERT INTO tbl_grade_center VALUES ('Ferb', 'Fletcher', '1234510002','COMP2003', 100);

INSERT INTO tbl_grade_center VALUES ('Candace','Fletcher', '1234510003','COMP2003', 60);

INSERT INTO tbl_grade_center VALUES ('Baljeet', ' ', '1234510004','COMP2003', 100);

INSERT INTO tbl_grade_center VALUES ('Major', 'Monogram ', '1234510005','COMP2003', 50);

INSERT INTO tbl_grade_center VALUES ('Dr.', 'Doofenshmirtz', '1234510006','COMP2003', 55);

INSERT INTO tbl_grade_center VALUES ('Isabella', 'Garcia-Shapiro', '1234510007','COMP2003', 90);

INSERT INTO tbl_grade_center VALUES ('Phineas', 'Flynn', '1234510001','COMP2007', 79);

INSERT INTO tbl_grade_center VALUES ('Ferb', 'Fletcher', '1234510002','COMP2007', 100);

INSERT INTO tbl_grade_center VALUES ('Candace', 'Fletcher', '1234510003','COMP2007', 72);

INSERT INTO tbl_grade_center VALUES ('Baljeet', ' ', '1234510004','COMP2007', 100);

INSERT INTO tbl_grade_center VALUES ('Major', 'Monogram ', '1234510005','COMP2007', 68);

INSERT INTO tbl_grade_center VALUES ('Dr.', 'Doofenshmirtz', '1234510006','COMP2007', 78);

INSERT INTO tbl_grade_center VALUES ('Isabella', 'Garcia-Shapiro', '1234510007','COMP2007', 88);

INSERT INTO tbl_grade_center VALUES ('Darcy', 'Ricetto', '1234567890','COMP2007', 88);

SELECT *
FROM tbl_grade_center;

-- we are creating a table from another table
CREATE TABLE tbl_student_information AS
(SELECT student_number, first_name, last_name
from tbl_grade_center);

CREATE TABLE tbl_students_information AS
(SELECT DISTINCT student_number, first_name, last_name
from tbl_grade_center);

SELECT * FROM tbl_students_information;

-- DISTINCT was used to select each student only one time
-- in the created table we want to make the
-- student number a primary key

ALTER TABLE tbl_students_information
ADD CONSTRAINT pk_student_number PRIMARY KEY (student_number);

ALTER TABLE tbl_students_information
ADD CONSTRAINT pk_two_columns PRIMARY KEY (student_number, first_name);

-- if I want to delete the consstraint I will use its name

ALTER TABLE tbl_students_information
DROP CONSTRAINT pk_student_number;

-- Add a constraint that the student number
-- is valid and present in the table_grande_center

ALTER TABLE tbl_students_information 
ADD CONSTRAINT fk_student_number
FOREIGN KEY(student_number) REFERENCES table_grade_center (student_number);

-- NOTES ABOUT CONSTRAING
-- If I am adding priary key for one column, we don't use constraint
-- I am adding primary key for two columns, then we use constraint

-- we created a constraint for primary key (two columns) with no name for the rule
-- but now, we want to delete the constraint

SELECT CONSTRAINT_NAME
from information_schema.table_constraints

WHERE table_schema = 'db_grade_center'

AND TABLE_NAME = 'tbl_students_information'
AND CONSTRAINT_TYPE = 'PRIMARY KEY';

