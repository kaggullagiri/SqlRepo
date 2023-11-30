-- creating one table with dept_tbl

create table dept_tbl(
	id_deptname varchar(20),
	emp_name varchar(20),
	salary int);
-- checking whether table is executed or not
select * from dept_tbl;

-- inserting given input records into the table

insert into dept_tbl values
('1111-MATH', 'RAHUL', 10000),
('1111-MATH', 'RAKESH', 20000),
('2222-SCIENCE', 'AKASH', 10000),
('2222-SCIENCE', 'ANDREW', 10000),
('3333-CHEM', 'ANKIT', 25000),
('3333-CHEM', 'SONIKA', 12000),
('4444-BIO', 'HITESH', 2300),
('4444-BIO', 'AKSHAY', 10000);
-- verifying data is inserted or  ot
select * from dept_tbl;

-- i need to find the total salary of each & every department 

select distinct id_deptname, sum(salary) from dept_tbl
group by id_deptname;

select
    SUBSTRING(id_deptname, CHARINDEX('-', id_deptname) + 1, LEN(id_deptname)) AS dept_name,
    SUM(salary) AS total_salary
from dept_tbl
group by SUBSTRING(id_deptname, CHARINDEX('-', id_deptname) + 1, LEN(id_deptname));

--- finally getting the total salary of every department
