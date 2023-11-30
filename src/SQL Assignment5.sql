-- creating a table   
create table email_signup(
id int,
email_id varchar(40),
signup_date varchar(20));
--passing values into the tables
insert into email_signup values
(1, 'Rajesh@Gmail.com', '2022-02-01'),
(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'),
(3, 'Hitest@Gmail.com', '2020-09-08'),
(4, 'Salil@Gmmail.com', '2019-07-05'),
(5, 'Himanshu@Yahoo.com', '2023-05-09'),
(6, 'Hitesh@Twitter.com', '2015-01-01'),
(7, 'Rakesh@facebook.com', null);
-- checking table is created or not & checking values are inserted or not
select * from email_signup;
-- Query to find gmail accounts with latest and first signup date and difference

SELECT
    COUNT(*) AS AccountCount,
    MAX(signup_date) AS latest_signup_date,
    MIN(signup_date) AS first_signup_date,
    DATEDIFF(DAY, MIN(signup_date), MAX(signup_date)) AS diff_in_days
FROM email_signup
WHERE LOWER(email_id) LIKE '%gmail.com';

select * from email_signup;

