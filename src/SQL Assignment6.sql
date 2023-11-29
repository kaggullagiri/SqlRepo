select * from INFORMATION_SCHEMA.tables;
--1.create a table named sales_data with columns: product_id, sale_date, and quantity_sold.
create table sales_data(
	product_id int,
	sale_date date,
	quantity_sold int);
--2.inserting values into table
insert into sales_data values
(1, '2022-01-01', 20),
(2, '2022-01-01', 15),
(1, '2022-01-02', 10),
(2, '2022-01-02', 25),
(1, '2022-01-03', 30),
(2, '2022-01-03', 18),
(1, '2022-01-04', 12),
(2, '2022-01-04', 22);
--checking values inserted or not
select * from sales_data;
--3.assign rank by partition based on product_id and in each product id 
--finding the lowest sold quantity
select product_id,
    RANK() OVER (PARTITION BY product_id ORDER BY quantity_sold) AS rank,
    quantity_sold
from sales_data;
--4.retrieves the value from a previous row in the result set,
--retrieves the value from the next row.
select product_id,quantity_sold,
    LAG(quantity_sold) OVER (ORDER BY sale_date) AS prev_quantity,
    LEAD(quantity_sold) OVER (ORDER BY sale_date) AS next_quantity
from sales_data;

--5.return the first and last values in an ordered set

select
    product_id,
    FIRST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS first_quantity,
    LAST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS last_quantity
from
    sales_data;
-- verifying table data
select *  from sales_data;




--
