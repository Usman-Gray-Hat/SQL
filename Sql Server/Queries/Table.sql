Create database Arfa;

Use Arfa;

create table dept
(
deptno int primary key,
dname varchar(max),
loc varchar(max)
);

create table emp
(
empno int primary key,
ename varchar(max),
sal int,
designation varchar(max),
mgr int,
deptno int foreign key references dept(deptno)
);

insert into dept values(10, 'IT', 'Khi');
insert into dept values(20, 'HR', 'Lhr');
insert into dept values(30, 'Sales', 'Khi');


insert into emp(empno,ename,sal,designation,deptno) values(101, 'Ahmed', 5000,'Manager', 10);

insert into emp values(102, 'Ali', 5000,'Analyst', 101, 10);

insert into emp values(103, 'Faheem', 3000,'Designer', 101, 20);

insert into emp(empno,ename,sal,designation,deptno) 
values(104, 'Salman', 6000,'Developer', 20);

insert into emp(empno,ename,sal,designation,deptno) 
values(105, 'Raheem', 12000,'Manager', 10);

select * from dept;
select * from emp;

select max(sal) from emp;

select min(sal) from emp;

select count(*) from emp;

select sum(sal) from emp;

select avg(sal) from emp;

select deptno, max(sal) from emp
group by deptno;

 select deptno, COUNT(*)  from emp
 group by deptno;

 select designation, sum(sal)  from emp
 group by designation;

 -- Print department wise total salaries.

select deptno, sum(sal) as 'TotalSal'
from emp
group by deptno;

-- Print department wise total salaries of those departments
-- where total salary is more than 100000

select deptno, sum(sal) as 'TotalSal'
from emp
group by deptno
having sum(sal) > 100000;

/** Sub-Queries
Print department wise lowest salary of 
those departments whose minimum salary is 
less than the average salary of employees.
**/

select deptno, min(sal)
from emp
group by deptno
having min(sal) < (select avg(sal) from emp);

/** Left/right Outer Joins**/
select ename , dname
from emp left outer join dept
on emp.deptno= dept.deptno
where ename like('A%');

/**Full outer join**/
select ename , dname
from emp full outer join dept
on emp.deptno= dept.deptno;

select * from dept;
select * from emp;

select e.ename as 'EmployeeName', e.sal as 'EmployeeSalary', m.ename as 'ManagerName', m.sal as 'ManagerSalary'
from emp e , emp m
where e.mgr = m.empno
and e.sal > m.sal;

select e.ename as 'EmployeeName'
from emp e, emp m
where e.mgr = m.empno
and e.sal=m.sal;

select sum(sal) as 'TotalSalary'
from emp;

select m.empno as 'ManagerID', m.ename as 'ManagerName' , m.designation as 'ManagerDesignation'
from emp e, emp m
where e.mgr = m.empno
and m.sal >(
select  avg(m.sal) 
from emp e, emp m
where e.mgr = m.empno
);


select lower(NAME) as 'NameLower', 
upper(father_name) as 'FatherNameUpper'
from emp;

select SUBSTRING(name, 1, 3) as 'Name Initials'
from emp

select ROUND(456.999, 1)
