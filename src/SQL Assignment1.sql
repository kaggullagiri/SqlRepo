--1.creating a new databse
create database ecommerce;  
use ecommerce; -- using that database
--2.creating tables :first table with gold_member-users
create table gold_member_users(
userid varchar(20),
signup_date varchar(20));
--creating second table with users
create table users(
userid varchar(20),
signup_date varchar(20));
--creating third table with sales
create table sales(
userid varchar(20),
created_date varchar(20),
product_id int);
--creating fourth table with product
create table product(
product_id int,
product_name varchar(20),
price int);

-- verifying tables are created or not
select * from gold_member_users;
select * from users;
select * from sales;
select * from product;
-- to verify all tables at once
select *
from INFORMATION_SCHEMA.TABLES;
--inserting values into table1 gold_memeber_users
insert into gold_member_users values ('John','09-22-2017');
insert into gold_member_users values('Mary','04-21-2017');
--inserting values into table2 users
INSERT INTO users VALUES('JOhn','09-22-2017');
INSERT INTO users VALUES('Michel','01-15-2015');
INSERT INTO users VALUES('Mary','04-11-2014');
--inserting values into table3 sales
insert into sales values ('John','04-19-2017',2);
insert into sales values ('Mary','12-18-2019',1);
insert into sales values ('Michel','07-20-2020',3); 
insert into sales values ('John','10-23-2019',2);
insert into sales values ('John','03-19-2018',3);
insert into sales values ('Mary','12-20-2016',2); 
insert into sales values ('John','11-09-2016',1);
insert into sales values ('John','05-20-2016',3); 
insert into sales values ('Michel','09-24-2017',1);
insert into sales values ('John','03-11-2017',2); 
insert into sales values ('John','03-11-2016',1); 
insert into sales values ('Mary','11-10-2016',1); 
insert into sales values ('Mary','12-07-2017',2); 
--inserting values into fourth table product
insert into product values
(1,'Mobile',980),
(2,'Ipad',870),
(3,'Laptop',330);
-- verifying tables values are inserted or not
select * from gold_member_users;
select * from users;
select * from sales;
select * from product;
-- in second table errors are there so i need to drop
drop table users;
-- Again created 2nd table users
create table users(
userid varchar(20),
signup_date varchar(20));
--inserting values into table 2
insert into users values
('John','09-02-2014'),
('Michel','01-15-2015'),
('Mary','04-11-2014');
select * from gold_member_users;
select * from users;
select * from sales;
select * from product;

--4.verifying all the tables in the same database(ecommerce)
select *
from INFORMATION_SCHEMA.TABLES;

--5.Count all the records of all four tables using single query
SELECT
    table_name,
    record_count
FROM (
    SELECT 'gold_member_users' AS table_name, COUNT(*) AS record_count FROM gold_member_users
    UNION ALL
    SELECT 'users' AS table_name, COUNT(*) AS record_count FROM users
    UNION ALL
    SELECT 'sales' AS table_name, COUNT(*) AS record_count FROM sales
    UNION ALL
    SELECT 'product' AS table_name, COUNT(*) AS record_count FROM product
) AS counts;

--6.What is the total amount each customer spent on ecommerce company
SELECT sales.userid,SUM(product.price) AS SpendAmount
FROM sales JOIN product 
ON sales.product_id = product.product_id
GROUP BY sales.userid;

--7.Find the distinct dates of each customer visited the website: 
--output should have 2 columns date and customer name
SELECT DISTINCT userid as customer_name, created_date as date
FROM sales;

--8.Find the first product purchased by each customer using 3 tables(users, sales, product)
SELECT users.userid, MIN(product.product_name) AS first_product_purchased
FROM users 
JOIN sales 
ON users.userid = sales.userid
JOIN product
ON sales.product_id = product.product_id
GROUP BY users.userid;

/*9.What is the most purchased item of each customer and
      how many times the customer has purchased it: 
	  output should have 2 columns count of the items as item_count and customer name
*/

SELECT userid as customer_name,COUNT(*) AS item_count
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY userid, product_name;

--10.Find out the customer who is not the gold_member_user
select DISTINCT userid
From users
where userid NOT IN (select userid from gold_member_users);

--11.What is the amount spent by each customer when he was the gold_member user
SELECT gmu.userid, SUM(product.price) AS spent_overall_amount
FROM gold_member_users as gmu
JOIN sales 
ON gmu.userid = sales.userid
JOIN product 
ON sales.product_id = product.product_id
GROUP BY gmu.userid;

--12.Find the Customers names whose name starts with M

select userid from users
where userid like 'm%';

--13.Find the Distinct customer Id of each customer

select DISTINCT userid from users;

--14.Change the Column name from product table as price_value from price

EXEC sp_rename 'product.price', 'price_value', 'COLUMN'; -- here executing stored procedure rename

-- checking whether table name is modified or not
select * from product;  -- column name modified here price as price_value

--15.Change the Column value product_name – Ipad to Iphone from product table

update product
set product_name ='Iphone'
where product_name='Ipad';

--checking whwether value is modified or not
select * from product;

--16.Change the table name of gold_member_users to gold_membership_users

EXEC sp_rename 'gold_member_users','gold_membership_users';

--checking table name is modified or not

select * from INFORMATION_SCHEMA.tables;

/*17.Create a new column  as Status in the table crate above gold_membership_users 
the Status values should be 2 Yes and No 
if the user is gold member, then status should be Yes else No.*/

Alter table gold_membership_users
add status varchar(20) DEFAULT 'No'
update gold_membership_users
set status='yes'
--checking status column is added or not 
select * from gold_membership_users;

/*18.Delete the users_ids 1,2 from users table 
    and roll the back changes once both the rows are deleted one by one
	mention the result when performed roll back*/

Delete Users  Rollback
BEGIN TRANSACTION;
DELETE FROM users 
WHERE userid = 1;  -- Deleting the first user
-- Check the result, if it's correct
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM users
WHERE userid = 2;  -- Delete second user
-- Check the result, if it's correct
ROLLBACK;

--19.Insert one record as (3,'Laptop',330) as product table as duplicate
INSERT INTO product 
VALUES (3, 'Laptop', 330);
--verify it is added or not
select * from product;

-- 20. Write a query to find the duplicates in the product table
SELECT product_name, COUNT(*) as count_of_dummy_records
FROM product
GROUP BY product_name
HAVING COUNT(*) > 1;


 








