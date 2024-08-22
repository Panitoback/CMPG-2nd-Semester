CREATE DATABASE School;

USE School;
  
CREATE TABLE students(
	student_id INT primary key,
    student_name VARCHAR(50),
    student_age INT,
    registered_date DATE
);

INSERT INTO students (student_id, student_name, student_age, registered_date) VALUES (1, 'Alice', 20, '2024-01-15');
INSERT INTO students (student_id, student_name, student_age, registered_date) VALUES (2, 'Bob', 22, '2024-02-20');
	
UPDATE students
SET student_age = 23
WHERE student_id = 2;

DELETE FROM students
WHERE student_id = 1;


SELECT * FROM students;
SELECT * FROM students WHERE registered_date > '2024-01-31';
SELECT * FROM students WHERE student_age > 21;

SELECT student_name 
FROM students
ORDER BY student_name DESC;

SELECT student_name, student_age
FROM students
ORDER BY student_age DESC
LIMIT 1;

SELECT AVG(student_age) AS average_student_age
FROM students;

SELECT COUNT(*) AS num_students_2024
FROM students
WHERE registered_date > 2024-00-00;

SELECT student_age, COUNT(*) AS num_students
FROM students
GROUP BY student_age;
