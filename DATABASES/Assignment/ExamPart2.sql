CREATE DATABASE Sales;

USE Sales;

CREATE TABLE cookie_sales(
	id INT auto_increment primary key,
    first_name VARCHAR(20) NOT NULL,
    sale_amount DECIMAL(5,2) NOT NULL,
    sale_date DATE NOT NULL
);

INSERT INTO cookie_sales (first_name, sale_amount, sale_date) VALUES ('Esteban', 85, '2024-07-08');
INSERT INTO cookie_sales (first_name, sale_amount, sale_date) VALUES ('Julian', 8, '2024-03-02');
INSERT INTO cookie_sales (first_name, sale_amount, sale_date) VALUES ('Pedro', 115, '2023-01-22');
INSERT INTO cookie_sales (first_name, sale_amount, sale_date) VALUES ('Johan', 50, '2022-09-18');
INSERT INTO cookie_sales (first_name, sale_amount, sale_date) VALUES ('Esteban', 205, '2024-05-08');

SELECT * 
FROM cookie_sales
WHERE sale_amount > 10;

SELECT first_name, SUM(sale_amount) AS total_sales
FROM cookie_sales
GROUP BY first_name;


SELECT first_name, SUM(sale_amount) AS total_sales
FROM cookie_sales
GROUP BY first_name
ORDER BY total_sales DESC;

SELECT first_name, ROUND(AVG(sale_amount), 2) AS average_sale_amount
FROM cookie_sales
GROUP BY first_name
ORDER BY average_sale_amount DESC;

SELECT first_name, MAX(sale_amount) AS max_sale_amount
FROM cookie_sales
GROUP BY first_name
ORDER BY max_sale_amount DESC
LIMIT 1;


