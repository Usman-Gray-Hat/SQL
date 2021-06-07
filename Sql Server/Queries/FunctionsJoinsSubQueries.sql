use class_2001A

select * from emp;


select lower(NAME) as 'NameLower', 
upper(father_name) as 'FatherNameUpper'
from emp;


-- Ali has father name: Ahmed

select concat(name, ' has father name: ', father_name) as 'NameWithFather'
from emp;

select SUBSTRING(name, 1, 3) as 'Name Initials'
from emp

select ROUND(456.999, 1)


--GROUP FUNCTIONS
select * from emp;

select max(salary) from emp

select min(salary) from emp

select count(*) from emp

select sum(salary) as 'TotalSalary' from emp;

select avg(salary) from emp

select deptno, max(salary) as 'DeptWiseHighestSal'
from emp
group by deptno
order by deptno;


-- Print department wise total salaries.

select deptno, sum(salary) as 'TotalSal'
from emp
group by deptno;

-- Print department wise total salaries of those departments
-- where total salary is more than 100000

select deptno, sum(salary) as 'TotalSal'
from emp
group by deptno
having sum(salary) > 100000;

/**
Print department wise lowest salary of 
those departments whose minimum salary is 
less than the average salary of employees.
**/

select deptno, min(salary)
from emp
group by deptno
having min(salary) < (select avg(salary) from emp);


select * from dept;

--EQUI JOIN

select e.NAME, d.dname
from emp e, dept d
where e.deptno = d.deptno;

--INNER JOIN

select e.NAME, d.dname
from emp e inner join dept d
on e.deptno = d.deptno;

select * from dept;
select * from emp;
select id, name, deptno from emp


--OUTER JOIN

select e.name, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno;

-- Write a Query to print excessive employee names and department
-- names of those employees whose name starts with an A.

select e.name, d.dname
from emp e right outer join dept d
on e.deptno = d.deptno;


select e.name, d.dname
from emp e full outer join dept d
on e.deptno = d.deptno;


select * from dept;
select * from emp;

select e.name as 'EmployeeName' ,m.name as 'ManagerName'
from emp e, emp m
where e.mgr = m.id;