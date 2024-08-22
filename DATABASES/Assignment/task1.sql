/*
				Assignment 1 
                  Worth 3%
                Total Assignment is out of 75 marks  
		Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements

*/





/*
 Question 1
 
 Write a statement to Create a database (make sure your database doesn't contain special characters)  ( 5 marks )
 
*/

# Put your answer here
create database fruit_vendors;



/*
 Question 2
 
 Write a statement to Drop that Database you created in Question 1  ( 5 marks )
 
*/
drop DATABASE IF EXISTS fruit_vendors;


/*
 Question 3
 
 Write a statement to set the database you created to be the one that will be active for your session  ( 5 marks )
 
*/
use fruit_vendors;



/*
 Question 4
 
 Write a statement to Create a table that will have columns that represent all of the basic datatypes that are available in the databse  (make sure your table and column names are describe the content of the table)  ( 15 marks )
 example
 CREATE TABLE book_info (
     id                 VARCHAR(32)     not null,
     filePath           long varchar     null,
     price		        float     null ,
     title                  null,
     author             long varchar     null,
  );
*/

CREATE TABLE vendors_info(
ID char(6) primary key,
firstName varchar(20) not null,
lastName varchar(20) not null,
fruitType varchar(20) not null,
salary numeric (8,2)
);

/*
 Question 5
 
 Write 5 statements to add data to the table you created in question 4   ( 15 marks )

 */
 
INSERT INTO vendors_info (ID, firstName, lastName, fruitType, salary) VALUES ('202401', 'John', 'Smith', 'Apple', 2000);
INSERT INTO vendors_info (ID, firstName, lastName, fruitType, salary) VALUES ('202402', 'Song', 'Yiang', 'Banana', 1400);
INSERT INTO vendors_info (ID, firstName, lastName, fruitType, salary) VALUES ('202403', 'Francis', 'Salazar', 'Orange', 3500);
INSERT INTO vendors_info (ID, firstName, lastName, fruitType, salary) VALUES ('202404', 'Hugo', 'Correa', 'Grapes', 4000);
INSERT INTO vendors_info (ID, firstName, lastName, fruitType, salary) VALUES ('202405', 'Kamran', 'Donnor', 'Pineapple', 2200);

/*
 Question 6
 
 Write 2 statements to Create two tables that have a way to force uniqueness from row to row ( make sure your table and column names are describe the content of the table)   ( 10 marks )
 
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
 Question 7
 
 Write 5 statements to add to the first table you created in question 6   ( 10 marks )
 
 Write 5 statements to add to the second table you created in question 6  ( 10 marks )
  
 */
 
 
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00001', 'John', 'Doe', 'john.doe@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00002', 'Jane', 'Smith', 'jane.smith@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00003', 'Michael', 'Johnson', 'michael.johnson@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00004', 'Emily', 'Brown', 'emily.brown@example.com');
INSERT INTO Customers (CustomerID, firstName, lastName, email) VALUES ('C00005', 'David', 'Wilson', 'david.wilson@example.com');


INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00001', 'C00001', '2024-06-10', 100.50);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00002', 'C00002', '2024-06-10', 75.25);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00003', 'C00003', '2024-06-10', 150.75);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00004', 'C00004', '2024-06-11', 200.00);
INSERT INTO Orders (OrderID, CustomerID, orderDate, amount) VALUES ('O00005', 'C00005', '2024-06-11', 50.90);


