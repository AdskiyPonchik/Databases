1. 

```sql
a) select name, salary from employee where salary > 6450;
b) SELECT name, salary FROM employee WHERE salary < 6000 OR salary > 10000;
c) SELECT * FROM plane WHERE type = 'A-340' OR type = 'TRIDENT' ORDER BY purchase_date;
d) 
SELECT e.name FROM pilot p JOIN employee e ON p.employee_ID = e.ID WHERE p.license NOT IN ('I', 'II');
e)select name from employee where substring(name, 3, 1)='A';
f)SELECT name FROM employee WHERE LENGTH(name) - LENGTH(REPLACE(name, 'L', '')) >= 2;
g) SELECT name, job, salary
FROM employee
WHERE (job = 'Dipl.-Ing.' OR job = 'steward/-ess') AND salary >= 6000;

```

2. 
```sql
a) SELECT ID AS employee_ID, name, salary, CAST(salary * 1.15 AS INT) AS new_salary FROM employee;a
b)SELECT ID AS employee_ID, name, salary, CAST(salary * 1.15 AS INT) AS new_salary, 
cast(salary*1.15 as INT)-salary as difference FROM employee;
c)

MySql:
SELECT 
    type,
    serial_number,
    DATEDIFF(CURDATE(), purchase_date) AS operating_hours
FROM plane
ORDER BY operating_hours;

postgresql:
SELECT 
    type,
    serial_number,
    (CURRENT_DATE - purchase_date) AS operating_hours
FROM plane
ORDER BY operating_hours;


d)SELECT 
    name || ' earns ' || salary || ' per month, but desires to earn ' || (salary * 3) AS desired_salary
FROM employee;

e)select upper(substr(type, 1,1))||lower(substr(type, 2)) as name,
length(type) as length from plane_type;
```
3.
```sql
a)select count(*) as number_of_planes from departure;
b)select count(*) as employes from employee where job like'%Dr.%' OR job LIKE '%PhD%';
c)select job, avg(salary) as average_job from employee group by job;
d)select sum(price) as total_price, count(*) as number_of_bookings from
booking where flight_date>='1993-01-01' and flight_date<='1993-12-31';
e)SELECT job, MIN(salary) AS minimum_salary
FROM employee
GROUP BY job;
f)SELECT (MAX(salary) - MIN(salary)) AS salary_difference
FROM employee;