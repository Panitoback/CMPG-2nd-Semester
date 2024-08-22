use sample;

select*
from project
where PRSTAFF > 3;

select PROJNO, RESPEMP, PRSTDATE, PRENDATE
from project
where PRSTDATE and PRENDATE > '2002-01-01';
-- where '2002-07-01' between PRSTDATE and PRENDATE;

select*
 from employee 
 where length(TRIM(JOB)) = 5;
 
  select EMPNO, CONCAT(FIRSTNME, ' ', LASTNAME) AS FULLNAME
 from employee;
 
 select EMPNO, SUBSTRING(FIRSTNME, 1, 4) AS First_four, SUBSTRING(LASTNAME, 2) AS From_Second_Ch
 from employee;
 
 select EMPNO, year(HIREDATE) as Hiring_Date, month(BIRTHDATE) as Day_Birth
from employee;

SET SQL_SAFE_UPDATES = 0;
update employee
set LASTNAME = 'SMITH';
