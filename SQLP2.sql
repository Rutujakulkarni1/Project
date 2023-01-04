/*Q.1*/
create table Salespeople(
snum int not null,sname varchar(20),city varchar(20),comm float,
primary key(snum))

insert into Salespeople values
(1001,'Peel','London',0.12),(1002,'Serres','San Jose',0.13),(1003,'Axelrod','New york',0.10),
(1004,'Motika','London',0.11),(1007,'Rafkin','Barcelona',0.15)

select * from Salespeople

/*Q.2*/
create table Cust(
cnum int not null,cname varchar(20),city varchar(20),rating int,snum int,
primary key(cnum),foreign key(snum) references salespeople(snum))

insert into cust values
(2001,'Hoffman','London',100,1001),(2002,'Giovanne','Rome',200,1003),(2003,'Liu','San Jose',300,1002),
(2004,'Grass','Berlin',100,1002),(2006,'Clemens','London',300,1007),(2007,'Pereira','Rome',100,1004),
(2008,'James','London',200,1007)

select * from Cust

/*Q.3*/

Create table Orders(
onum int not null,amt float,odate date,cnum int,snum int,
primary key(onum),foreign key(cnum) references Cust(cnum),foreign key(snum) references Salespeople(snum))

insert into Orders values
(3001,18.69,'1994-10-03',2008,1007),(3002,1900.00,'1994-10-03',2007,1004),
(3003,767.19,'1994-10-03',2001,1001),(3005,5160.45,'1994-10-03',2003,1002),
(3006,1098.16,'1994-10-04',2008,1007),(3007,75.75,'1994-10-05',2004,1002),
(3008,4723.00,'1994-10-05',2006,1001),(3009,1713.23,'1994-10-04',2002,1003),
(3010,1309.95,'1994-10-06',2004,1002),(3011,9891.88,'1994-10-06',2006,1001)

select * from Orders

/*Q.4*/
Select s.sname ,s.snum,s.city ,c.cnum,c.cname,c.city from 
Salespeople s join Cust c
on s.city=c.city

/*Q.5*/
select c.cname , s.sname from
Salespeople s  join Cust c
on s.snum=c.snum

/*Q.6*/

select o.onum,c.cname,o.cnum,o.snum
from Salespeople s,Cust c,Orders o
where c.city<>s.city
and o.cnum=c.cnum
and o.snum=c.snum

/*Q.7*/

Select o.onum,c.cnum,c.cname 
from Orders o join Cust c
on o.cnum=c.cnum

/*Q.8*/
select c1.cname,c2.cname,c1.rating from 
cust c1,cust c2
where c1.rating=c2.rating 
and c1.cname<>c2.cname
order by c1.rating

select m.cname,n.cname,m.rating
from cust m, cust n
where m.rating=n.rating
AND m.cname<n.cname;

/*Q.9*/

select cname as 'CustomerName'from Cust
where snum in (select snum from Cust group by snum having COUNT(snum)>1)


/*Q.10*/
select s1.sname,s2.sname ,s1.city from 
Salespeople s1,Salespeople s2
where s1.city=s2.city
and s1.snum<s2.snum

/*Q.11*/
Select * from Orders
where snum=(Select distinct snum from Orders where cnum=2008)

select * from Orders
where cnum=2008

/*Q.12*/
select * from Orders
where amt>(select AVG(amt) from Orders where odate='1994-10-04')


/*Q.13*/
select * from Orders
where snum in (select snum from Salespeople where city='London')

/*Q.14*/
select cnum,cname from Cust 
where cnum>(select snum+1000 from Salespeople where sname='Serres')

/*Q.15*/
Select COUNT(rating) as count_of_customer from Cust
group by rating
having rating>(select avg(rating) from Cust where city='san jose')

/*Q.16*/
Select * from Salespeople
where snum in (select distinct snum from Cust c1 where	exists (select * from Cust c2 where c2.snum=c1.snum and c1.cname<>c2.cname))