CREATE DATABASE IF NOT EXISTS Sales;

USE sales;

CREATE table sales
(
    purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchage DATE NOT NULL,
    custmer_id INT,
    item_code VARCHAR(10) NOT NULL
); 

CREATE TABLE customers
(
    custmoer_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_adress VARCHAR(255),
    number_of_complaints INT
);

SELECT * FROM sales.customers ;

DROP TABLE sales;

USE sales;

CREATE TABLE sales 
(
  Purchage_Number INT auto_increment,
  Date_Of_Purchage date not null,
  Customer_ID int,
  Item_Code varchar(12) Not null,
  primary key(Purchage_Number),
  FOREIGN KEY(customer_id) references customers(customer_id) ON DELETE CASCADE 
);

drop table customers;

create table customers
(
   Customer_id int,
   First_Name varchar(255),
   last_name varchar(255),
   emnail_Adrress varchar(255),
   number_of_complaints int,
   primary key(Customer_id)
);

create table items
(
  item_code varchar(255),
  item varchar(255),
  unit_price numeric(10,2),
  company_id varchar(255)
  -- primary key(item_code)
);

drop table companies;

create table companies 
(
  company_id varchar(255),
  company_name varchar(255),
  headquarter_phone_Number int(12),
  primary key (company_id)
);

-- alter table companies
--  primary key(company_id);

DROP TABLE sales;

CREATE TABLE sales 
(
  Purchage_Number INT auto_increment,
  Date_Of_Purchage date not null,
  Customer_ID int,
  Item_Code varchar(12) Not null,
  primary key(Purchage_Number)
);

ALTER TABLE sales
ADD FOREIGN KEY(customer_id) references customers(customer_id) ON DELETE CASCADE;

DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;

Use sales;

DROP TABLE companies;
CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarter_phone_Number INT(20),
    PRIMARY KEY (company_id)
);

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE column company_name  company_name varchar(255) NOT NULL;

INSERT INTO companies(company_id,headquarter_phone_Number, company_name)
VALUES(34,'724783954', 'Santosh_Pvt_ltd');

SELECT * FROM companies;

ALTER TABLE companies
CHANGE COLUMN headquarter_phone_number headquarter_phone_number VARCHAR(255) NOT NULL;

ALTER TABLE companies
MODIFY headquarter_phone_number varchar(255) null;

INSERT INTO companies(company_id,company_name)
VALUES(43,'sensex');
 
use my_database;
USE sales;
SELECT *FROM sales.companies;

select * from employees ORDER BY first_name;
select * from employees ORDER BY first_name ASC;
select * from employees order by first_name DESC;
select * from employees ORDER BY first_name,last_name ;
select * from employees ORDER BY emp_no,birth_date;
select * from employees ORDER BY emp_no;
select * from employees ORDER BY hire_date DESC;

select first_name from employees group by first_name order by first_name;
SELECT first_name,COUNT(first_name) from employees group by first_name order by COUNT(first_name) ASC;
SELECT first_name,COUNT(first_name) from employees group by first_name order by first_name;

SELECT first_name, COUNT(first_name) AS names_count FROM employees group by first_name order by names_count DESC;
select salary, COUNT(salary) as emps_with_same_salary FROM salaries  WHERE salary > '80000' group by salary  order by salary ;

-- HAVING 

select * from employees where hire_date >='2000-01-01';
select * from employees having hire_date >= '2000-01-01';

SELECT 
    first_name, COUNT(first_name) AS total_name_count
FROM
    employees
WHERE
    total_name_count > 250
GROUP BY first_name
ORDER BY first_name ASC;

SELECT 
    first_name, COUNT(first_name) AS total_name_count
FROM
    employees
GROUP BY first_name
HAVING
    total_name_count > 250
ORDER BY first_name ASC;

SELECT 
    emp_no,AVG(salary) as avg_salary 
FROM
    salaries
GROUP BY emp_no
HAVING avg_salary > '120000'
ORDER BY emp_no ASC;

SELECT
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

use employees;

select first_name, count(first_name) as name_count
from employees
where hire_date > '1985-01-01'
group by first_name
having count(first_name) > 0
order by first_name DESC;

select emp_no, count(emp_no) as number_of_contracts
from dept_emp 
where from_date > '2000-01-01'
group by emp_no
having count(emp_no) > 1
order by emp_no;

select emp_no, count(emp_no) as number_of_contracts
from dept_emp 
where from_date > '2000-01-01'
group by emp_no
having count(emp_no) > 1
order by emp_no
LIMIT 20;

select * from dept_emp LIMIT 100;
SELECT * FROM salaries order by salary desc limit 10;

select * from employees limit 4;

insert INTO employees
(
  emp_no,
  birth_date,
  first_name, 
  last_name,
  gender,
  hire_date
)
values
(
 9999902,
 '1999-04-14',
 'Kalmesh',
 'Latur',
 'M',
 '2021-12-09'
);

select * from employees order by emp_no desc;

