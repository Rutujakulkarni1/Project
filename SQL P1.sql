Create table Employee(
empno int NOT NULL, ename varchar(30),job varchar(30) default 'clerk',mgr int,hiredate date,sal float,comm float,deptno int
primary key(empno),foreign key (deptno) references Dept(deptno))

create table Dept(
deptno int,dname varchar(30),loc varchar(30)
primary key(deptno))

insert into Dept values(
10,'OPERATIONS','BOSTON'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHIICAGO'),(40,'ACCOUNTING','NEW YORK')


SELECT * FROM Dept
select * from Employee

INSERT INTO Employee VALUES(7369,'SMITH',default,7902,'1890-12-17',800.00,NULL,20)

Insert INTO Employee VALUES(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600.00,300.00,30),(7521,'WARD','SALESMAN',7698,'1981-02-22',1250.00,500.00,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975.00,NULL,20),(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250.00,1400.00,30),(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850.00,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450.00,NULL,10),(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000.00,NULL,20),(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000.00,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500.00,0.00,30),(7876,'ADAMS',DEFAULT,7788,'1987-05-23',1100.00,NULL,20),(7900,'JAMES',DEFAULT,7698,'1981-12-03',950.00,NULL,30),(7902,'FORD','ANALYST',7566,'1981-12-03',3000.00,NULL,20),
(7934,'MILLER',DEFAULT,7782,'1982-01-23',1300.00,NULL,10)

/*Q.3*/

SELECT ename,sal from Employee
where sal>1000

/*Q.4*/
select * from Employee
where hiredate<'1981-09-30'

/*Q.5*/
select ename from employee
where ename like '_i%'

/*Q.6*/

select ename,sal,sal*0.4 as allowance ,sal*0.1 as PF , sal+sal*0.4-sal*0.1 as net_salary from Employee

/* Q.7*/
select ename,job from Employee
where mgr is null

/*Q.8*/
select Empno,ename,sal from Employee
order by sal asc

/*Q.9*/
select COUNT(distinct(job)) as available_jobs from Employee

/*Q.10*/

Select job,sum(sal) as payable_Salarly from Employee
where job='SALESMAN'
Group by job

/*Q.11*/
select deptno, job ,AVG(Sal) as avg_sal from Employee
group by deptno,job

/*Q.12*/
select e.ename,e.sal,d.deptno from
Employee e , Dept d
where e.deptno=d.deptno

/*Q.13*/

Create table [Job Grades](
Grade varchar (10),Lowest_sal int,highest_sal int)

Insert into [Job Grades] values
('A',0,999),('B',1000,1999),('C',2000,2999),('D',3000,3999),('E',4000,5000)

Select  * from [Job Grades]

/*Q.14*/
select e.ename,e.sal,j.grade 
from Employee e join [Job Grades] j 
on e.sal between j.Lowest_sal and j.highest_sal

/*Q.15*/
select e.ename as employee_name ,'report to ', m.ename as manager_name from Employee e join Employee m
on e.mgr=m.empno

/*Q.16*/
select ename,(sal+ISNULL(comm,0)) as total_Sal from Employee

/*Q.17*/
select empno,ename from Employee
where empno%2=1

/*Q.18*/
select ename,sal,deptno,RANK() over (partition by deptno order by sal) as rank_sal from Employee

/*Q.19*/
select top 3 ename,sal from Employee 
order by sal desc

/*Q.20*/
select  ename ,deptno,sal  from Employee
where sal in (select MAX(sal) as max_sal from Employee group by deptno)
order by sal

