create table animal(Animal char(20),color char(20),prize int);

insert into animal values('cow','white',10000);
insert into animal values('dog','gold',20000);
insert into animal values('cat','black',35000);
insert into animal values('hen','gold',10000);
insert into animal values('horse','grey',50000);
insert into animal values('rabbit','white',40000);
insert into animal values('hamster','white',10000);
select * from animal;

/*tran*/
begin tran;
save tran sp1;
delete from animal where prize=10000;
save tran sp2;
insert into animal values('monkey','golden',45000)
select * from animal;
rollback tran sp2;

create table customer(id int,contact bigint,email varchar(30),City char(20));

insert into customer values (1,7589349,'abc@gmail.com','Chennai');
insert into customer values (2,8397897,'cde@gmail.com','coimbatore');
insert into customer values(3,7494732,'fdg@gmail.com','hawai');
insert into customer values(4,7324732,'ftg@gmail.com','erode');
insert into customer values(5,7434732,'hyg@gmail.com','hawai');
select * from customer;

create table supplier(id int,contact int,email varchar(30),City char(20));
insert into supplier values(20,8437877,'hui@gmail.com','kerala');
insert into supplier values(21,8357877,'hqwi@gmail.com','cochin');
insert into supplier values(22,8439577,'nji@gmail.com','karnataka');
insert into supplier values(23,8436878,'yui@gmail.com','andhra');
insert into supplier values(24,8489877,'mko@gmail.com','mumbai');
select * from supplier;

/*union*/
select * from customer union select * from supplier;

alter table customer add Age int;
update customer set age=25 where id=1;
update customer set age=26 where id=2;
update customer set age=18 where id=3;
update customer set age=23 where id=4;
update customer set age=25 where id=5;

alter table supplier add Age int;
update supplier set age=75 where id=20;
update supplier set age=30 where id=21;
update supplier set age=29 where id=22;
update supplier set age=25 where id=23;
update supplier set age=24 where id=24;
select * from supplier;

update supplier set City='Hawai' where id=24;
update supplier set id=5,contact=7434732,email='hyg@gmail.com' where City='Hawai'

/*INTERSECT*/
select id,contact,email from customer 
intersect
select id,contact,email from supplier;

/*EXCEPT*/
select id,email,City from customer               /*all the values must be same in both the tables in case of minus*/
except  
select id,email,City from supplier;

/*exists*/

create table cust(cust_id int,fname varchar(10),lname varchar(10),email varchar(30));
insert into cust values(101,'ram','kumar','abc@gmail.com'),(102,'ravi','kumar','abcd@gmail.com'),
(103,'raj','durai','bcd@gmail.com'),(104,'hari','priya','bgu@gmail.com'),(105,'mithra','devi','mko@gmail.com'),
(106,'guga','murugesan','vgy@gmail.com');
select * from cust;

create table supp(supp_id int,contact char(20),orders int);
insert into supp values(102,'XXXXXXXXXX',10),(103,'XXXXXXXXXX',12),(104,'XXXXXXXXXX',22);
insert into supp values(108,'XXXXXXXXXX',24);
select * from supp;

select cust_id,fname from cust 
where exists (select orders from supp where cust_id=supp_id);

/*NOT EXISTS*/

select cust_id,fname from cust 
where not exists (select orders from supp where cust_id=supp_id);

/*ANY*/

create table custdetail(cust_id int,name varchar(10),prod_id int,quantity int);
insert into custdetail values(1,'yazh',21,11),(2,'devi',22,13),(3,'gugs',23,14),(4,'mithu',22,14),
(5,'raj',25,16),(6,'ram',26,15),(7,'ravi',21,15),(8,'yazh',26,17);
select * from custdetail;

create table orderdetail(order_id int,price int,pname varchar(10));
insert into orderdetail values(2,30,'pen'),(3,35,'pencil'),(1,50,'box'),(4,40,'eraser'),(5,20,'ruler'),
(6,35,'scale'),(7,45,'blackpen'),(8,30,'pelican');
select * from orderdetail;

select pname,price from orderdetail 
where order_id = any(select cust_id from custdetail);

select name,quantity from custdetail 
where cust_id = any(select order_id from orderdetail where price>30);

/*all*/

select name,quantity from custdetail 
where cust_id = SOME(select order_id from orderdetail where quantity<15);

select SOME name 
from custdetail 
where TRUE;

/* IN */

select * from custdetail where
 cust_id in (1,2,3);

 select * from custdetail where
 cust_id NOT in (1,2,3);

 create table example(id int,name varchar(20),age int,State char(30));
 insert into example values(101,'raj',20,'Tamil Nadu'),(102,'ravi',21,'kerala'),(103,'ram',23,'karnataka'),
 (101,'raj',20,'Tamil Nadu'),(104,'rahu',22,'Andhra'),(105,'reema',25,'delhi'),(106,'rishi',25,'Maharastra');
 select * from example;
 insert into example values(101,'raj',20,'Tamil Nadu');
 insert into example values(107,null,20,'Tamil Nadu');
 insert into example values(108,null,20,'Tamil Nadu');

 select id,name,count(id) as id_count from example 
 group by id,name 
 having count(id)>1;


 /*PARTITION BY*/

 select id,name ,row_number() over(partition by id order by id) as rn from example;
 
 

select * from example;


WITH cte AS (SELECT id,name,ROW_NUMBER() OVER (PARTITION BY name ORDER BY name ASC) AS rn
FROM example)
DELETE FROM cte
WHERE rn > 1;

select * from example where name is null;

delete from example where name is null;

update example set name='yazh' where name is null;

drop table example;