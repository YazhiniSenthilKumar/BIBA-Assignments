/*using date functios*/
select getdate();
SELECT dateadd (mm, 2, '2010-02-03');  /*adds two months 
                                        -we can also change year, yyyy, yy = Year
										quarter, qq, q = Quarter
										month, mm, m = month
										dayofyear, dy, y = Day of the year
										day, dd, d = Day
										week, ww, wk = Week
										weekday, dw, w = Weekday
					     				hour, hh = hour
										minute, mi, n = Minute
										second, ss, s = Second
										millisecond, ms = Millisecond*/

SELECT datediff ( mm, '2006-05-06','2009-01-01'); /*returns difference between*/
SELECT datepart (dy, '2008-01-01');      /*returns part of the date that given*/
SELECT day ( '2010-03-21');         /*returns day*/
SELECT month ('2007-04-03');         /*returns month*/
SELECT year ( '2011-04-17');         /*returns year*/

/*string functions*/
select ascii('AB');  /* returns ascii value*/
SELECT char (66);    /*returns ascii character*/
SELECT len ( 'WIDE SKILLS');  /*returns length including spaces*/
SELECT lower ( 'JOHN' );     /* changes to lower case*/
SELECT REPLACE ( 'country', 'y', 'ies' ); /*replaces y with ies*/
SELECT reverse ( 'PATH');   /*writes upside down*/
SELECT str (134.56, 4, 3);   /*str(number,length,decimals)
                             -default length is 10
							 -length also includes decimal point.*/
SELECT upper ( 'Peter');    /*changes to upper case*/

/*MATHEMATICAL FUNCTIONS*/
SELECT abs (-77);
SELECT sin(1.5);  /* Returns angle in radians*/
SELECT ceiling (14.45); /*returns highest  number*/
SELECT exp (4.5);
SELECT floor (15.55);  /*returns low number*/
SELECT log (5.4);

/*Ranking Functions*/

create table Stud(id int,name varchar(10),marks int);
insert into Stud values(1,'raj',80),(2,'ram',75),(3,'ravi',87),(4,'rahu',68),(5,'raji',60),(6,'raju',90),
(7,'rana',70);
select * from Stud;
insert into Stud values (8,'raja',60),(9,'rai',80);
/*row_number ()-gives consecutive ranks*/
select name,id,marks , row_number() over (order by marks asc) as rank from Stud;

/*rank()-skips rank or number*/
select name,id,marks , rank() over (order by marks desc) as rank from Stud;

/*dense_rank()-does not skip rank or number */
select name,id,marks , dense_rank() over (order by marks desc) as rank from Stud;

/*ntile()*/
select name,id,marks , ntile(4) over (order by marks desc) as rank from Stud;

/*AGGREGATE FUNCTIONS*/

/*sum() or sum([all|distinct] expression)*/

select sum(marks) as sum_of_marks from Stud;

/*select sum(marks) as sum_by_gropuby from Stud
group by id 
having sum(marks)>80;*/

/*count()*/
select count(id) as count_of_id from Stud;

/*select id,count(marks) as count_by_gropuby from Stud
group by id 
having sum(marks)>=80;*/

/*avg()*/
select avg(marks) as avg_of_marks from Stud;

/*select id,avg(marks) as avg_by_gropuby from Stud
group by id 
having sum(marks) >=80;*/

/*min()*/
select min(marks) as min_of_marks from Stud;

/*max()*/

select max(marks) as max_of_marks from Stud;

/*group by*/

select id,name,min(marks) as minimum,max(marks) as  maximum from Stud
where marks > 65 group by id,name;

/*SYSTEM FUNCTION*/
select host_id() as hostid;    /*when device is connected to internet a port number will be asigned to device*/
select HOST_NAME() as hostname; /*device name*/
SELECT SUSER_ID() as suserid;  /*log in identification presnt in system properties*/
select USER_ID () as USERID;  
select DB_NAME() as 'Current Database'; /*name of the database using*/ 
select db_id() as dataBid;