INSERT into employees
values
(
  999903,
  '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);

select * from titles limit 10;

INSERT INTO titles
(
emp_no,
title,
from_date
)
values
(
999903,
'Senior Engineer',
'1997-10-01'
);

select * from titles order by emp_no desc limit 5;

select * from dept_emp limit 10;

INSERT INTO dept_emp
values
(
999903,
'd005',
'1997-10-01',
'9999-01-01'
);

select * from dept_emp order by emp_no desc limit 5;

create table department_dup
(
   dept_no char(4) NOT NULL,
   dept_name varchar(40) NOT NULL
);
select * from department_dup;

INSERT INTO department_dup
(
  dept_no,
  dept_name
)
select * from departments;

select * from department_dup;

insert into departments
values
(
 'd010',
 'Business Analysis'
);

select * from departments order by dept_no desc;

select * from employees order by emp_no desc;

update employees
set first_name = 'Rupali'
where emp_no = 9999902;

commit;

select * from departments;

UPDATE departments
set dept_name = 'Data Analysis'
where dept_no = 'd010';

select * from departments order by dept_no desc;

commit;


select * from employees where emp_no = 999903;
DELETE FROM employees where emp_no = 999903;

select * from employees where emp_no = 999903;
select * from titles where emp_no = 999903;

ROLLBACK;

select * from employees where emp_no = 999903;

select * from departments;

DELETE FROM departments where dept_no = 'd010';

select * from departments;

-- truncate from departments;

select * from salaries order by salary desc limit 10;
select COUNT(salary) FROM salaries; 
select count(from_date) from  salaries;
select count(emp_no),count(distinct from_date) from salaries;

select * from dept_emp;
select count(distinct dept_no) from dept_emp;

select * from salaries;
select sum(salary) from salaries;

select sum(salary) from salaries where from_date >= '1997-01-01';

select max(salary) from salaries;
select min(salary) from salaries;

select min(emp_no) from employees;
select max(emp_no) from employees;

select avg(salary) from salaries;
select avg(salary) from salaries where from_date >= '1997-01-01';

select ROUND(AVG(salary)) from salaries;
select ROUND(avg(salary), 2) from salaries;

select ROUND(avg(salary),1) from salaries where from_date >= '1997-01-01';

select * from department_dup;
insert INTO department_dup
(
dept_no
)
values('d010');

select * from department_dup;

/*alter table department_dup
add constraint ;*/

SELECT dept_no, dept_name, COALESCE(dept_no, dept_name) AS dept_info  FROM departments_dup ORDER BY dept_no ASC;

select * from department_dup;

alter table department_dup
change column dept_no dept_no char(4) NUll;
alter table department_dup
change column dept_name dept_name varchar(40) NULL;

commit;

select * from department_dup;
drop table department_dup;
select * from department_dup;

CREATE TABLE IF NOT EXISTS department_dup
(
   dept_no CHAR(4),
   dept_name VARCHAR(40)
);
select * from department_dup;
INSERT INTO department_dup
(
dept_no,
dept_name 
)
select * from departments;
select * from department_dup;
insert into department_dup
(dept_name)
value('Public relation');
select * from department_dup;
DELETE from department_dup where dept_no='d002';
select * from department_dup order by dept_no DESC;
INSERT INTO department_dup(dept_no) values('d010'),('d011');
select * from department_dup;

drop table if exists dept_manager_dup;
create table if not exists dept_manager_dup
(
 emp_no INT(11) NOT NULL,
 dept_no char(4) NULL,
 from_date date NOT NULL, 
 to_date date NULL
);

select * from dept_manager_dup;
insert into dept_manager_dup select * from dept_manager;
select * from dept_manager_dup;

insert into dept_manager_dup(emp_no,from_date)
values (999904, '2017-01-01'),
	   (999905, '2017-01-01'),
	   (999906, '2017-01-01'),
	   (999907, '2017-01-01');
select * from dept_manager_dup;
delete from dept_manager_dup where dept_no = 'd001';
select * from dept_manager_dup order by dept_no; 

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    department_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

select * from employees;
select * from dept_manager_dup;

select m.emp_no, e.first_name, e.last_name, e.hire_date, m.dept_no
from dept_manager_dup m
inner join employees e ON e.emp_no = m.emp_no 
order by m.emp_no;

select * 
from dept_manager_dup m
inner join employees e ON e.emp_no = m.emp_no 
order by m.emp_no;

INSERT INTO dept_manager_dup
values('110228','d003','1992-03-21','1999-01-01');
select * from dept_manager_dup order by emp_no;

INSERT INTO department_dup
values('d009','Customer service');
select * from department_dup order by dept_no;

-- to remove duplicate values 

SELECT 
    *
FROM
    dept_manager_dup m
        INNER JOIN
    department_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY emp_no;
-- with duplicate values

-- To remove duplicate values
select m.dept_no, d.dept_no, d.dept_name from dept_manager_dup m JOIN department_dup d on m.dept_no = d.dept_no group by m.emp_no;

use employees;

SELECT 
    m.dept_no, max(d.dept_no), max(d.dept_name)
FROM
    dept_manager_dup m
        JOIN
    department_dup d ON m.dept_no = d.dept_no
GROUP BY d.dept_no
ORDER BY m.dept_no;

select * from employees;
select * from dept_manager_dup;

SELECT e.emp_no, e.first_name, e.last_name, m.dept_no, m.emp_no, m.from_date from employees e
LEFT JOIN 
dept_manager_dup m ON e.emp_no = m.emp_no
where e.last_name = 'Markovitch'
order by m.dept_no DESC, e.emp_no;

SELECT 
    m.emp_no,
    MAX(m.dept_no) AS dept_no,
    MAX(d.dept_name) AS department_name
FROM
    dept_manager_dup m
        INNER JOIN
    department_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.emp_no;

delete FROM dept_manager_dup where emp_no = '110228';
delete from department_dup where dept_no = 'd009';
select * from department_dup;
select * from dept_manager_dup;




SELECT COUNT(*) AS total_employees, ANY_VALUE(employees.d.dept_name) AS department
FROM employees
GROUP BY employees.d.dept_name;


SELECT
    e.emp_no,  
    e.first_name,  
    e.last_name,  
    dm.dept_no,  
    dm.from_date  
FROM  
    employees e  
        LEFT JOIN 
dept_manager dm ON e.emp_no = dm.emp_no  
WHERE  
    e.last_name = 'Markovitch'  
ORDER BY dm.dept_no DESC, e.emp_no;

select * from dept_manager_dup m , department_dup d where m.dept_no = d.dept_no order by m.dept_no;

select m.dept_no, m.emp_no, d.dept_no
from dept_manager_dup m
INNER JOIN department_dup d ON d.dept_no = m.dept_no 
group by m.emp_no
order by dept_no;


SELECT
    m.emp_no,
    ANY_VALUE(m.dept_no) AS manager_dept_no,
    ANY_VALUE(d.dept_no) AS department_dept_no
FROM
    dept_manager_dup m
INNER JOIN
    department_dup d ON d.dept_no = m.dept_no
GROUP BY
    m.emp_no
ORDER BY
    manager_dept_no;
    
INSERT INTO dept_manager_dup
values('110228','d003','1992-03-21','1999-01-01');
select * from dept_manager_dup order by emp_no;

INSERT INTO department_dup
values('d009','Customer service');

select * from dept_manager_dup order by dept_no desc;

select m.dept_no, m.emp_no, d.dept_no
from dept_manager_dup m
LEFT OUTER JOIN department_dup d ON d.dept_no = m.dept_no 
group by m.emp_no
order by m.dept_no;

select * from employees e
right join dept_manager_dup m ON e.emp_no = m.emp_no order by m.emp_no;

select * from employees e
join salaries s on e.emp_no = s.emp_no
where s.salary > 145000
order by e.emp_no;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

select @@global.sql_mode;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

select m.dept_no, m.emp_no, d.dept_no
from dept_manager_dup m
INNER JOIN department_dup d ON d.dept_no = m.dept_no 
group by m.emp_no
order by d.dept_no;

select * from department_dup;
select * from titles;

select e.first_name, e.last_name, t.emp_no, t.title, t.from_date
from employees e
right join titles t on e.emp_no = t.emp_no
where e.first_name = 'Margareta' and e.last_name ='Markovitch' order by e.emp_no;

select * from dept_manager_dup m
inner join department_dup d on m.dept_no = d.dept_no 
group by m.emp_no
order by d.dept_no;

-- Nested Select 
 SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
ORDER BY e.emp_no DESC;

select * from employees;
-- wrong one -->select * from employees e where emp_no in( select dm.emp_no from dept_manager dm where from_date between '1990-01-01' and '1995-01-01');

 select * from dept_manager where emp_no in (select emp_no from employees e where hire_date between '1990-01-01' and '1995-01-01');
 
 select * from employees e where exists(select dm.emp_no from dept_manager dm where dm.emp_no = e.emp_no) order by e.emp_no desc;
 /*-- For above query it is more professional to use the order by outside of the sub-queries because it is a good practice
  and it is good to sort total output rather then sorting sub-query output*/
  
select * from employees e where exists( select t.emp_no from titles t where t.emp_no = e.emp_no and title = 'Assistant Engineer');

select * from titles;

select A.*
from
(select 
    e.emp_no as Employe_ID,
    MIN(de.dept_no) as department_code,
(select 
    emp_no
from
     dept_manager 
where 
     emp_no = 110022) as manager_ID
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no < 10020
group by e.emp_no
order by e.emp_no) as A
UNION 
select B.*
from
(select 
    e.emp_no as Employe_ID,
    MIN(de.dept_no) as department_code,
(select 
    emp_no
from
     dept_manager 
where 
     emp_no = 110039) as manager_ID
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no > 10020
group by e.emp_no
order by e.emp_no 
LIMIT 20) as B
;

select * from dept_manager;
select * from employees;
select * from dept_emp;

DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager
(
 emp_no INT(11) NOT NULL,
 dept_no char(4),
 manager_no int(11) NOT NULL
);

select * from emp_manager;

Insert into emp_manager
select U.*
from
(SELECT A.*
from
(select
    e.emp_no as Employe_ID,
    MIN(de.dept_no) as department_ID,
    (select emp_no from dept_manager where emp_no = 110022) as Manager_ID
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no < 10021
group by e.emp_no
order by e.emp_no) as A
UNION
select B.*
from
(select
    e.emp_no as Employe_ID,
    MIN(de.dept_no) as department_ID,
    (select emp_no from dept_manager where emp_no = 110039) as Manager_ID
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no > 10020
group by e.emp_no
order by e.emp_no 
limit 20) as B
UNION
SELECT C.*
FROM
(select 
    e.emp_no as Employe_ID,
    MIN(de.dept_no) as department_ID,
    (select emp_no from dept_manager where emp_no = 110039) as Manager_ID
from employees e
join dept_emp de on de.emp_no = e.emp_no
where e.emp_no = 110022
group by e.emp_no) as C
UNION 
SELECT D.* 
FROM
(select 
   e.emp_no as Employe_ID,
   MIN(de.dept_no) as department_ID,
   (select emp_no from dept_manager where emp_no = 110022) as Manager_ID
from employees e
join dept_emp de on de.emp_no = e.emp_no
where e.emp_no = 110039
group by e.emp_no) as D) as U;

INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
    select * from emp_manager;
    
    truncate table emp_manager;
    select * from emp_manager;
select * from employees where emp_no = 110022;

select * from emp_manager;


-- SELF-JOIN

select * from emp_manager order by emp_no;

select e1.*
from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no;

-- TO GET REQUIRED OUTPUT WE HAVE TWO WAY  1 IS USING DISTINCT AND ANOTHER IS COMPLICATED.

select  distinct e1.*
from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no;

select  distinct e1.*
from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no
where e2.emp_no in (select manager_no from emp_manager);

select * from dept_emp;

select emp_no,from_date, to_date,count(emp_no) as Num
from dept_emp
group by emp_no
having emp_no>1;

select * from dept_emp;

show databases;
select * from employees;
select * from dept_emp;

select emp_no,from_date, to_date, COUNT(emp_no) as NUM
from dept_emp
group by emp_no
having NUM> 1 
order by num,emp_no desc;

-- To add views in database view section

create or replace view v_dept_emp_latest_date as 
select emp_no,
	   max(from_date) as from_date, 
	   max(to_date) as to_date
from dept_emp
group by emp_no;
  

select emp_no,
	   max(from_date) as from_date, 
	   max(to_date) as to_date
from dept_emp
group by emp_no;
select * from dept_emp;

select * from dept_manager;
select * from salaries;

CREATE OR REPLACE VIEW V_avg_manager_salary as
select ROUND(avg(salary),2) as AVG_managaer_salary
from salaries where emp_no in(select emp_no from dept_manager);

create or replace view v_manager_avg_salary as
select round(avg(salary),2) as avg_salary
from salaries s
join dept_manager dm on s.emp_no = dm.emp_no; 


-- Creating the procedures

DROP procedure IF exists select_emp;
DELIMITER $$
create procedure select_emp()
  begin
     SELECT * FROM employees limit 1000;
  end $$
  
DELIMITER ;

call select_emp;  -- No brackets are used here
call employees.select_emp(); -- brackets are optional here but it is good practice to use brackets 

DROP PROCEDURE IF EXISTS Avg_emp_salary;

DELIMITER $$
CREATE PROCEDURE Avg_emp_salary()
BEGIN
   SELECT emp_no, ROUND(AVG(salary),2) as avg_salary
   from salaries
   group by emp_no
   order by emp_no;
END$$
DELIMITER ;

 SELECT emp_no, ROUND(AVG(salary),2) as avg_salary
   from salaries
   group by emp_no
   order by emp_no; 
 call avg_emp_salary;
 
 DELIMITER $$
 create procedure avg_salary()
 begin
    select avg(salary) from salaries;
end$$

delimiter ;

-- Creating procedures with parameters

DROP PROCEDURE IF EXISTS emp_salary;
DELIMITER $$
-- use employees$$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
  select e.first_name, e.last_name, s.salary, s.from_date, s.to_date
  from employees e
  join salaries s on e.emp_no = s.emp_no 
  where e.emp_no = p_emp_no;
END$$
delimiter ;

call emp_salary(110022);

DROP PROCEDURE IF EXISTS emp_avg_salary;
DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
  select e.first_name, e.last_name, ROUND(AVG(salary),2) as Avg_salary
  from employees e
  join salaries s on e.emp_no = s.emp_no
  where e.emp_no = p_emp_no;
END $$

DELIMITER ;

call emp_avg_salary(110022);

-- procedures with in and out parameters

DROP PROCEDURE IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN 
SELECT avg(salary)
INTO p_avg_salary
from employees e
join salaries s on e.emp_no = s.emp_no
where e.emp_no = p_emp_no;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS emp_info;
DELIMITER $$
CREATE PROCEDURE emp_info(in e_first_name varchar(20), e_last_name varchar(20), out e_emp_no INTEGER(10))
BEGIN
SELECT emp_no
into e_emp_no 
from employees
where e_first_name = first_name and e_last_name = last_name;
END $$
DELIMITER ;

select * from employees limit 12;


set @e_emp_no = 0;
call emp_info('Aruna','Journel',@e_emp_no);
select @e_emp_no;


DROP FUNCTION IF EXISTS  f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary) 
into v_avg_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    p_emp_no = e.emp_no;
RETURN v_avg_salary;
END $$

