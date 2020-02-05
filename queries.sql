-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName
FROM Product as p
INNER JOIN Category as c on p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id as OrderId, c.CompanyName --, o.OrderDate    --Uncomment to show OrderDate column
FROM [Order] as o
INNER JOIN Customer as c on o.CustomerId = c.Id
WHERE o.OrderDate < '2012-08-09'
--ORDER BY o.OrderDate DESC    --Uncomment this to sort by OrderDate rather than OrderId
;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, od.Quantity
FROM [Order] as o
INNER JOIN OrderDetail as od on o.Id = od.OrderId
INNER JOIN Product as p on od.ProductId = p.Id
WHERE o.Id = 10251
ORDER BY p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id as OrderId, c.CompanyName as CustomerCompanyName, e.LastName as EmployeeLastName
FROM [Order] as o
LEFT JOIN Customer as c on o.CustomerId = c.Id
LEFT JOIN Employee as e on o.EmployeeId = e.Id
WHERE c.CompanyName IS NOT NULL;