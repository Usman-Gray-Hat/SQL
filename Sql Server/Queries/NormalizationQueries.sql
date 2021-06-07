

create table course
(
subject varchar(30) primary key,
subject_cost int
);



create table area
(
area varchar(50) primary key,
city varchar(50),
province varchar(100)
);




create table student
(
student_id int primary key,
student_name varchar(50),
house_no int,
street_no int,
area varchar(50) foreign key references area(area)
);




create table result
(
student_id int foreign key references student(student_id),
subject varchar(30) foreign key references course(subject),
grade varchar(20),
primary key(student_id, subject)
);