DELIMITER ;

DROP FUNCTION IF EXISTS emp_info;
DELIMITER $$

CREATE FUNCTION emp_info(e_first_name varchar(100), e_last_name varchar(100)) returns decimal(23,3)
DETERMINISTIC NO SQL READS SQL DATA
begin 
 DECLARE v_max_date date;
 DECLARE v_salary decimal(23,3);
 
 select max(from_date)
 INTO  v_max_date
 from employees e
 join salaries s on e.emp_no = s.emp_no
 where e_first_name = e.first_name and e_last_name = e.last_name;
 
 select salary 
 into v_salary
 from employees e 
 join salaries s on e.emp_no = s.emp_no
 where e_first_name = e.first_name and e_last_name = e.last_name and from_date = v_max_date;
 return v_salary;
 end $$
 
 delimiter ;
 
 select * from employees;
 
 call avg_salary();
 
 use employees;

commit;

delimiter $$

create trigger before_salary_insert 
before insert on salaries
for each row
begin
 if new.salary < 0 then
 set new.salary = 0 ;
 end if;
end $$
delimiter ;

select * from salaries  where emp_no = 10001;

delete from salaries where salary = -98789;
select * from salaries where emp_no = 10001;

insert into salaries values(10001, -98789, '1986-01-03', '1999-01-03');

