/**


Q.
Create a database with name 'Class_2001A'.

Q.
Create a table "Students" with following attributes:
- StudentID
- StudentName
- Batch


**/

create database Class_2001A;

use Class_2001A;

create table emp
(
empno int,
ename varchar(100),
sal int
);
use dbname;
drop table Student;

CREATE TABLE EMP
(
   ID INT NOT NULL,
   NAME VARCHAR (20) DEFAULT 'NOTHING',
   FATHER_NAME VARCHAR (20) UNIQUE,
   AGE INT CHECK (AGE >= 18),
   E_ADDRESS  VARCHAR(25),
   SALARY INT, 
   PRIMARY KEY (ID)
);

insert into EMP(ID, AGE) values (104, 24);

insert into EMP(ID, E_Address, Salary, Age, FATHER_NAME, NAME)
values (105, 'Lhr', 5000, 29, 'KKK', 'Std');


insert into EMP values(101,'Azaz','Ali',23,'Khi',50000);


insert into EMP values
(103,'ddd','ccc',23,'Khi',50000),
(102,'Fhf','asd',23,'Khi',50000)
;


select * from emp;




select * from emp;


drop table emp



--SELECTION

SELECT *
FROM EMP
WHERE AGE = 23;

-- PROJECTION

SELECT NAME, SALARY
FROM EMP;

-- SELECTION + PROJECTION

SELECT * FROM EMP;