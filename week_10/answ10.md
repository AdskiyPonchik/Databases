1.
```sql
a)select name from customer;
b)select * from Orders o join Customer c on o.Cid=c.Cid where name like '%Meier%';
c)select * from product where pid not in(
select li.Pid from line_item li join orders o on li.oid=o.oid 
where o.date='2003-05-13'
);
d)select distinct * from product p
join line_item li on p.pid=li.pid
join Orders o on o.oid = li.oid
join Dealer d on d.Did=o.Did
join Customer c on c.Cid=o.Cid
where d.name='E.Meier' and c.name='I.Schulze';
e)select * from product p where p.Pid in
(
	select li.Pid from line_item li join Orders o on li.Oid=o.Oid
	join Dealer d on o.Did=d.Did
	where d.name='E.Meier'
) and p.Pid in (
	select li.pid from line_item li join Orders o on o.oid=li.oid
	join Customer c on c.cid=o.cid
	where c.name='I.Schulze'
);
```
2.
```sql
a)
SELECT p.Label
FROM Product p
JOIN Line_Item li ON p.Pid = li.Pid
GROUP BY p.Pid, p.Label
HAVING SUM(li.Amount) > 2;
b)select c.name from Customer c 
left join Orders o on c.Cid=o.cid
where o.Oid is null
c)
select d.name as DealerName, p.label as ProductNotOffered
from Dealer d cross join Product p --actually decart multiply
where(d.Did, p.Pid) not in(select Did, Pid from Offers)

d)
SELECT p.Label, SUM(li.Amount) AS SalesPerProduct
FROM Product p
JOIN Line_Item li ON p.Pid = li.Pid
GROUP BY p.label
ORDER BY SalesPerProduct DESC;
e)
SELECT d.Name AS DealerName, o.Oid, o.Date, o.Cid
FROM Dealer d
LEFT JOIN Orders o ON d.Did = o.Did;
```
3.
```sql
Convert the SQL schema into an ER-schema
```

4.
a)
Recursive SQL is needed when we need to work with hierarchical structures where one row can refer to another - like employee to manager, manager to superior manager, etc.

Applications:
Management hierarchies (as in this task)
Catalogs/subdirectories
Graph structures
Family trees
```sql
b)SELECT Name
FROM Employees
WHERE Id IN (
    SELECT Manager
    FROM Employees
    WHERE Name = 'Paul Meier'
);

c)
SELECT Name
FROM Employees
START WITH Name = 'Paul Meier' --where to start
CONNECT BY PRIOR Id = Manager --who is who's boss
```
5.
```sql
a)
CREATE VIEW cs_faculty_view AS
SELECT *
FROM exams
WHERE course_of_studies = 'computerscience';

b)
create view examination_office_view as
select * from exams;

c)
CREATE VIEW scholarship_commission_view AS
SELECT student, AVG(mark) AS avg_mark
FROM exams
GROUP BY student;

d)
CREATE VIEW dean_statistical_view AS
SELECT course_of_studies, course, date, mark
FROM exams
WHERE date >= current_date - interval '1 year'
  AND date < current_date;
```
6.
```sql
a)
select o.date, o.orders, v.value
from orders o
join values v on o.date=v.date;

b)SELECT o.Date AS Order_Date, o.Orders, v.Date AS Value_Date, v.Value
FROM Orders o
JOIN Values v ON o.Date > v.Date;

C)
| Date       | Orders     |
| ---------- | ---------- |
| 02.09.2003 | Furniture  |
| 23.06.2004 | Vegetables |
| 01.12.2005 | Pots       |

```
7.
In R ÷ S remain those Names for which there are all Product from S
1.
Meier
West

2.
Meier
Mueller
Schmidt

3.
Schmidt