select * from salaries where emp_no = 10001 order by salary;

select sysdate()

delimiter $$

create trigger before_salary_update 
before update on salaries
for each row
begin
 if new.salary < 0 then
 set new.salary = OLD.salary ;
 end if;
end $$
delimiter ;

select * from salaries where emp_no = 10001;

update salaries
set salary = 98989
where emp_no = 10001 and from_date = '1986-01-03';

select * from salaries where emp_no = 10001 order by salary;

update salaries
set salary = -90938
where emp_no = 10001 and from_date = '1986-01-03';

select * from salaries where emp_no = 10001 order by salary;

select date_format(sysdate(), '%d-%m-%y') as today;

-- INDEXS

 select * from employees where hire_date > '2000-01-01';
 
 CREATE INDEX i_hire_date on employees(hire_date);
 
 select * from employees where hire_date > '2000-01-01';
 
 select * from employees where first_name = 'rupali' and last_name = 'latur';
 
 CREATE INDEX i_composites_index on employees(first_name, last_name);
 
 select * from employees where first_name = 'Rupali' and last_name = 'Latur';
 
 -- to show indexes 
 
 show index from employees from employees;
 
 alter table employees
 DROP INDEX i_hire_date;
 
 show index from employees from employees;
 
 select * from salaries where salary > 89000;
 
 CREATE INDEX i_salary on salaries(salary);
 
 select * from salaries where salary > 89000;
 
 select emp_no, first_name, last_name, 
 case 
     when gender = 'M' then 'Male'
     else 'Female'
     end as gender
 from employees ;
 
 select 
        emp_no,
        first_name,
        last_name,
        CASE gender
            WHEN 'M' then 'Male'
            else 'Female'
            end as gender
from employees;

select e.emp_no, first_name, last_name, 
case 
   when dm.emp_no IS NOT NULL THEN 'Manager'
   else 'Employee'
   end as Designation
from employees e
 left join  dept_manager dm on e.emp_no = dm.emp_no;
 
-- where e.emp_no > 109990;
  
  select emp_no, first_name, last_name,
  if(gender = 'M', 'Male','Female') as gender
  from employees;
  
  select 
        dm.emp_no,
        e.first_name,
        e.last_name,
        max(s.salary)-min(s.salary) as Salary_diff,
	CASE 
        WHEN max(s.salary) - min(s.salary) > 30000 Then 'Salary was raised by more then 30k$'
        WHEN max(s.salary)-min(s.salary) between 30000 and 20000 then 'Salary was raised between 30k or 20k'
        ELSE 'Salary was raised by less then 20k'
        END as Salary_increment
	from dept_manager dm
    join employees e on e.emp_no = dm.emp_no
    join salaries s on s.emp_no = e.emp_no
group by e.emp_no;


select * from dept_manager;
select * from employees;

select e.emp_no,
	   e.first_name,
       e.last_name,
CASE 
   WHEN dm.emp_no IS NOT NULL THEN 'Manager'
   else 'Employee'
   END as designation
from dept_manager dm
 right join employees e on e.emp_no = dm.emp_no
where e.emp_no > 109990;

select e.emp_no,
	   e.first_name,
       e.last_name,
       max(s.salary)-min(s.salary),
CASE
     when  max(s.salary)-min(s.salary)> 30000 THEN 'salary was raised by more then 30k'
     else 'Not raised more then 30k'
end as salary_differnces
from dept_manager dm
join employees e  on e.emp_no = dm.emp_no
join salaries s on e.emp_no = s.emp_no
group by dm.emp_no;


select e.emp_no,
       e.first_name,
       e.last_name,
       max(s.salary) - min(s.salary) As salary_diff,
     if(max(s.salary) - min(s.salary) > 30000,'raised by more then 30k','not raised by more then 30k') as salary_raise
from dept_manager dm 
join employees e on e.emp_no = dm.emp_no
join salaries s on e.emp_no = s.emp_no
group by e.emp_no;

select * from dept_emp;

select e.emp_no,
       e.first_name,
       e.last_name,
       e.hire_date,
      -- de.to_date,
       date_format(sysdate(),'%d-%m-%y') as today,
CASE 
   WHEN max(de.to_date) > sysdate() then 'Is still employed'
   else 'Not an employe anymore'
end as current_employe
from dept_emp de
join employees e on e.emp_no = de.emp_no
group by de.emp_no
limit 100;

select * from dept_emp where to_date > sysdate();

/*
-- row number()
--  windows specification                                    action
    none = an empty OVER clause                    -> ROW_NUMBER() will perform the task on all query rows
*/

select emp_no,
       salary,
       ROW_NUMBER() OVER() as row_numb
from salaries
limit 100;


/*
-- row number()
--  windows specification                                    action
    none = an empty OVER clause                    -> ROW_NUMBER() will perform the task on all query rows
    containing PARTITION_BY                         -> the data will be organized in partition 
*/

select 
       emp_no,
	   salary,
       ROW_NUMBER() OVER(PARTITION BY emp_no) as row_no
from salaries
limit 2000;

select 
      emp_no,
      salary,
      ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_no
from salaries;

