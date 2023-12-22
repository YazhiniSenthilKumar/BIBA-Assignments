create table Employee(
Name varchar(20),lastname varchar(10),Age int,id int
);

insert into Employee values('ram','kumar',30,1);
insert into Employee values('hari','priya',25,2);
insert into Employee values('hema','priya',25,3);
insert into Employee values('raj','kumar',22,4);
select * from Employee;

create table Employee1(
Department char(20),Salary int,id int
);

insert into Employee1 values('cs',10000,1);
insert into Employee1 values('ece',10000,2);
insert into Employee1 values('bme',15000,3);
insert into Employee1 values('chem',8000,4);

alter table Employee1 add Joining_date date;

update Employee1 set Joining_date='2001-10-22' where id=1;
update Employee1 set Joining_date='2001-10-21' where id=2;
update Employee1 set Joining_date='2001-10-23' where id=3;
update Employee1 set Joining_date='2001-10-24' where id=4;
select * from Employee1;

select distinct Salary from Employee1;

/*JOIN*/

select Employee.Name,Employee1.Department,Employee1.Salary 
from Employee join Employee1 on Employee.id=Employee1.id;


alter table Employee add Gender char(10),City varchar(20);
select * from Employee;

update Employee set Gender='Male',City='Chennai' where id='1';
update Employee set Gender='Female',City='Madurai' where id='2';
update Employee set Gender='Female',City='Madurai' where id='3';
update Employee set Gender='Male',City='coimbatore' where id='4';
select * from Employee; 

insert into Employee values('kani','A',23,5,'Female','Erode');
insert into Employee values('Mani','C',28,6,'Female','Canada');
insert into Employee values('guga','Priya',22,7,'Female','US');
insert into Employee values('Mithra','Devi',23,8,'Female','London');
insert into Employee values('Sathiya','Priya',26,9,'Female','Madurai');
insert into Employee values('Mukilan','M',27,10,'Male','Canada');
select * from Employee;

insert into Employee1 values('Hr',10000,5,'2003-04-05');
insert into Employee1 values('Admin',12000,6,'2003-05-05');
insert into Employee1 values('Tech',10000,7,'2003-06-07');
insert into Employee1 values('cs',40000,8,'2002-08-05');
insert into Employee1 values('bme',30000,9,'2001-04-05');
insert into Employee1 values('MECH',20000,10,'2002-04-10');

SELECT * FROM Employee1;

/*COUNT*/

select count(name)
from Employee where Age>='25';

select distinct City from Employee;

select count(Age) as Age_count,City from Employee
group by City
having count(Age)>='1'
order by Age_count;


delete from Employee1 where Department='cs';
commit;
select * from Employee1;
delete from Employee1 where Department='cs';
rollback;
delete from Employee1 where Department='ec';
rollback;
select * from Employee1;

create table Student(Name varchar(20)not null,age int,grade char(10));
alter table Student alter column age int not null;
insert into Student values('ram',22,'A');
insert into Student values('raj',NULL,'B');
insert into Student values('ravi',23,'F');
insert into Student values('raghu',24,'A');

create table Student1(id int unique,age int,grade char(10) not null);
insert into Student1 values(1,22,'A');
insert into Student1 values(2,23,'B');
insert into Student1 values(3,25,'B');
select * from Student1;

create table Student2(id int not null primary key,name varchar(30) not null,age int,grade char(10) not null);
insert into Student2 values(1,'yazh',22,'A');
insert into Student2 values(2,'guga',23,'B');
insert into Student2 values(3,'mithu',25,'B');
select * from Student2;

create table Student3( 
name varchar(20) default 'Ramesh',
age int default '30',
Grade char(10));

insert into Student3 values(default,default,'B');
insert into Student3 values('mithu',23,'B');
insert into Student3 values('Yazh',default,'A');
select * from Student3;

create table customers(
id int not null primary key,
name varchar(10),
contact int,
mail varchar(20));

/*Foreign key*/

create table Supply(
id int not null primary key,
customer_id int,
email varchar(20),
constraint FK_customer
foreign key (customer_id) references customers(id));

drop table customers;

/*primary key*/

create table checkers(id int not null primary key,
name varchar(20) not null,
age int not null check(age>=18));

insert into checkers values(1,'yazh',20),(2,'guga',17),(3,'mithu',18);

/*index*/

create index idx_age
on Student1(age);
select * from Student1;

/*Joins*/

create table  Student(id int,name varchar(20), Age int);
insert into Student values(1,'yazh',19),(2,'mithu',20),(3,'sathiya',19),(4,'yazh',18),(5,'priya',20);
select * from  Student;

create table Studen(id int,City varchar(20),Country char(20));
insert into Studen values(1,'madurai','Tamil Nadu'),(2,'chennai','Tamil Nadu'),(3,'calicut','kerala');
select * from Studen;
insert into Studen values (6,'Bangalore','Karnataka'),(5,'coimbatore','Tamil Nadu');

select Student.id, Student.name,Studen.City,Studen.Country from Student inner join Studen 
on Student.id=Studen.id;
select Student.name,Studen.Country from Student left join Studen 
on Student.id=Studen.id order by Student.id;
select Student.name,Studen.Country,Student.age,Studen.City from Student right join Studen 
on Student.id=Studen.id order by Student.id;
select Student.name,Studen.Country,Student.age,Studen.City from Student full join Studen 
on Student.id=Studen.id order by Student.id;
select Student.name,Studen.Country,Student.age,Studen.City from Student cross join Studen;


/*PROCEDURE*/

create procedure Studentable 
as 
select * from Studen ;

exec Studentable;

create procedure Student_table
as
select id,City from Studen where id>=3;

exec Student_table;

CREATE TABLE pro(name char(76),age int,sex char(20));
INSERT INTO pro  (name,age,sex) VALUES('lata',56,'female');
INSERT INTO pro (name,age,sex) VALUES('rata',6,'female');
INSERT INTO pro (name,age,sex) VALUES('pata',66,'female');
INSERT INTO pro (name,age,sex) VALUES('kata',46,'male');
CREATE PROCEDURE Proto AS SELECT *FROM pro;
exec Proto;

SELECT name, MIN(age)  
FROM pro 
GROUP BY ROLLUP (name);

show database;
use BasicCommands;

create table exam1(id int primary key,name char(20),maths int,science int,english int,tamil int,cs int);

/*drop table exam1;*/

insert into exam1 values(1,'ram',80,75,65,89,70),(2,'raj',81,null,45,59,79),(3,'rahu',90,85,95,89,90),
(4,'ravi',86,85,55,69,77),(5,null,60,75,85,49,30),(6,'ram',80,null,45,84,30);

select * from exam1;

select name from exam1;

select * from exam1 where maths>=90;

/*SUM() , NULL AND NOT NULL FUNCTIONS*/

select id,name,sum(maths) as total_maths from exam1 
group by id,name;

select id ,name ,maths from exam1 where name is not null order by name asc; 

update exam1 set name='jay' where name is null;
select * from exam1;

select * from exam1 where id>1 and id<6;

select * from exam1 order by id desc;

select min(maths) as avg_math from exam1  ;


select CURRENT_TIMESTAMP;