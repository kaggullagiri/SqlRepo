/*. Write a query to find for each date the number of different products sold and their names. 
Column names: (sell_date, product) */
create table product_details(
sell_date date,
product varchar(30));
--verifying table is created or not
select * from product_details;
--inserting values into the table
insert into product_details values
    ('2020-05-30', 'Headphones'),
    ('2020-06-01', 'Pencil'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'Basketball'),
    ('2020-06-01', 'Book'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'T-Shirt');
--verifying values will be inserted or not
select * from product_details;

-- find the each date the number of differenet products sold & names

SELECT sell_date,COUNT(DISTINCT product) AS soldcount,STRING_AGG(product, ', ') AS product_list
FROM product_details
GROUP BY sell_date;

/*result:

sell_date   soldcount      product_list

2020-05-30     3        Headphones,Basketball,T shirt
2020-06-01     2           Book, Pencil
2020-06-02     1            Mask,Mask

*/