select 
      emp_no,
      salary,
      ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_no
from salaries;


/*Exercise #1 :

Write a query that upon execution, assigns a row number to all managers we have information 
for in the "employees" database (regardless of their department).

Let the numbering disregard the department the managers have worked in. Also, let it start from the value of 
1. Assign that value to the manager with the lowest employee number.*/
select 
      emp_no,
      ROW_NUMBER() OVER(order by emp_no) as row_no
from dept_manager;


/*Exercise #2:

Write a query that upon execution, assigns a sequential number for each 
employee number registered in the "employees" table. Partition the data by the employee's first name and order
 it by their last name in ascending order (for each partition).*/
select 
      emp_no,
      first_name,
      last_name,
      ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY last_name) as Alpha_order 
from employees;

select 
      dm.emp_no,
      salary,
	  ROW_NUMBER() OVER() AS row_no,
      ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary desc) AS diff_salary
from dept_manager dm
join salaries s on dm.emp_no = s.emp_no
order by row_no, emp_no, salary;



select 
      dm.emp_no,
      salary,
	  ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary) AS row_no,
      ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary desc) AS diff_salary
from dept_manager dm
join salaries s on dm.emp_no = s.emp_no;

-- windows function 
 select 
       emp_no,
       salary,
       ROW_NUMBER() OVER w as row_nu
from salaries
  window w as (PARTITION BY emp_no order by salary desc);
  
  /*Exercise #1:

Write a query that provides row numbers for all workers from the "employees" table, partitioning 
the data by their first names and ordering each partition by their employee number in ascending order.

NB! While writing the desired query, do *not* use an ORDER BY clause in the relevant SELECT statement. 
At the same time, do use a WINDOW clause to provide the required window specification.*/

select 
      emp_no,
      first_name,
      last_name,
      ROW_NUMBER() OVER w as row_no
from 
    employees  	 	
	 WINDOW  w as (PARTITION BY first_name order by emp_no); 
     
/* 
     
-- Using Partition and group by in a same query
 
select a.emp_no,
       max(salary) as max_salary 
from (select emp_no,salary, ROW_NUMBER() OVER w as row_no from salaries window w 
as (PARTITION BY emp_no order by salary)) a
group by  emp_no;

select 
        a.emp_no,
        max(salary) as max_salary
from (select emp_no, salary, ROW_NUMBER() OVER (PARTITION BY emp_no order by salary) as row_no from salaries) a
group by emp_no; 

select 
      emp_no,
      salary,
      ROW_NUMBER() OVER(PARTITION BY emp_no order by salary) as row_no
from salaries;

select 
       a.emp_no,
       max(salary) as max_salary 
from (select emp_no, salary from salaries) a
group by emp_no;

select 
      a.emp_no,
      a.salary as max_salary from (select emp_no, salary, ROW_NUMBER() OVER w as row_no from salaries window w as (partition by 
       emp_no order by salary)) a 
       where a.row_no = 1;
       
*/ # using all these all we will get same output

/*Exercise #1:

Find out the lowest salary value each employee has ever signed a contract for. 
To obtain the desired output, use a subquery containing a window function, 
as well as a window specification introduced with the help of the WINDOW keyword.

Also, to obtain the desired result set, refer only to data from the “salaries” table.*/

select 
       a.emp_no,
       min(salary) as min_salary FROM 
       (select emp_no, salary, ROW_NUMBER() OVER w as row_no from salaries window w as (partition by emp_no order by salary)) a
	group by emp_no;
    
/*Exercise #2:

Again, find out the lowest salary value each employee has ever signed a contract for.
 Once again, to obtain the desired output, use a subquery containing a window function. 
 This time, however, introduce the window specification in the field list of the given subquery.

To obtain the desired result set, refer only to data from the “salaries” table.*/

select 
       a.emp_no,
       min(salary) as min_salary from
       (select emp_no, salary, ROW_NUMBER() OVER (PARTITION BY emp_no order by salary) as row_no from salaries) a
       group by emp_no;
	
/*Exercise #3:

Once again, find out the lowest salary value each employee has ever signed a contract for.
 This time, to obtain the desired output, avoid using a window function. Just use an aggregate function and a subquery.

To obtain the desired result set, refer only to data from the “salaries” table.*/
-- first lowest 
select 
       a.emp_no,
       a.salary as max_salary from 
       (select emp_no, salary, ROW_NUMBER() OVER(partition by emp_no order by salary) as row_no from salaries) a
where a.row_no = 1;
-- 2nd lowest
select 
       a.emp_no,
       a.salary as max_salary from 
       (select emp_no, salary, ROW_NUMBER() OVER(partition by emp_no order by salary) as row_no from salaries) a
where a.emp_no = 10001 and a.row_no = 4 ;

select 
       a.emp_no,
       min(salary) as min_salary
       from(select emp_no, salary from salaries) a
       group by emp_no;
       
-- RANK() DENSE_RANK() 
 
select 
       emp_no,
       salary,
       ROW_NUMBER() OVER  w as row_no
from salaries
where emp_no = 10001
window w as (partition by emp_no order by salary);

select 
       emp_no,
	   (COUNT(salary) - COUNT(DISTINCT salary)) as diff
from salaries
group by emp_no
having diff > 0 
order by diff desc;

select 
       emp_no,
       salary,
       ROW_NUMBER() OVER (PARTITION BY emp_no order by salary desc) AS row_no
from salaries
where emp_no = 11839;

select 
       emp_no,
       salary,
       RANK() OVER (PARTITION BY emp_no order by salary desc) AS row_no
from salaries
where emp_no = 11839;

## Here in above the identicall rows are named same but the next row name changed to 5 which should be 4 
## so to get that type output we suppose to use DENSE_RANK() 

select 
       emp_no,
       salary,
       DENSE_RANK() OVER (PARTITION BY emp_no order by salary desc) AS row_no
from salaries
where emp_no = 11839;

/*Exercise #1:

Write a query containing a window function to obtain all salary values 
that employee number 10560 has ever signed a contract for.

Order and display the obtained salary values from highest to lowest.*/

select
      emp_no,
      salary,
	  ROW_NUMBER() OVER w as row_no
from salaries
where emp_no = 10560
window w as (partition by emp_no order by salary) ;

select 
       dm.emp_no,
       (count(salary)) as no_of_contracts
from dept_manager dm
join salaries s on dm.emp_no = s.emp_no
group by emp_no
order by emp_no;

select
      emp_no,
      salary,
	  RANK() OVER w as row_no
from salaries
where emp_no = 10560
window w as (partition by emp_no order by salary) ;

select
      emp_no,
      salary,
	  dense_rank() OVER w as row_no
from salaries
where emp_no = 10560
window w as (partition by emp_no order by salary) ;

