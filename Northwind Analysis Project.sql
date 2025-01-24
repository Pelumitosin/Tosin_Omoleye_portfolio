use northwind;
/*1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName*/
select categoryname, description
from categories
order by categoryname;

/* 2.Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table
sorted by Phone.*/
select concat_ws( ' ', companyname, contacttitle,phone) as Customer_details
from customers;

/*3. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname
respectively and HireDate from the employees table sorted from the newest to the oldest employee.*/
 select upper(Firstname) as FirstName, upper(Lastname) as LastName, hiredate
 from employees
 order by hiredate desc;
 
 /* 4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted
by Freight in descending order*/
select orderid, orderdate, shippeddate, customerid, freight
from orders
order by freight desc
limit 10;

/*5.  Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.*/
select lower(customerid) as ID
from customers;

/* 6. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the
Country in descending order then by CompanyName in ascending order.*/
select companyname, fax, phone, country, homepage
from suppliers
order by companyname, country desc;

/*7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.*/
select companyname, contactname
from customers
where city = 'Buenos Aires';

/* 8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.*/
select productname, unitprice, quantityperunit, unitsinstock
from products
where unitsinstock =0;

/* 9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain*/
select contactname,address,city, country
from customers
where not country in ('Germany', 'Mexico', 'Spain');

/* 10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.*/
select orderdate,shippeddate, customerid, freight
from orders
where orderdate = '1996-05-21';

/* 11. Create a report showing FirstName, LastName, Country from the employees not from United States.*/
 select firstname, lastname, country
 from employees
 where not country = 'USA'; 
 
 /* 12. Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later
than the required date.*/
select employeeid, orderid, customerid, requireddate, shippeddate, datediff(requireddate,shippeddate) as late_delivery
from orders
where datediff(requireddate,shippeddate) <0;

/* 13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.*/
select city, companyname, contactname
from customers
where city like 'A%' or city like'B%';

/* 14. Create a report showing all the even numbers of OrderID from the orders table.*/
select orderid
from orders
where mod(orderid, 2) = 0;

/* 15. Create a report that shows all the orders where the freight cost more than $500.*/
select orderid, freight
from orders
where freight > 500;

/* 16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for
reorder.*/
select productname, unitsinstock, unitsonorder, reorderlevel
from products
where reorderlevel >0;

/* 17. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.*/
select companyname, contactname, fax
from customers
where fax is null;

/* 18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody.*/
select firstname, lastname
from employees
where reportsto is null;

/* 19. Create a report showing all the odd numbers of OrderID from the orders table.*/
select orderid
from orders
where mod(orderid,2) =1;

/* 20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted
by ContactName.*/
select companyname, contactname, fax
from customers
where fax is null
order by contactname;

/* 21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name
sorted by ContactName.*/
select city, companyname, contactname
from customers
where city like('%L%')
order by contactname; 

/* 22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.*/
select firstname, lastname, birthdate
from employees
where birthdate between '1950-01-01' and '1959-12-31'; 

/* 23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.*/
select firstname, lastname, birthdate as birth_year
from employees;

/* 24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by
OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement.*/
select orderid, count(orderid) as NumberofOrders
from `order details`
group by orderid
order by count(orderid) desc;

