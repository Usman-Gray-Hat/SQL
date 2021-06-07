create database task11
use task11

--1.Create a table Student with following columns:
--StudentID, Name, FatherName,Gender, Class, Fees

--2.Create a backup table for Student table that copies its structure.3.

--3.Add a column in backup table that maintains the date & time of record insertion.

--4.Create a trigger for insertion on Students table that inserts StudentID, Name, FatherName,Gender, Class, Fees
--in backup table.

--5.Test your program by inserting 3 different records in Students table.

--NOTE:
--USE PROPER COMMENTS FOR EACH TASK.




--1.Create a table Student with following columns:
--StudentID, Name, FatherName,Gender, Class, Fees

create table student
(
std_id int primary key,
std_name varchar(30),
std_father_name varchar(30),
std_gender varchar(20),
std_class varchar(20),
std_fees int
)
select * from student
drop table student

--Creatine a backup table for Student--
select top 0 * into std_backup from student
select * from std_backup


--Adding date and time attribute--
alter table std_backup
add Date_Created datetime not null default (getdate())


--Creating Trigger on Insertion in student--
create trigger insertion_in_student
on student
after insert
as
begin


insert into std_backup(std_id,std_name,std_father_name,std_gender,std_class,std_fees) 
select std_id,std_name,std_father_name,std_gender,std_class,std_fees
from inserted


end
drop trigger insertion_in_student

--Testing  program by inserting 3 different records in Students table.

insert into student(std_id,std_name,std_father_name,std_gender,std_class,std_fees)
values (4,'Ahmed','Bilal','Male',11,7000)

select * from student
select * from std_backup