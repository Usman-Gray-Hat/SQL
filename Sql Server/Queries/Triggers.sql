use company12


select * from emp
select * from dept

create proc myproc11
@v_depno int
as

select deptno, sum(sal) 
from emp
where deptno = @v_depno
group by deptno

execute myproc11 2

select * from emp
select * from dept


--Triggers--
create trigger trigger1
on emp
for insert
as
if (select sal from inserted) < 3000
begin

print 'salary cant be less than 3000'
rollback transaction 
end;

insert into emp (empno,sal) values (9,2000)


--Update Trigger--

create trigger upd_On_Emp2
on emp
for update
as
if (select mgr from inserted) = (select empno from inserted)
begin
print 'Manager number and employee number cant be same'
rollback transaction 
end;

update emp
set mgr = 101 where empno = 101

drop trigger upd_On_Emp2


select * from emp
select * from dept

--trigger check record--
create trigger checking
on emp
for insert
as
IF EXISTS  (select * from emp where mgr = (select mgr from inserted))
begin 
print 'This manager has already enough employees under him'
rollback transaction 
end;

insert into emp(empno,mgr) values (4241,1)

--Create a trigger 'check_if_he_is_manager'.
-- It executes on record insertion in emp table
-- It only inserts record if the inserted manager already exists as an employee
--and if he exists, his designation is 'Manager'.
-- If it does not match the condition above,
--display message "This manager does not exist."


--Test the following record by insert query:
--Empno = 1997
--Ename = 'Faheem'
--Mgr = 9090

create trigger check_if_he_is_manager1
on emp
for insert 
as
if exists (select mgr from emp where mgr =  (select mgr from inserted where designation = 'Manager'))

begin 
print 'Successful'
rollback transaction
end;

insert into emp(empno,ename,mgr) values (107,'Ahmed',103)

select * from emp