/* 25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids,
Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID*/
with cte_1 as (
select s.supplierid, p.productname, s.companyname
from products p 
join suppliers s on p.supplierid = s.supplierid
where s.companyname in ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux'))
select supplierid, productname, companyname
from cte_1
order by s.supplierid;

/* 26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124".*/
select shippostalcode, orderid, orderdate, requireddate, shippeddate, shipaddress
from orders
where left (shippostalcode,5) = '98124';

/* 27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.*/
select contactname, contacttitle, companyname
from customers
where not ContactTitle like ('%sales%');

/* 28. Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle"*/
select lastname, firstname, city
from employees
where not city = 'seattle';

/* 29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.*/
select companyname, contacttitle, city, country
from customers
where country = 'Mexico' or country = 'Spain' and not city = 'Madrid';

/* 30. Create a select statement that outputs the following*/
select concat_ws( ' ', firstname, lastname, 'can be reached at', 'x', extension) as fullname
from employees;

/* 31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.*/
select contactname
from customers
where left(contactname, 2) not like '%A%';

/* 32. Create a report that shows the average UnitPrice rounded to the next whole number, 
total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.*/
select round(avg(unitprice)) as AveragePrice, sum(unitsinstock*unitprice) as Totalstock, 
max(quantityperunit*unitprice) as MaxOrder
from products;

/* 33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table.*/
select s.supplierid, c.companyname, ca.categoryname, p.productname, p.unitprice
from `order details` od
join orders o on o.orderid = od.orderid
join products p on od.productid = p.productid
join suppliers s on p.supplierid = s.supplierid
join categories ca on p.categoryid = ca.categoryid
join customers c on c.customerid = o.customerid
order by supplierid;

/* 34. Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200,
 grouped by CustomerID. HINT: you will need to use a Groupby and a Having statement.*/
 select c.customerid, sum(o.freight) as `high freights`
 from orders o
 join customers c on o.customerid = c.customerid
 group by customerid
 having sum(o.freight) > 200;

/* 35. Create a report that shows the OrderID ,ContactName, UnitPrice, Quantity, Discount from the order details, 
orders and customers table with discount given on every purchase.*/
select o.orderid, c.contactname, od.unitprice, od.quantity, od.discount,
case
when quantity>30 then discount = 10
else discount =5
end as discount
from `order details` od
join orders o on o.orderid = od.orderid
join customers c on o.customerid = c.customerid;

/* 36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of 
who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin.*/

select concat_ws(' ', e.employeeid, e.lastname, e.firstname) as employee, concat_ws(' ',m.lastname, m.firstname) as manager
from employees e
join employees m on e.reportsto = m.employeeid;

/* 37. Create a report that shows the average, minimum and maximum UnitPrice of all products as 
AveragePrice, MinimumPrice and MaximumPrice respectively. */
select avg(unitprice) as Averageprice, min(unitprice) as `Minimumprice`, max(unitprice) as `Maximumprice`
from `order details`;

/* 38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, 
Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View.*/
create view customerinfo as 
select c.customerid, c.companyname, c.contactname, c.contacttitle, c.address, c.city, 
c.country, c.phone, o.orderdate, o.requireddate, o.shippeddate
from orders o 
join customers c on o.customerid = c.customerid;
select customerid, companyname, contactname, contacttitle, address, city, country, 
phone, orderdate, requireddate,shippeddate
from customerinfo;

/* 39. Change the name of the view you created from customerinfo to customer details.*/
rename table customerinfo
to
`customer details`;

/* 40. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, 
CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, 
products and categories tables. HINT: Create a View*/
create view productdetails as
select p.productid, p.productname,p.quantityperunit, p.unitprice, p.unitsinstock, p.unitsonorder, 
p.reorderlevel,p.discontinued, s.companyname, ca.categoryname, ca.description
from `order details` od
join orders o on o.orderid = od.orderid
join products p on od.productid = p.productid
join categories ca on p.categoryid = ca.categoryid
join suppliers s on p.supplierid = s.supplierid;
select productid, productname, quantityperunit, unitprice, unitsinstock, 
unitsonorder,reorderlevel,discontinued,companyname,categoryname,description
from productdetails;

/* 41. Drop the customer details view.*/
drop view `customer details`;

/* 42. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo*/
select left(categoryname,5) as shortinfo
from categories;

/* 43. Create a copy of the shipper table as shippers_duplicate. 
Then insert a copy of shippers data into the new table HINT: Create a Table, use the LIKE Statement and INSERT INTO statement.*/
create table shippers_duplicate as
select *
from shippers;

insert into shippers_duplicate
select *
from shippers;

/* 44. Create a select statement that outputs the following from the shippers_duplicate Table*/
select shipperid, companyname, phone
from shippers_duplicate;

/* 45. Create a report that shows the CompanyName and ProductName from all product in the Seafood category*/
with cte_1 as (
select p.productname, ca. categoryname, s.companyname
from products p
join suppliers s on p.supplierid = s.supplierid
join categories ca on ca.categoryid = p.categoryid
where categoryname = 'seafood')
select companyname, productname
from cte_1;

/* 46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.*/
with cte_1 as (
select ca.categoryid,s.companyname, p.productname
from products p
join categories ca on p.categoryid = ca.categoryid
join suppliers s on p.supplierid = s.supplierid
where ca.categoryid = 5)
select categoryid, companyname, productname
from cte_1;

/* 47. Delete the shippers_duplicate table.*/
drop table shippers_duplicate;

/* 48. Create a select statement that ouputs the following from the employees table*/
select lastname, firstname, title, year(now())- year(birthdate)as age
from employees;

/* 49. Create a report that the CompanyName and total number of orders by customer renamed as number of orders since Decemeber 31, 1994. 
Show number of Orders greater than 10.*/
select c.companyname, count(o.orderid) as `number of orders since December 31, 1994`
from orders o 
join customers c on o.customerid = c.customerid
group by c.companyname
having  count(o.orderid) >10
order by count(o.orderid) desc;

/* 50. Create a select statement that ouputs the following from the product table
NB: It should return 77rows.*/
select concat_ws(' ', productname,'weighs/is', quantityperunit, 'and cost','$', unitprice) as ProductInfo
from products
limit 77;