select * from departments limit 10;
select * from dept_manager limit 10;
select * from salaries limit 10;

SELECT 
       dm.dept_no,
       d.dept_name,
       s.salary,
       dm.emp_no,
       RANK() over w as dept_salary_ranking,
       dm.from_date as Manager_from_date,
       dm.to_date as Manager_to_date,
       s.from_date as salary_from_date,
       s.to_date as salary_to_date
FROM 
dept_manager dm
join 
salaries s on dm.emp_no = s.emp_no
           and s.from_date between dm.from_date and dm.to_date
           and s.to_date between dm.from_date and dm.to_date
join 
departments d on dm.dept_no = d.dept_no
WINDOW w as (PARTITION BY dm.dept_no order by s.salary desc); 

/*Exercise #1:

Write a query that ranks the salary values in descending order of all contracts signed by employees
 numbered between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear 
 the same rank. Also, allow gaps in the ranks obtained for their subsequent rows.
Use a join on the “employees” and “salaries” tables to obtain the desired result.*/
select
       e.emp_no,
       s.salary,
       RANK() OVER e as salary_rank_no
from employees e
join salaries s on e.emp_no = s.emp_no
where e.emp_no between 10500 and 10600
window e as (PARTITION BY emp_no order by salary desc);

/*Exercise #2:

Write a query that ranks the salary values in descending order of the following contracts from the "employees" database:
- contracts that have been signed by employees numbered between 10500 and 10600 inclusive.
- contracts that have been signed at least 4 full-years after the date when the given employee was hired in the company for the first time.
In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks obtained for their subsequent rows.
Use a join on the “employees” and “salaries” tables to obtain the desired result.*/
select
       e.emp_no,
       s.salary,
       dense_rank() OVER e as salary_rank_no,
       s.from_date,
       e.hire_date,
       (YEAR(s.from_date) - YEAR(e.hire_date)) as year_from_start
from employees e
join salaries s on e.emp_no = s.emp_no
and (YEAR(s.from_date) - YEAR(e.hire_date)) >= 5
where e.emp_no between 10500 and 10600
window e as (PARTITION BY emp_no order by salary desc);

-- Lag() and LEAD() window functions

select 
      emp_no,
      LAG(salary) over w as previous_salary,
      salary,
      LEAD(salary) over w as next_salary,
      salary - LAG(salary) over w as diff_between_prev_current_salary,
      LEAD(salary) over w - salary as diff_bet_current_and_next_salary
from salaries 
where emp_no = 10001
window w as(order by salary);


select 
       emp_no,
       salary,
       LAG(salary) over w as previous_salary,
       LEAD(salary) over w as next_salary,
       salary - LAG(salary) over w as diff_salary_and_lag_salary,
       LEAD(salary) over w - salary as diff_lead_salary_and_salary 
from salaries 
where  salary > 80000 and emp_no between 10500 and 10600 # here where is very imp and first limit salary after limit emp_no don't do reverse it will not show required output
window w as (PARTITION BY emp_no ORDER BY salary);

select 
      emp_no,
      LAG(salary,2) over w as prceding_previous,
      LAG(salary) over w as previous_salary,
      salary,
      LEAD(salary) over w as next_salary,
      LEAD(salary,2) over w  AS next_to_next_salary
from salaries
window w as (partition by emp_no order by salary desc)
limit 1000;
select * from dept_emp limit 1;

select 
      de.emp_no,
      d.dept_name,
      s.salary
      
from dept_emp de
join departments d on d.dept_no = de.dept_no
join salaries s on de.emp_no = s.emp_no;

-- nice try but it is not correct follow up

select sysdate();

select emp_no, dept_no, from_date, to_date
from dept_emp
where to_date > sysdate(); # correct but not relevent

select emp_no, salary, from_date, to_date
from salaries
where to_date > sysdate();

select 
       emp_no,
       salary,
       max(from_date),
       to_date
from 
     salaries
     where to_date > sysdate()
     group by emp_no;
-- face 1055 error code for above query

select 
       s1.emp_no,s.salary, s.from_date, s.to_date
from salaries s
join (select emp_no, max(from_date) as from_date from salaries group by emp_no) s1 on s.emp_no = s1.emp_no
where to_date > sysdate() and s.from_date = s1.from_date;


/*Exercise #1:
Create a query that upon execution returns a result set containing the employee numbers, 
contract salary values, start, and end dates of the first ever contracts that each employee signed for the company.
To obtain the desired output, refer to the data stored in the "salaries" table.
*/
select 
       s1.emp_no,s.salary, s.from_date, s.to_date
from salaries s
join (select emp_no, min(from_date) as from_date from salaries group by emp_no) s1 on s.emp_no = s1.emp_no
where s.from_date = s1.from_date;

select 
      de1.emp_no, de.dept_no, de.from_date, de.to_date
from dept_emp de
      join
	 (select emp_no, max(from_date) as from_date from dept_emp group by emp_no) de1 on de.emp_no = de1.emp_no
where de.from_date = de1.from_date;

select 
      de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) over w as avg_salary_per_dept
from 
      (select 
      de1.emp_no, de.dept_no, de.from_date, de.to_date
from dept_emp de
      join
	 (select emp_no, max(from_date) as from_date from dept_emp group by emp_no) de1 on de.emp_no = de1.emp_no
where de.from_date = de1.from_date) de2
join 
     (select 
       s1.emp_no,s.salary, s.from_date, s.to_date
from salaries s
join (select emp_no, min(from_date) as from_date from salaries group by emp_no) s1 on s.emp_no = s1.emp_no
where s.from_date = s1.from_date) s2 on de2.emp_no = s2.emp_no

join departments d on de2.dept_no = d.dept_no
group by de2.emp_no, d.dept_name
window w as (PARTItion by de2.dept_no)
order by de2.emp_no;

select 
*
from 
     salaries s
       join
	  dept_emp de on de.emp_no = s.emp_no
where s.from_date > s.to_date;
## Above is wrong one below is the correct one

select emp_no, salary, from_date, to_date
from salaries 
where from_date > '2000-01-01' and to_date > '2002-01-01'
group by emp_no;

select s1.emp_no, s.salary, s.from_date, s.to_date
from salaries s 
      join 
	(select emp_no, salary, from_date, to_date from salaries where from_date > '2000-01-01' and to_date > '2002-01-01' group by emp_no) s1
where s.from_date = s1.from_date and s.to_date = s1.to_date;



select 
      de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) over w as avg_salary_per_dept
from 
      (select 
      de1.emp_no, de.dept_no, de.from_date, de.to_date
from dept_emp de
      join
	 (select emp_no, max(from_date) as from_date from dept_emp group by emp_no) de1 on de.emp_no = de1.emp_no
where de.to_date < '2002-01-01'
	AND de.from_date > '2000-01-01' and de.from_date = de1.from_date) de2
