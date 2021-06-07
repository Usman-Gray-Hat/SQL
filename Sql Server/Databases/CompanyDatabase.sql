--Create Database "Company"--
create database company
use company


--Department Table--
create table dept
(
dept_id int primary key identity,
dept_name varchar(30),
dept_manager varchar(40) default 'Not Assigned'
)


--Employee Table--
create table emp
(
emp_id int primary key identity,
emp_name varchar(30) default 'No Name',
emp_salary int,
emp_age varchar(40),
dept_id_fk int foreign key references dept (dept_id)
)


--Inserting Values in Department table--
insert into dept values ('IT','Waleed')
insert into dept values ('Analyst','Hira')
insert into dept values ('HR','Bilal')
insert into dept values ('Health','Shahzaib')
insert into dept values ('Security','Raheel')



--Inserting Values in Employee table--
insert into emp values ('Danish',7000,22,2)
insert into emp values ('Zain',9000,23,4)
insert into emp values ('Azaz',12000,27,3)
insert into emp values ('Usama',15000,26,1)
insert into emp values ('Saad',20000,28,5)
insert into emp values ('Farrukh',25000,30,2)


select * from dept
select * from emp


--Selection Query--
select * from emp
where emp_id = 2


--Projection Query--
select emp_name,emp_salary
from emp 
where emp_id = 2


--Alias  Name Query--
select emp_name as 'Employee Names'
from emp


--Alias Name and add values through Query--
select emp_name,emp_salary, emp_salary+1000 as 'Total Salary'
from emp


--Distinct Query (Unique/Non-repetitive)--
select dept_id_fk
from emp

select distinct dept_id_fk
from emp


--Operators--
-- <   (Less than)
-- >   (Greater than)
-- =   (Equal to)
-- < = (Less than and equal to)
-- > = (Greater than and equal to)
-- < > or ! = (Not equal to)


select emp_id ,emp_name
from emp where emp_salary > 1000

select emp_id ,emp_name
from emp where emp_salary < 8000

select emp_id ,emp_name
from emp where emp_salary > = 20000 

--Logical operators (AND) '(OR)--

select emp_name
from emp where emp_age > 20 AND emp_salary > = 15000

select emp_name
from emp where emp_age >= 30  OR emp_salary < = 15000


--Between and IN Query which is as same as AND and OR--
select * from emp
where emp_salary between 20000 and 30000 

select emp_name from emp
where emp_salary  in(20000,25000)

--Operator LIKE (Matching)--
-- % means zero or many characters
-- _ means one character (Single under score)
-- __ means two characters (Double under score)

select emp_name emp_salary
from emp
where emp_name like '____u%'


select emp_name, emp_salary
from emp
where emp_name like '%z'


select emp_name, emp_salary
from emp
where emp_name like 'S%'


select emp_name, emp_salary
from emp
where emp_name like '%f%'


select emp_name, emp_salary
from emp
where emp_name like '%m_'














