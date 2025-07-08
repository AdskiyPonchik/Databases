a)
CREATE TABLE Orders (
    Oid INT PRIMARY KEY,
    Did INT,
    Date DATE,
    Cid INT,
    FOREIGN KEY (Did) REFERENCES Dealer(Did),
    FOREIGN KEY (Cid) REFERENCES Customer(Cid)
);


b)
SELECT c.Cid, c.Name, p.Pid, p.Label
FROM Customer c, Product p
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    JOIN LineItem l ON o.Oid = l.Oid
    WHERE o.Cid = c.Cid AND l.Pid = p.Pid
);

c)
SELECT DISTINCT o1.Cid AS Customer1, o2.Cid AS Customer2
FROM Orders o1
JOIN LineItem l1 ON o1.Oid = l1.Oid
JOIN LineItem l2 ON l1.Pid = l2.Pid
JOIN Orders o2 ON l2.Oid = o2.Oid
WHERE o1.Cid < o2.Cid;

d)
SELECT o.Did
FROM Offers o
GROUP BY o.Did
HAVING COUNT(DISTINCT o.Pid) = (
    SELECT COUNT(DISTINCT l.Pid)
    FROM LineItem l
);

e)
SELECT o.Did
FROM Offers o
WHERE o.Pid IN (
    SELECT l.Pid
    FROM Orders ord
    JOIN LineItem l ON ord.Oid = l.Oid
    WHERE ord.Cid = 23
)
GROUP BY o.Did
HAVING COUNT(DISTINCT o.Pid) >= (
    SELECT COUNT(DISTINCT l.Pid)
    FROM Orders ord
    JOIN LineItem l ON ord.Oid = l.Oid
    WHERE ord.Cid = 23
);

f)

SELECT o.Did
FROM Offers o
GROUP BY o.Did
HAVING COUNT(DISTINCT o.Pid) = (SELECT COUNT(*) FROM Product)
LIMIT 1;

INSERT INTO Orders (Oid, Did, Date, Cid)
VALUES (99, 5, CURRENT_DATE, 17);

INSERT INTO LineItem (Oid, Pid, Amount)
SELECT 99, p.Pid, 1
FROM Product p;
