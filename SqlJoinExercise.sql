/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select products.Name, categories.Name as 'category name'
 from products
 inner join categories on products.CategoryID = categories.CategoryID
 where categories.name = 'computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.Name, products.Price, reviews.Rating
 from products
 inner join reviews on products.ProductID = reviews.ProductID
 where reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName, employees.LastName, sum(sales.Quantity) as 'Sales'
 from employees
 inner join sales on employees.EmployeeID = sales.EmployeeID
 group by employees.EmployeeID
 order by sum(sales.Quantity) desc limit 2;
 
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.Name as 'department name', categories.Name as 'category name'
 from departments
 inner join categories on departments.DepartmentID = categories.DepartmentID
 where categories.name like '%games%' or categories.name like '%appl%';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.Name, sum(sales.Quantity) as 'total sold', products.Price * sum(sales.Quantity) as 'total price'
from products
inner join sales on products.ProductID = sales.ProductID 
where products.name like '%hotel%';
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
from reviews
inner join products on reviews.ProductID = products.ProductID
where products.name like '%visio%'
order by Rating asc;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select employees.EmployeeID, employees.FirstName, employees.LastName,  products.name as 'Product Name', sales.Quantity
from sales
join employees on sales.EmployeeID = employees.EmployeeID
join products on sales.ProductID = products.ProductID
order by EmployeeID;


