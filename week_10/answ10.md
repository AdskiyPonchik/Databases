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
START WITH Name = 'Paul Meier'
CONNECT BY PRIOR Manager = Id
AND Name != PRIOR Name;
```