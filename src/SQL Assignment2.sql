/*.Create a table persons 
--with first_name, last_name,city and age and
--add a constraint where age < 21 */
create table persons(
first_name varchar(20),
last_name varchar(20),
city varchar(20),
age int,
check (age < 21));

/*1.Insert the  4 records with age less than 21 and 
atleast one record should have city value as “Mumbai”*/
insert into persons (first_name, last_name, city, age) values
    ('Giri', 'kaggulla', 'chennai', 20),
    ('virat', 'kohli', 'New delhi', 19),
    ('Rohit', 'sharma', 'Mumbai', 18),
    ('chris', 'gayle', 'Punjab', 20);
-- verifying data will be inserted or not
select * from persons;

--2 Trying to insert a record breaking the age constraint

insert into persons (first_name, last_name, city, age) values
    ('pawan', 'kalyan', 'Hyderabad', 29);

	--Result : The INSERT statement conflicted with the CHECK constraint age

--3.Add one more constraint in the same table where city = “Mumbai”

alter table persons
add constraint checking_mumbai check (city = 'Mumbai');

  --Result:The ALTER TABLE statement conflicted with the CHECK constraint "checking_mumbai".
  --The conflict occurred in database "ecommerce", table "dbo.persons", column 'city'.
  --Completion time: 2023-11-28T15:39:10.5477605+05:30

--4.Insert one more record where city = “jaipur” and give the result

insert into persons (first_name, last_name, city, age) values
    ('Sharukh', 'khan', 'Jaipur', 20);

-- verifying values are inserted or not
select * from persons;

--5.Drop the constrait
alter table persons
drop CONSTRAINT checking_mumbai;

--6.Create view where city = ‘Mumbai’
create VIEW Mumbai_View AS
SELECT * FROM persons
WHERE city = 'Mumbai';
--checking view is created or not
select * from INFORMATION_SCHEMA.tables;

-- view is created 


