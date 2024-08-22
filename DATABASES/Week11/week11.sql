use db_jobs;

select * from tbl_job_current;

-- Select the full name of all the employees who are looking for a job 
-- listed in the job_desired_table

SELECT CONCAT_WS (' ' , MC.first_name, MC.last_name) 'Name', MC.phone AS 'Phone Number'
FROM tbl_my_contacts MC INNER JOIN tbl_job_desired JD
ON MC.contact_id = JD.contact_id;

SELECT CONCAT_WS (' ' , MC.first_name, MC.last_name) 'Name', MC.phone AS 'Phone Number'
FROM tbl_my_contacts MC INNER JOIN tbl_job_desired JD
WHERE MC.contact_id = JD.contact_id;

SELECT CONCAT_WS (' ' , MC.first_name, MC.last_name) 'Name', MC.phone AS 'Phone Number'
FROM tbl_my_contacts MC INNER JOIN tbl_job_desired JD
USING (contact_id);

-- NATURAL JOIN: Exactly as INNER JOIN but it detects automatically
SELECT CONCAT_WS(' ', MC.first_name, MC.last_name) 'Name', MC.phone 'Phone Number'
FROM tbl_my_contacts MC NATURAL JOIN tbl_job_desired JD;

SELECT CONCAT_WS(' ', MC.first_name, MC.last_name) 'Name' , MC.phone 'Phone Number'
FROM tbl_my_contacts MC, tbl_job_desired JD
WHERE MC.contact_id = JD.contact_id;

-- USING LEFT OUTER JOIN:
SELECT CONCAT_WS(' ', MC.first_name, MC.last_name) 'Name', MC.phone 'Phone Number'
FROM tbl_my_contacts MC LEFT OUTER JOIN tbl_job_desired JD
ON MC.contact_id = JD.contact_id
WHERE JD.contact_id IS NOT NULL;

SELECT CONCAT_WS(' ', MC.contact_id, MC.first_name, MC.last_name) 'Name', MC.phone 'Phone Number'
FROM tbl_my_contacts MC
WHERE contact_id IN (select contact_id from tbl_job_desired);

SELECT CONCAT_WS(' ', MC.contact_id, MC.first_name, MC.last_name) 'Name', MC.phone 'Phone Number'
FROM tbl_my_contacts MC
WHERE contact_id NOT IN (select contact_id from tbl_job_desired);

SELECT contact_id 'ID'
FROM tbl_job_desired jd LEFT JOIN tbl_job_listings jl
ON jd.title = jl.title;

SELECT CONCAT_WS(' ', MC.contact_id, MC.first_name, MC.last_name) 'Name', MC.phone 'Phone Number'
from tbl_my_contacts MC
where contact_id IN(
select contact_id
from tbl_job_desired
where trim(title) IN(
select trim(title) from tbl_job_listings));

-- Select the full name and email of all the employees
-- who are interested in a computer programmer job 
-- And ready to accept a salary starting from 90k

SELECT CONCAT_WS(' ', MC.contact_id, MC.first_name, MC.last_name) 'Name', MC.email 'Email'
FROM tbl_my_contacts MC INNER JOIN tbl_job_desired JD;

SELECT MC.first_name 'NAME' , MC.email 'Email'
FROM tbl_my_contacts MC INNER JOIN tbl_job_desired JD
ON MC.contact_id = JD.contact_id
WHERE trim(JD.title) = 'Computer Programmer'
AND JD.Salary_low >= 90000;

SELECT MC.first_name 'NAME' , MC.email 'Email'
FROM tbl_my_contacts MC LEFT OUTER JOIN tbl_job_desired JD
ON MC.contact_id = JD.contact_id
WHERE trim(JD.title) = 'Computer Programmer'
AND JD.Salary_low >= 90000;

SELECT MC.first_name 'NAME' , MC.email 'Email'
FROM tbl_my_contacts MC RIGHT OUTER JOIN tbl_job_desired JD
ON MC.contact_id = JD.contact_id
WHERE trim(JD.title) = 'Computer Programmer'
AND JD.Salary_low >= 90000;

SELECT CONCAT_WS(' ', MC.contact_id, MC.first_name, MC.last_name) 'Name', MC.email 'Email'
FROM tbl_my_contacts MC RIGHT OUTER JOIN tbl_job_desired JD
ON MC.contact_id = JD.contact_id
WHERE trim(JD.title) = 'Computer Programmer'
AND JD.Salary_low >= 90000;

-- List(title/s) for jobs who earn salary equal to the ghighest salary in the job_current_table
select JL.title
from tbl_job_listings JL
where salary = (SELECT MAX(salary) from tbl_job_listings);

-- Who makes the most money out of all employees. Display their first and last name with the salary
-- JOIN and subquery

SELECT CONCAT_WS(' ', MC.contact_id, MC.first_name, MC.last_name) 'Name', JC.salary 'Salary'
from tbl_my_contacts MC right join tbl_job_current JC
using (contact_id)
where salary = @maximum_salary;

SET @maximum_salary = (select MAX(salary) from tbl_job_current);




