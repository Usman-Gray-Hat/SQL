create database Normalize
use Normalize


--subject table--

create table subject
(
subject_name varchar(20) primary key,
subject_cost int not null
)


--area table--

create table area
(
area_name varchar(20) primary key,
city varchar(20) not null,
province varchar(20) not null
)

select * from subject

select * from area

--student table --

create table student
(
student_id int primary key,
student_name varchar(20) not null,
house_no varchar(20) not null,
street_no varchar(20) not null,
area_fk varchar(20) foreign key references area (area_name)
)


select * from subject

select * from area

select * from student




--result table--

create table result 
(
student_id_fk int foreign key references student (student_id),
subject_name_fk varchar(20) foreign key references subject (subject_name),
grade varchar(20) not null,
primary key(student_id_fk,subject_name_fk)
)

select * from subject

select * from area

select * from student

select * from result