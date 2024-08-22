DROP DATABASE IF EXISTS db_retail;

CREATE DATABASE db_retail;

USE db_retail;

CREATE TABLE customers(
	customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone CHAR(13)
    );
    
CREATE TABLE orders(
	order_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT UNSIGNED,
    total_amount DECIMAL(10,2) UNSIGNED,
    
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
	);
    
CREATE TABLE products(
	product_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(8,2) UNSIGNED
	);
    
CREATE TABLE order_items(
	order_id INT UNSIGNED,
    product_id INT UNSIGNED,
    quantity INT UNSIGNED NOT NULL,
    
    FOREIGN KEY(order_id) REFERENCES orders(order_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
	);
    
-- CUSTOMER DATA VALUES
INSERT INTO customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '(555)555-1234'),
('Jane', 'Smith', 'jane.smith@example.com', '(555)555-5678'),
('Alice', 'Johnson', 'alice.johnson@example.com', '(555)555-8765');

INSERT INTO customers (first_name, last_name, email, phone) VALUE
('Esteban', 'Salazar', 'robando@example.com', '8888888884');

-- ORDERS DATA VALUES
INSERT INTO orders(order_date, customer_id, total_amount) VALUES
('2024-08-01', 1, 150.00),
('2024-08-02', 2, 200.00),
('2024-08-03', 3, 300.00);

-- PRODUCTS DATA VALUES
INSERT INTO products (product_name, price) VALUES
('Laptop', 1000.00),
('Mouse', 20.00),
('Keyboard', 30.00);

INSERT INTO products (product_name, price) VALUE
('Monitor', 300.00);

-- ORDER_ITEMS DATA VALUES
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), -- Order 1 contains 1 Laptop
(1, 2, 2), -- Order 1 contains 2 Mice
(2, 2, 1), -- Order 2 contains 1 Mouse
(2, 3, 1), -- Order 2 contains 1 Keyboard
(3, 1, 2); -- Order 3 contains 2 Laptops

-- TASK 1: Basic join queries
-- Customer Orders

SELECT CONCAT_WS(' ', CUS.first_name, CUS.last_name) 'Name', ORD.total_amount  'Total'
FROM customers CUS INNER JOIN orders ORD 
ON CUS.customer_id = ORD.customer_id;

-- Order Details

SELECT ORD.order_date, ORD_ID.product_id , PRO.product_name 'Name', SUM(ORD_ID.quantity) AS 'Quantity'
FROM order_items ORD_ID INNER JOIN products PRO INNER JOIN orders ORD
ON ORD_ID.product_id = PRO.product_id AND ORD_ID.order_id = ORD.order_id
GROUP BY ORD_ID.product_id, PRO.product_name, ORD.order_date
ORDER BY ORD.order_date, ORD_ID.quantity ASC;



-- TASK 2: Advanced Joins
-- Customers without orders
SELECT CUS.customer_id, CONCAT_WS(' ', CUS.first_name, CUS.last_name) AS 'Name', ORD.order_id
FROM customers CUS
LEFT JOIN orders ORD ON CUS.customer_id = ORD.customer_id
WHERE ORD.order_id IS NULL;

-- Products never ordered

SELECT PRO.product_id, PRO.product_name, ORD_ID.order_id
FROM products PRO
LEFT JOIN order_items ORD_ID ON PRO.product_id = ORD_ID.product_id
WHERE ORD_ID.order_id IS NULL;


-- Task 3 Agregate functions and joins
-- Total sales per product
SELECT PRO.product_id, PRO.product_name, SUM(ORD_ID.quantity) AS 'Total Quantity', SUM(ORD_ID.quantity * PRO.price) AS 'Total Sales'
FROM order_items ORD_ID 
LEFT JOIN products PRO ON PRO.product_id = ORD_ID.product_id
GROUP BY PRO.product_id, PRO.product_name
ORDER BY PRO.product_id;

-- Top Customer by Total Spend:
select * from customers;
select * from order_items;
select * from orders;
select * from products;

SELECT CONCAT_WS(' ', CUS.first_name, CUS.last_name) 'Name', CUS.phone AS 'Contact', ORD.total_amount
FROM customers CUS INNER JOIN orders ORD 
ON CUS.customer_id = ORD.customer_id
WHERE ORD.total_amount = (
    SELECT MAX(total_amount) FROM orders
)






    
