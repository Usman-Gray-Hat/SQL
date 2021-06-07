--=======>> Creating Database <<=======--
create database Aptech
use Aptech


--=======>> Creating Table Admin <<=======--
create table admin
(
admin_id int primary key identity,
admin_name varchar(30) not null,
admin_contact varchar(30) not null
)


--=======>> Value Insertion <<=======--
insert into admin values ('Rutaba','952314')
insert into admin values ('Rehman','549853')



--=======>> Creating Table Receptionist <<=======--
create table receptionist
(
recep_id int primary key identity,
recep_name varchar(30) not null,
recep_shift varchar(20),
admin_id_fk int foreign key references admin (admin_id)
)


--=======>> Value Insertion <<=======--
insert into receptionist values ('Asghar','Morning',1)
insert into receptionist values ('Sadia','Evening',2)



--=======>> Creating Table Teacher <<=======--
create table teacher
(
teacher_id int primary key identity,
teacher_name varchar(30),
teacher_age tinyint,
teacher_email varchar(30),
teacher_shift varchar(20),
teacher_contact varchar(40),
teacher_salary int,
admin_id_fk int foreign key references admin (admin_id),
recep_id_fk int foreign key references receptionist (recep_id)
)


--=======>> Value Insertion <<=======--
insert into teacher values ('Abdul Basit',27,'basit@gmail.com','Morning','123546',100000,1,1)
insert into teacher values ('Hassan',29,'hassan@gmail.com','Morning','126542',70000,1,1)
insert into teacher values ('Azaz',26,'azaz@gmail.com','Evening','654894',50000,2,2)
insert into teacher values ('Adeel',35,'adeel@gmail.com','Evening','12384',85000,1,2)
insert into teacher values ('Talha',30,'talha@gmail.com','Morning','1548',72000,2,1)



--=======>> Creating Table Student <<=======--
create table student
(
std_id int primary key identity,
std_name varchar(30) not null,
std_age tinyint,
std_gender varchar(40),
std_email varchar(40),
admin_id_fk int foreign key references admin (admin_id),
recep_id_fk int foreign key references receptionist (recep_id),
teacher_id_fk int foreign key references teacher (teacher_id)
)


--=======>> Value Insertion <<=======--
insert into student values ('Usman',23,'Male','usman@gmail.com',1,1,1)
insert into student values ('Osama',23,'Male','osama@gmail.com',1,2,2)
insert into student values ('Sana',21,'Female','sana@gmail.com',2,2,4)
insert into student values ('Sara',24,'Female','sara@gmail.com',2,1,3)
insert into student values ('Taha',22,'Male','taha@gmail.com',1,2,5)



--=======>> Creating Table Course <<=======--
create table course
(
course_id int primary key identity,
course_name varchar(50),
course_fee int,
admin_id_fk int foreign key references admin (admin_id),
recep_id_fk int foreign key references receptionist (recep_id),
teacher_id_fk int foreign key references teacher (teacher_id),
std_id_fk int foreign key references student (std_id)
)


--=======>> Value Insertion <<=======--
insert into course values ('Networking',5000,1,1,4,2)
insert into course values ('MS Office',5000,1,1,2,3)
insert into course values ('Cyber Security',10000,2,2,2,1)
insert into course values ('3 Years Diploma',6600,2,2,1,1)
insert into course values ('Artificial Intelligence',5000,2,1,5,3)
insert into course values ('Cloud Computing',5000,1,2,4,2)



--=======>> Creating Table Staff <<=======--
create table staff
(
staff_id int primary key identity,
staff_name varchar(30) not null,
staff_duty varchar(30) not null,
admin_id_fk int foreign key references admin (admin_id)
)


--=======>> Value Insertion <<=======--
insert into staff values ('Rizwan','Pune',1)
insert into staff values ('Abdul Basit','Teaching',1)
insert into staff values ('Asghar','Receptionist',2)
insert into staff values ('Imran','Fee Reciever',2)
insert into staff values ('Abid','Principle',1)
insert into staff values ('Sadia','Receptionist',2)



--=======>> Creating Table Lab <<=======--
create table lab
(
lab_id int primary key identity,
lab_name varchar(30),
admin_id_fk int foreign key references admin (admin_id),
teacher_id_fk int foreign key references teacher (teacher_id),
std_id_fk int foreign key references student (std_id)
)


--=======>> Value Insertion <<=======--
insert into lab values ('Lab-A1',1,1,1)
insert into lab values ('Lab-B1',2,4,3)
insert into lab values ('Lab-A2',1,2,1)
insert into lab values ('Lab-B2',2,3,4)
insert into lab values ('Lab-C1',2,5,2)



--=======>> Creating Table Tournament <<=======--
create table tournament
(
tournament_id int primary key identity,
tournament_name varchar(60) not null,
tournament_winner varchar(30) not null,
admin_id_fk int foreign key references admin (admin_id),
recep_id_fk int foreign key references receptionist (recep_id),
)


--=======>> Value Insertion <<=======--
insert into tournament values ('Counter Strike 1.6 Season 01','Usman',1,2)
insert into tournament values ('Counter Strike Global Offensive Season 03','Farrukh',1,2)
insert into tournament values ('Call Of Duty Season 1','Sameer',2,1)



--=======>> Select Statements <<=======--
select * from admin
select * from receptionist
select * from teacher
select * from student
select * from course
select * from staff
select * from lab
select * from tournament


--=======>> JOINS <<=======--
select t.teacher_id , t.teacher_name , t.teacher_contact , t.teacher_shift , t.teacher_salary ,
s.std_id , s.std_name , s.std_gender , s.std_email , s.std_age
from teacher t inner join student s
on t.teacher_id = s.teacher_id_fk

