# 🟢 Level 1: Easy (Basics)

## Q1. Display all employees.

```sql
SELECT *
FROM Employees;
```

---

## Q2. Display only employee name and salary.

```sql
SELECT EmployeeName,
       Salary
FROM Employees;
```

---

## Q3. Find employees whose salary is greater than 70,000.

```sql
SELECT EmployeeName,
       Salary
FROM Employees
WHERE Salary > 70000;
```

---

## Q4. Find employees who belong to the IT department.

```sql
SELECT e.EmployeeName,
       d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';
```

---

## Q5. Display employees sorted by salary in descending order.

```sql
SELECT EmployeeName,
       Salary
FROM Employees
ORDER BY Salary DESC;
```

---

## Q6. Display the top 5 highest-paid employees.

### MySQL / PostgreSQL

```sql
SELECT EmployeeName,
       Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 5;
```

### SQL Server

```sql
SELECT TOP 5
       EmployeeName,
       Salary
FROM Employees
ORDER BY Salary DESC;
```

---

## Q7. Count the total number of employees.

```sql
SELECT COUNT(*) AS TotalEmployees
FROM Employees;
```

---

## Q8. Find the highest salary.

```sql
SELECT MAX(Salary) AS HighestSalary
FROM Employees;
```

---

## Q9. Find the lowest salary.

```sql
SELECT MIN(Salary) AS LowestSalary
FROM Employees;
```

---

## Q10. Find the average salary of all employees.

```sql
SELECT AVG(Salary) AS AverageSalary
FROM Employees;
```


## Q11. Count the number of employees in each department.
```sql
SELECT DepartmentID,
       COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DepartmentID;

Q12. Find the average salary of each department.
SELECT DepartmentID,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;

Q13. Find the total salary paid in each department.
SELECT DepartmentID,
       SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID;

Q14. Find departments having more than 2 employees.
SELECT DepartmentID,
       COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 2;

Q15. Find departments whose average salary is greater than 75,000.
SELECT DepartmentID,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 75000;

Q16. Find the highest salary in each department.
SELECT DepartmentID,
       MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY DepartmentID;

Q17. Find the lowest salary in each department.
SELECT DepartmentID,
       MIN(Salary) AS LowestSalary
FROM Employees
GROUP BY DepartmentID;

Q18. Find the total number of employees in each department with department names.
SELECT d.DepartmentName,
       COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

Q19. Find the department with the highest total salary.
SELECT DepartmentID,
       SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY TotalSalary DESC
LIMIT 1;

Q20. Find departments where the maximum salary is greater than 90,000.
SELECT DepartmentID,
       MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY DepartmentID
HAVING MAX(Salary) > 90000;


# 🟠 Level 3: JOINs

## Q21. Display employee name along with department name.
```sql
SELECT e.EmployeeName,
       d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

Q22. Display all employees with their department names, including employees without a department.
SELECT e.EmployeeName,
       d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

Q23. Display all departments with their employees, including departments without employees.
SELECT d.DepartmentName,
       e.EmployeeName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

Q24. Display customer names along with their order amounts.
SELECT c.CustomerName,
       o.Amount
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

Q25. Display all customers including customers who never placed an order.
SELECT c.CustomerName,
       o.OrderID,
       o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

Q26. Find customers who never placed an order.
SELECT c.CustomerID,
       c.CustomerName
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

Q27. Display order details with customer and employee names.
SELECT o.OrderID,
       c.CustomerName,
       e.EmployeeName,
       o.Amount
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID
JOIN Employees e
ON o.EmployeeID = e.EmployeeID;

Q28. Find the total sales handled by each employee.
SELECT e.EmployeeName,
       SUM(o.Amount) AS TotalSales
FROM Employees e
JOIN Orders o
ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeName;

Q29. Find the number of orders placed by each customer.
SELECT c.CustomerName,
       COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;

Q30. Display employees and their managers using SELF JOIN.
SELECT e.EmployeeName AS Employee,
       m.EmployeeName AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID;


# 🔵 Level 4: Subqueries & EXISTS

## Q31. Find employees earning more than the average salary.

```sql
SELECT EmployeeName,
       Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

Q32. Find employees earning the maximum salary.
SELECT EmployeeName,
       Salary
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
);

Q33. Find employees earning less than the average salary.
SELECT EmployeeName,
       Salary
FROM Employees
WHERE Salary < (
    SELECT AVG(Salary)
    FROM Employees
);

Q34. Find the second highest salary.
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
);

Q35. Find the third highest salary.
SELECT MAX(Salary) AS ThirdHighestSalary
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employees
    )
);

Q36. Find employees working in the department with the highest average salary.
SELECT EmployeeName,
       DepartmentID,
       Salary
FROM Employees
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Employees
    GROUP BY DepartmentID
    ORDER BY AVG(Salary) DESC
    LIMIT 1
);

Q37. Find customers who have placed at least one order using EXISTS.
SELECT CustomerID,
       CustomerName
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);

Q38. Find customers who have never placed an order using NOT EXISTS.
SELECT CustomerID,
       CustomerName
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);

Q39. Find employees whose salary is greater than their department average.
SELECT EmployeeName,
       Salary,
       DepartmentID
FROM Employees e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

Q40. Find departments where at least one employee earns more than 90,000.
SELECT DepartmentID
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.DepartmentID = d.DepartmentID
    AND e.Salary > 90000
);
