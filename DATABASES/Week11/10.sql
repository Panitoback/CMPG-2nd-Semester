set sql_mode = "strict_all_tables"; #any error with respect to accurate data or incorrect datatype will not be accepted, always have it strict

drop database if exists db_jobs;

create database db_jobs;

use db_jobs;

CREATE TABLE tbl_my_contacts (
contact_id INT unsigned auto_increment primary key,
last_name varchar(30) not null,
first_name varchar(20) not null,
phone char(13),
email varchar(50) not null,
gender enum('M','F') Not null,
birthday DATE  not null,
zip char(5) not null
);

drop table if exists tbl_job_current;

create table tbl_job_current(
contact_id int unsigned primary key,
title varchar(30) not null,
salary dec(8,2) unsigned not null,
start_date date not null,

constraint tbl_my_contact_contact_id_fk1
foreign key (contact_id)
references tbl_my_contacts(contact_id)
);

create table tbl_job_desired(
contact_id int unsigned primary key,
title varchar(30),
salary_low dec(8,2) unsigned not null,
salary_high dec(8,2) unsigned not null,
years_exp tinyint unsigned default 0,

constraint b
foreign key (contact_id)
references tbl_my_contacts(contact_id)
);

create table tbl_job_listings(
job_id int unsigned auto_increment primary key,
title varchar(30) not null,
salary dec(8,2) unsigned not null,
zip char(5) not null

);



INSERT INTO tbl_my_contacts(last_name, first_name, phone,email, gender,birthday,zip)

VALUES

('Anderson','Jillian','(555)555-3214','jill_anderson@breakneckpizza.com','F','1980-09-05','12345'),

('Kenton','Leo','(567)565-5514','lkenton@starbuzzcoffee.com','M','1974-01-10','55467'),

('McGavin','Darrin','(678)559-7890',' captainlove@headfirsttheater.com','M','1966-01-23','64578'),

('Franklin','Joe','(578)543-4235','joe_franklin@leapinlimos.com','M','1977-04-28','32456'),

('Hamilton','Jamie','(789)542-3768','dontbother@starbuzzcoffee.com','F','1964-09-10','55467'),

('Chevrolet','Maurice','(235)521-3344','bookman4u@objectville.net','M','1962-07-01','25790'),

('Kroger','Renee','(556)546-1234','poorrenee@mightygumball.net','F','1976-12-03','55467'),

('Mendoza','Angelina','(545)523-3456','angelina@starbuzzcoffee.com','F','1979-08-19','77567'),

('Murphy','Donald','(225)325-3544','padraic@tikibeanlounge.com','M','1967-01-23','12345'),

('Spatner','John','(550)125-1114','jpoet@objectville.net','M','1963-04-18','34125');







INSERT INTO tbl_job_current

VALUES

(1,'Technical Writer',80000.00,'2010-01-01'),

(2,'Manager',110000.00,'2000-05-31'),

(3,'Web Designer',75000.00,'1986-05-05'),

(4,'Software Sales',60000.00,'2003-06-19'),

(5,'System Administrator',120000.00, '1990-01-01'),

(6,'Bookshop Owner',90000.00,'1992-07-18'),

(8,'UNIX Sysadmin',110000.00,'2005-10-10'),

(9,'Baker',80000.00,'1987-10-26');





INSERT INTO tbl_job_desired

VALUES

(7,'Computer Programmer',80000.00, 100000.00,10),

(8,'Computer Programmer',90000.00, 150000.00,10),

(4,'Sales Manager',75000.00, 85000.00, 11),

(10,'Baker',60000.00, 70000.00, 2),

(9,'Chef', 90000.00, 100000, 20);





INSERT INTO tbl_job_listings(title, salary, zip)

VALUES

('Baker', 60000.00,'12345'),

('Clown',50000.00,'34625'),

('Dog Trainer',55000.00,'14624'),

('Hairdresser',70000.00,'67435'),

('Jeweler',66000.00,'45231'),

('Lawyer', 100000.00, '24675'),

('Mechanic',55000.00,'67890'),

('Neurosurgeon',150000.00,'34125'),

('Web Designer',95000.00,'64578'),

('Teacher',60000.00,'25790'),

('Salesman',60000.00,'55467'),

('Artist',67000.00,'46890'),

('Computer Programmer',75000.00,'12345'),

('Manager', 80000.00,'32587');



select * from tbl_job_current;


#---select all position(title)
#union
select title from tbl_job_current
union
select title from tbl_job_desired
union
select title from tbl_job_listings;

#show the job titles that are common in the tables: tbl_job_desired and tbl_job_listings.
select  tbl_job_desired.title
from tbl_job_desired inner join tbl_job_listings
where trim (tbl_job_desired.title) = trim (tbl_job_listings.title);

#automatically inner join
select  tbl_job_desired.title
from tbl_job_desired, tbl_job_listings
where trim (tbl_job_desired.title) = trim (tbl_job_listings.title);

select  tbl_job_desired.title
from tbl_job_desired inner join tbl_job_listings
using (title);

#alias 
select td.title
from tbl_job_desired jd inner join tbl_job_listings jl
where trim (jd.title) = trim (jl.title);

#left outer join
select * from tbl_job_desired jd left outer join tbl_job_listings jl
on jd.title = jl.title
where job_id is not null;

#right outer join
select * from tbl_job_desired jd right outer join tbl_job_listings jl
on jd.title = jl.title
where contact_id is not null;

select * from tbl_job_desired jd right outer join tbl_job_listings jl
on trim(jd.title) = trim(jl.title)
where contact_id is not null;


#different because postions of columns are switched 
select * from tbl_job_listings jl right outer join tbl_job_desired jd
on jl.title = jd.title
where contact_id is not null;


#show titles that are in the jd title but not found in the 
#table using subquery:

select title 
from tbl_job_desired
where title not in (select title from tbl_job_listings);