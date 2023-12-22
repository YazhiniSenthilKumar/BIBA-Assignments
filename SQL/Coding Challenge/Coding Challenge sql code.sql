 /*ASSIGNMENT 1*/
 /*Question 1*/
 create database example1;

 create table customer1(cust_id int primary key,cust_name varchar(30), prod_name char(20),
 prod_id int);
 create table suplier(sup_id int,prod_id int,City char(30),Country char(30));

 insert into customer1 values(1,'ram','pen',20),(2,'raj','pencil',22),(3,'ravi','box',24),
 (4,'ramu','eraser',25),(5,'rahu','blue pen',21),(6,'raju','black pen',26);
 insert into customer1 values(7,'raji','bag',39),(8,'ram','pouch',38);
 insert into customer1 values(9,null,'pelican',null);
 select * from customer1;
 insert into suplier values (101,20,'chennai','tamil nadu'),(102,22,'varkala','kerala'),
 (103,24,'thirupati','andhra'),(104,25,'bangalore','karnataka'),(105,21,'madurai','tamil nadu'),
 (106,26,'calicut','kerala');
 insert into suplier values(114,46,'bangalore','karnataka'),(124,40,'mumbai','India');
 select * from suplier;

 select customer1.cust_id,customer1.cust_name,customer1.prod_name,suplier.prod_id,suplier.sup_id
 from customer1 inner join suplier on customer1.prod_id=suplier.prod_id;
 select customer1.cust_id,customer1.cust_name,customer1.prod_name,suplier.prod_id,suplier.sup_id
 from customer1 left  join suplier on customer1.prod_id=suplier.prod_id order by cust_id asc;
 select customer1.cust_id,customer1.cust_name,customer1.prod_name,suplier.prod_id,suplier.sup_id
 from customer1 right  join suplier on customer1.prod_id=suplier.prod_id order by cust_id asc;
 
 select cust_id,cust_name,prod_id  from customer1 
 group by cust_id,cust_name,prod_id
 having prod_id>25;

select * from customer1 where prod_id < 25 
order by cust_id desc;

/*QUESTION 2*/

create table Employ(emp_id int,Name varchar(20),lastname varchar(10),Age int);
insert into Employ values(1,'ram','kumar',30);
insert into Employ values(2,'hari','priya',25);
insert into Employ values(3,'hema','priya',25);
insert into Employ values(4,'raj','kumar',22);
select * from Employ;
update Employ set Name='yazhini' where Name='hema';

insert into Employ values(2,'hari','priya',25);
insert into Employ values(6,null,null,67);

select emp_id,Name,count(emp_id) as id_count from Employ
 group by emp_id,Name
 HAVING count(emp_id)>1;

delete from Employ where Name is null;

