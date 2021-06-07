use company12

select * from emp
select * from dept

select e.ename,e.deptno,e.sal 
from emp e inner join dept d 
on e.deptno = d.deptno


--Task1--

select SUBSTRING(e.ename,1,3) as 'ENAME', SUBSTRING(D.dname,1,3) as 'DNAME'  
from  emp e left outer join dept d 
on e.deptno = d.deptno


--Task2--

select e.ename , d.dname
from emp e   full outer join   dept d on d.deptno = e.deptno



--Task3--
select e.ename , m.ename , e.sal , m.sal
from emp e , emp m where e.mgr = m.mgr and e.sal > m.sal


--Task4--
select m.ename 
from emp e , emp m where e.mgr = m.mgr and e.sal = m.sal 


--Task5--
select sum(m.sal) as 'TotalSalaryOfAllManagers'
from emp e , emp m where e.mgr = m.mgr


--Task6--
select m.empno , m.ename , m.designation
from emp e , emp m 
where e.mgr = m.mgr and 





--Task7--
create view dept_emp_vu13
as select d.dname, e.ename 
from dept d inner join emp e on d.deptno = e.deptno
where  d.dname like 'I%'
group by d.dname, e.ename
having  sum(e.sal) > 10000

select * from dept_emp_vu13


--Task8--
create view emp_name_desig 
as select ename , designation
from emp

select * from emp_name_desig

--Task9  (insert records through views i.e insert records in 'emp_name_desig')--
--Query isn't working in view because I used 'Not null ' constraint in each & every column of the  base tables--


--------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------


--Task10--
--Q.1
--Create a view "company_data"
--It will have empno, ename, sal column from emp table and deptno, dname column from dept table.

create view company_data
as select e.empno,e.ename,e.sal,d.deptno,d.dname 
from emp e inner join dept d 
on d.deptno = e.deptno

select * from company_data

--Q.2

--Write a query to insert the following records in emp_dept_vu:
--empno = 2001
--ename = Khan
--sal = 250000
--deptno = 90
--dname = student affairs

insert into dept_emp_vu13 values (2001,'Khan',250000,90,'Student Affairs')

--Q.3.
--Verify the above query by selecting records from emp_dept_vu13, emp table and dept table.

select * from company_data

--Q.4
--Write a query on company_data to update the name of employee 2001 to 'Ali' 
--and department name of department 90 to 'Directorate'.


update company_data
set ename = 'Ali' where empno = 2001


--Q.5
--Verify the above query by selecting records from emp_dept_vu, emp table.

select * from company_data c inner join emp e on c.empno = e.empno 


--Q.6
--Write a query on company_data to delete the employee 2001.

delete from company_data where empno = 2001

--Q.7
--Verify the above query by selecting records from emp_dept_vu, emp table.


select * from company_data c inner join emp e on c.empno = e.empno 



select * from emp