join 
     (select 
       s1.emp_no,s.salary, s.from_date, s.to_date
from salaries s
join (select emp_no, min(from_date) as from_date from salaries group by emp_no) s1 on s.emp_no = s1.emp_no
where s.to_date < '2002-01-01'
	AND s.from_date > '2000-01-01' and s.from_date = s1.from_date) s2 on de2.emp_no = s2.emp_no

join departments d on de2.dept_no = d.dept_no
group by de2.emp_no, d.dept_name
window w as (PARTItion by de2.dept_no)
order by de2.emp_no, s.salary;

-- Introduction to CTE (common table expression)

/*Task is : To find the How manay salary contracts signed by a female employees have been valued above all time 
 Avg_contract salary value of the company.*/
 
 
select avg(salary) as avg_salary
from salaries;                   -- for basic we found the avg salary of the company

/*We can use CTE: By using CTE we can we can use single query to make the rrquired camparision between each contract salary value
 and all time avg*/
 
 WITH cte as(select avg(salary) as avg_salary from salaries)
  select 
   * 
   from 
   cte c;
-- Here we get the avg_salary of the company using CTE

WITH cte as ( select avg(salary)as avg_salary from salaries)
select * from salaries s join cte c;
-- Here we attached the avg_salary to each row 

with cte as (select avg(salary) as Avg_salary from salaries)
select * from 
salaries s join employees e on e.emp_no = s.emp_no and gender = 'F'
join cte c;
 -- Here we got the output of only female but not greater avg then the companies
 
 WITH cte AS (SELECT AVG(salary) AS Avg_salary from salaries)
 SELECT 
   SUM(case
        when s.salary > c.avg_salary then 1
        else 0
        End) as no_f_salary_above_avg_salary,
	COUNT(s.salary) as No_of_contracts
	from
    salaries s 
     join 
	employees e on e.emp_no = s.emp_no and gender = 'F'
     join 
	cte c;
    
    -- haaha! this is the output we were looking and we got it.
    
    -- same output we can get without using CTE 
    
    select 
           SUM(CASE WHEN s.salary > a.avg_salary THEN 1 ELSE 0 end) as no_f_salary_above_avg_salary,
           COUNT(s.salary) as count_of_contract
	from salaries s
           join
		 Employees e on e.emp_no = s.emp_no and gender = 'F'
           join
           (select avg(salary) as avg_salary from salaries) a;
           
 -- And also we will get same output by using count on both cases 
    
    select 
           SUM(CASE WHEN s.salary > a.avg_salary THEN 1 ELSE 0 end) as no_f_salary_above_avg_salary_w_sum,
           COUNT(CASE WHEN s.salary > a.avg_salary then s.salary ELSE NULL END) as no_f_salary_above_avg_salary_w_count,
           COUNT(s.salary) as count_of_contract
	from salaries s
           join
		 Employees e on e.emp_no = s.emp_no and gender = 'F'
           join
           (select avg(salary) as avg_salary from salaries) a;

/*Exercise #1:
Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement in a query to
find out how many male employees have never signed a contract with a salary value higher than 
or equal to the all-time company salary average.*/

WITH cte as (select avg(salary) as avg_salary from salaries)
SELECT 
      SUM(CASE WHEN s.salary <= c.avg_salary THEN 1 ELSE 0 END) AS No_m_salary_below_avg_salary,
      count(s.salary) as no_of_contracts
from salaries s
       join 
	 employees e on e.emp_no = s.emp_no and e.gender = 'M'
      join
	 cte c;
     
 /*Exercise #2:
Use a CTE (a Common Table Expression) and (at least one) COUNT() function in the SELECT statement of 
a query to find out how many male employees have never signed a contract with a salary value higher
than or equal to the all-time company salary average.
*/    
WITH cte as (select avg(salary) as avg_salary from salaries)
SELECT 
      SUM(CASE WHEN s.salary <= c.avg_salary THEN 1 ELSE 0 END) AS No_m_salary_below_avg_salary,
      COUNT(CASE WHEN s.salary <= c.avg_salary THEN s.salary ELSE NULL END) AS No_m_salary_below_avg_salary_w_count,
      count(s.salary) as no_of_contracts
from salaries s
       join 
	 employees e on e.emp_no = s.emp_no and e.gender = 'M'
      join
	 cte c;
     
/*Exercise #3:
Use MySQL joins (and don’t use a Common Table Expression) in a query to find out how 
many male employees have never signed a contract with a salary value higher than or equal to the all-time company salary average 
(i.e. to obtain the same result as in the previous exercise).*/

select 
           SUM(CASE WHEN s.salary <= a.avg_salary THEN 1 ELSE 0 end) as no_M_salary_above_avg_salary_w_sum,
           COUNT(CASE WHEN s.salary <= a.avg_salary then s.salary ELSE NULL END) as no_M_salary_above_avg_salary_w_count,
           COUNT(s.salary) as count_of_contract
	from salaries s
           join
		 Employees e on e.emp_no = s.emp_no and gender = 'M'
           join
           (select avg(salary) as avg_salary from salaries) a;
	
/*Exercise #4:
Use a cross join in a query to find out how many male employees have never signed a contract
 with a salary value higher than or equal to the all-time company salary average 
(i.e. to obtain the same result as in the previous exercise).*/
WITH cte as (select avg(salary) as avg_salary from salaries)
SELECT 
      SUM(CASE WHEN s.salary <= c.avg_salary THEN 1 ELSE 0 END) AS No_m_salary_below_avg_salary,
      COUNT(CASE WHEN s.salary <= c.avg_salary THEN s.salary ELSE NULL END) AS No_m_salary_below_avg_salary_w_count,
      count(s.salary) as no_of_contracts
from salaries s
       join 
	 employees e on e.emp_no = s.emp_no and e.gender = 'M'
      cross join
	 cte c;
     
-- using multiple subclause in with clause
/*We can use CTE: By using CTE we can we can use single query to make the rrquired camparision between each contract salary value
 and all time avg(Across all gender)*/
 
with cte1 as (select avg(salary) as avg_salary from salaries),
     cte2 as (select s.emp_no, max(salary) as f_highst_salary from salaries s join employees e on e.emp_no = s.emp_no and e.gender = 'F' group by s.emp_no) 
select 
      sum(CASE WHEN c2.f_highst_salary > c1.avg_salary THEN 1 ELSE 0 END) as f_highst_salary_then_avg_salary,
      COUNT(e.emp_no) as no_of_contracts
