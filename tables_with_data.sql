## Create the Departments Tables.
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

## Add the data in the departments Table.
INSERT INTO Departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Sales'),
(5,'Marketing');

## Create the employee Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary INT,
    ManagerID INT NULL,
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

## Add the data into the Employees table.
INSERT INTO Employees VALUES
(1,'Alice',1,90000,NULL,'2018-01-10'),
(2,'Bob',2,80000,1,'2019-03-15'),
(3,'Charlie',2,75000,2,'2020-05-21'),
(4,'David',3,85000,1,'2018-07-11'),
(5,'Emma',4,65000,4,'2021-02-20'),
(6,'Frank',4,70000,4,'2020-08-18'),
(7,'Grace',5,62000,1,'2022-01-05'),
(8,'Henry',2,78000,2,'2019-09-14'),
(9,'Ivy',3,69000,4,'2021-11-30'),
(10,'Jack',5,58000,7,'2023-01-15'),
(11,'Kevin',2,95000,1,'2017-04-10'),
(12,'Laura',1,71000,1,'2020-06-01'),
(13,'Mike',4,72000,5,'2021-07-07'),
(14,'Nancy',3,83000,4,'2019-10-19'),
(15,'Olivia',5,64000,7,'2022-05-05');


## Create the customer table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

## Add the data into the customer table.
INSERT INTO Customers VALUES
(101,'Rahul','Delhi'),
(102,'Priya','Mumbai'),
(103,'Ankit','Bangalore'),
(104,'Sneha','Pune'),
(105,'Vikas','Delhi'),
(106,'Riya','Hyderabad'),
(107,'Karan','Chennai'),
(108,'Neha','Jaipur'),
(109,'Arjun','Lucknow'),
(110,'Meera','Delhi'),
(111,'Rohit','Mumbai'),
(112,'Simran','Pune'),
(113,'Aman','Delhi'),
(114,'Nisha','Bangalore'),
(115,'Deepak','Kolkata');

## Create the orders tables.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    Amount DECIMAL(10,2),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

## Insert the data in orders tables.
INSERT INTO Orders VALUES
(1001,101,5,4500,'2024-01-02'),
(1002,102,6,6200,'2024-01-04'),
(1003,101,5,3800,'2024-01-10'),
(1004,103,8,5200,'2024-01-15'),
(1005,104,6,2500,'2024-02-01'),
(1006,105,5,4100,'2024-02-08'),
(1007,106,13,6100,'2024-02-20'),
(1008,107,13,7200,'2024-03-01'),
(1009,101,8,5300,'2024-03-05'),
(1010,109,5,4400,'2024-03-12'),
(1011,110,6,3100,'2024-03-15'),
(1012,111,13,8100,'2024-03-18'),
(1013,112,8,2300,'2024-03-20'),
(1014,105,5,5500,'2024-03-25'),
(1015,103,6,4700,'2024-04-01'),
(1016,101,8,6900,'2024-04-08'),
(1017,109,13,3500,'2024-04-15'),
(1018,110,5,2800,'2024-04-22'),
(1019,112,6,4900,'2024-05-02'),
(1020,114,8,6300,'2024-05-10');
