/*
				Assignment 2 
                  Worth 3%
                Total Assignment is out of 75 marks  
				Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements

*/


/*  NOTE   Please read all the questions before creating your table in question 1 as your table and data need to be good enough quality to satisfy the conditions for Question 3 - 6 */

 CREATE DATABASE ASSIGNMENT2;
 USE ASSIGNMENT2;
 
 /*
 Question 1
 
 Write 2 statements to Create two tables that have a way to force uniqueness from row to row and are related by one of their columns ( make sure you have a least 1 date column )   ( 15 marks )
 
 */
 
 CREATE TABLE Customers (
    CustomerID CHAR(6) PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Orders (
    OrderID CHAR(6) PRIMARY KEY,
    CustomerID CHAR(6),
    orderDate DATE NOT NULL,
    amount DECIMAL(10) NOT NULL
);

ALTER TABLE Orders
ADD CONSTRAINT fk_CustomerID
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

 
 /*
 Question 2
/////// NOTE rember the order of which table you insert into first is important
 
 Write 10 statements to add to the source table you created in question 1   ( 10 marks )
 
 Write 10 statements to add to the dependant table you created in question 1  ( 10 marks )
  
 */
 
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00000', 'John', 'Doe', 'john.doe@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00001', 'Jane', 'Smith', 'jane.smith@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00002', 'Michael', 'Johnson', 'michael.johnson@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00003', 'Emily', 'Brown', 'emily.brown@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00004', 'David', 'Wilson', 'david.wilson@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00005', 'Sarah', 'Taylor', 'sarah.taylor@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00006', 'James', 'Anderson', 'james.anderson@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00007', 'Olivia', 'Martinez', 'olivia.martinez@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00008', 'Daniel', 'Garcia', 'daniel.garcia@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00009', 'Sophia', 'Hernandez', 'sophia.hernandez@example.com');

INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00000', 'C00000', '2024-06-10', 100.50);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00001', 'C00001', '2024-06-10', 75.25);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00002', 'C00002', '2024-06-11', 150.75);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00003', 'C00003', '2024-06-11', 200.00);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00004', 'C00004', '2024-06-12', 50.90);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00005', 'C00005', '2024-06-12', 120.75);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00006', 'C00006', '2024-06-13', 80.00);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00007', 'C00007', '2024-06-13', 300.50);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00008', 'C00008', '2024-06-14', 150.25);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00009', 'C00009', '2024-06-14', 90.75);


 
 /*
 Question 3
 
 Write a SELECT statement that uses the LIKE statement and a character to find some of the records in one of your tables you created in Question 1 ( Use either the % or the _ for the rest of your wildcard)   ( 10 marks )
 
  select 
  LIKE Sfirst
 */
 
SELECT *
FROM Customers
WHERE lastName LIKE '_o%';

 
  /*
 Question 4
 
 Write a SELECT statement that uses the BETWEEN statement to find some of the records in one of your tables using the date column you created in Question 1  ( 10 marks )
 
  
 */
 
SELECT *
FROM Orders
WHERE orderDate BETWEEN '2024-06-11' AND '2024-06-12';
 
 
 /*
 Question 5
 
 Write a SELECT statement that uses another BETWEEN statement and sorts the data by 2 of the columns one in Ascending and one in Descending order on the tables you created in Question 1  ( 10 marks )
 
 */
 
 SELECT *
FROM Customers
WHERE CustomerID BETWEEN 'C00001' AND 'C00005'
ORDER BY firstName ASC, lastName DESC;

SELECT *
FROM Orders
WHERE orderDate BETWEEN '2024-06-10' AND '2024-06-14'
ORDER BY amount ASC, CustomerID DESC;


 
  /*
 Question 6
 
 Write a SELECT statement that selects a list of values (using the IN operator) from one of your tables, then use that same query and use the NOT operator to get the opposite data on the tables you created in Question 1   ( 10 marks )
 
  
 */
 
SELECT *
FROM Customers
WHERE CustomerID IN ('C00001', 'C00002', 'C00003');

SELECT *
FROM Customers
WHERE CustomerID NOT IN ('C00001', 'C00002', 'C00003');
 
  