from employees e 
       join 
	 cte2 c2 on c2.emp_no = e.emp_no
     cross join cte1 c1;
     
     with cte1 as (select avg(salary) as avg_salary from salaries),
     cte2 as (select s.emp_no, max(salary) as f_highst_salary from salaries s join employees e on e.emp_no = s.emp_no and e.gender = 'F' group by s.emp_no) 
select 
      sum(CASE WHEN c2.f_highst_salary > c1.avg_salary THEN 1 ELSE 0 END) as f_highst_salary_then_avg_salary,
      COUNT(e.emp_no) as no_of_contracts,
      CONCAT(ROUND((sum(CASE WHEN c2.f_highst_salary > c1.avg_salary THEN 1 ELSE 0 END) / count(e.emp_no))* 100,2), '%') as percentage
from employees e 
       join 
	 cte2 c2 on c2.emp_no = e.emp_no
     cross join cte1 c1;
     
/*Exercise #1:
Use two common table expressions and a SUM() function in the SELECT statement of a query to obtain the number of male 
employees whose highest salaries have been below the all-time average.*/

with cte1 as(select avg(salary) as avg_salary from salaries),
cte2 as ( select s.emp_no, max(salary) as f_highest_salary from salaries s join employees e on e.emp_no = s.emp_no and gender = 'M' group by s.emp_no)
select 
     sum(CASE WHEN c2.f_highest_salary <= c1.avg_salary then 1 else 0 end) as m_higest_salary_below_then_avg_salary,
     count(c2.f_highest_salary) as no_of_contracts
from employees e
       join 
	  cte2 c2 on e.emp_no = c2.emp_no
       join
       cte1 c1;

-- Temporary Tables:
 /* Obtain the list of containing the highest contract salary value signed by all female employees who have worked in the company*/

select e.emp_no, max(salary) as max_salary 
from salaries s
        join
	 employees e on e.emp_no = s.emp_no and gender = 'F'
     group by emp_no;
  
CREATE temporary TABLE f_highest_salary(
 select e.emp_no, max(salary) as max_salary 
from salaries s
        join
	 employees e on e.emp_no = s.emp_no and gender = 'F'
     group by emp_no);
	
select * from f_highest_salary;
DROP temporary table f_highest_salary;

/*Exercise #1:
Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.
Exercise #2:
Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries 
temporary table you created in the previous exercise.*/

CREATE TEMPORARY TABLE male_max_salary (
  select e.emp_no, max(salary) as m_max_salary
  from salaries s
         join
		employees e on e.emp_no = s.emp_no and gender ='M'
	   group by emp_no);

select * from male_max_salary;

select * from f_highest_salary;
DROP temporary table f_highest_salary;

CREATE temporary TABLE f_highest_salary(
 select e.emp_no, max(salary) as max_salary 
from salaries s
        join
	 employees e on e.emp_no = s.emp_no and gender = 'F'
     group by emp_no)
     LIMIT 10;

select * from f_highest_salary;

SELECT * FROM f_highest_salary f1 join f_highest_salary f2;

with cte as (select e.emp_no, max(salary) as max_salary 
from salaries s
        join
	 employees e on e.emp_no = s.emp_no and gender = 'F'
     group by emp_no
     LIMIT 10)
select * from f_highest_salary join cte c;

-- To get current date  Now() to get previous or later use date_sub()
/*
 syntax :
    DATE_SUB(date, INTERVAL expr UNIT) UNIT may be month,day,year
*/
 CREATE temporary TABLE DATES(
  select
  Now() as current_date_TIME,
  date_sub(now(), INTERVAL 1 MONTH) AS one_month_earlier,
  date_sub(NOW(), interval -1 year) as a_year_later);
  
SELECT * FROM DATES;
DROP TEMPORARY TABLE DATES;

CREATE temporary TABLE dates
( select 
        NOW() AS current_date_time,
        DATE_SUB(NOW(), INTERVAL 2 MONTH) AS 2_months_earlier_then_now,
        DATE_SUB(NOW(), INTERVAL -2 YEAR) AS 2_years_later_from_now);
        
select * from dates;

WITH cte1 as ( select 
        NOW() AS current_date_time,
        DATE_SUB(NOW(), INTERVAL 2 MONTH) AS 2_months_earlier_then_now,
        DATE_SUB(NOW(), INTERVAL -2 YEAR) AS 2_years_later_from_now)
select * from
               dates d join cte1 c1;
               
WITH cte1 as ( select 
        NOW() AS current_date_time,
        DATE_SUB(NOW(), INTERVAL 2 MONTH) AS 2_months_earlier_then_now,
        DATE_SUB(NOW(), INTERVAL -2 YEAR) AS 2_years_later_from_now)
select * from
               dates UNION ALL select * from  cte1 c1;
			
select * from male_max_salary;
select * from dates;

drop tables male_max_salary, dates;

use employees_mod;

select
       d.dept_name,
       ee.gender,
       ee.emp_no,
       dm.from_date,
       dm.to_date,
       e.calender_year,
       CASE WHEN dm.to_date > e.calender_year and dm.from_date < e.calender_year then 1 else 0 end as active
from 
  (select hire_date as calender_year from t_employees group by calender_year) e
  cross join
  t_dept_manager dm
  join 
  t_departments d on dm.dept_no = d.dept_no
  join
  t_employees ee on ee.emp_no = dm.emp_no
  order by dm.emp_no, calender_year;
  
  select * 
  from 
  (select hire_date as calender_year from t_employees group by calender_year) e
  cross join
  t_dept_manager dm
  join 
  t_departments d on dm.dept_no = d.dept_no
  join
  t_employees ee on ee.emp_no = dm.emp_no
  order by dm.emp_no, calender_year;
  
  SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;

select * from t_departments;
select *  from t_dept_emp;
select min(salary) from t_salaries;
select max(salary) from t_salaries;

drop procedure if exists avg_male_female_salary;

delimiter $$

create procedure avg_male_female_salary(in lower_limit INTEGER, IN upper_limit INTEGER)
BEGIN
   select 
          e.gender, d.dept_name, avg(salary) as salary
	from 
         t_salaries s
           join 
		t_employees e on e.emp_no = s.emp_no
          join
		t_dept_emp de on e.emp_no = de.emp_no
          join
		t_departments d on d.dept_no = de.dept_no
	where salary > lower_limit and salary < upper_limit
group by d.dept_no,e.gender
order by d.dept_no;
end $$

DELIMITER ;

call avg_male_female_salary(40000,90000);

SELECT * FROM t_departments;
select 
          e.gender, d.dept_name, avg(salary) as salary
	from 
         t_salaries s
           join 
		t_employees e on e.emp_no = s.emp_no
          join
		t_dept_emp de on e.emp_no = de.emp_no
          join
		t_departments d on d.dept_no = de.dept_no
	where salary > lower_limit and salary < upper_limit
group by d.dept_no,e.gender
order by d.dept_no;
