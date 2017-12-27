--2  Retrive the supplier and customer name and city information who lives in the same city.
SELECT Supplier.SName, Customer.CName,Customer.CCity
FROM Supplier
INNER JOIN Customer
ON Supplier.SCity = Customer.CCity;


--3-}Retrieve customer name, customer city and order amount according to order amount between 10 and 20.

SELECT Customer.CName,Customer.CCity,Orders.OrderAmount
FROM Customer
inner JOIN Orders
ON Orders.OrderAmount between 10 AND 20

--4 }Write a SQL query that retrieve a list that contains which 
--supplier are working for which customer and obtains a commission from the enterprise is greater than 15%.
SELECT Customer.CName,Supplier.SName
FROM Supplier
INNER JOIN Customer
ON Supplier.SID=Customer.SID and Supplier.Commission>60

-- 5) Retrive the name and city of customers who works by own or for a Supplier and has a grade less than 150.
SELECT Customer.CName,Customer.CCity
FROM Customer 
LEFT  JOIN Supplier 
ON Customer.Grade<150 


--6) Retrieve Cname, CCity, OrderDate, OrderAmount, SName, Scity, and commission 
--information that any customers have ordered one or more orders by their supplier or by own.

SELECT Customer.CName,Customer.CCity,Orders.OrderDate,Orders.OrderAmount,Supplier.SName,Supplier.SCity,Supplier.Commission
FROM Customer 
INNER JOIN Orders  on
Customer.CID=Orders.CID
LEFT  JOIN Supplier  on
Supplier.SID=Orders.SID

--7) Retrieve supplier name and city information who works any (one, more or no) 
--customer and any of the customers who placed either any supplier (one, more or no).


SELECT Supplier.SName,Customer.CCity,Orders.OrderDate,Orders.OrderAmount
FROM Supplier 
RIGHT JOIN Customer 
ON Supplier.SID=Customer.SID 

--8) Write a stored procedure that retrieve customer and order information 
--who placed any order (one or more) or any orders have been placed by the customer who is not on the database

CREATE PROCEDURE custorder_info
AS
SELECT *
FROM Orders 
FULL JOIN Customer
ON  Orders.CID=Customer.CID

exec custorder_info 