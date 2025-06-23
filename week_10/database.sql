CREATE TABLE Customer (
    Cid INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Dealer (
    Did INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Product (
    Pid INT PRIMARY KEY,
    Label VARCHAR(50)
);

CREATE TABLE Offers (
    Did INT,
    Pid INT,
    PRIMARY KEY (Did, Pid),
    FOREIGN KEY (Did) REFERENCES Dealer(Did),
    FOREIGN KEY (Pid) REFERENCES Product(Pid)
);

CREATE TABLE Orders (
    Oid INT PRIMARY KEY,
    Did INT,
    Date DATE,
    Cid INT,
    FOREIGN KEY (Did) REFERENCES Dealer(Did),
    FOREIGN KEY (Cid) REFERENCES Customer(Cid)
);

CREATE TABLE Line_Item (
    Oid INT,
    Pid INT,
    Amount INT,
    PRIMARY KEY (Oid, Pid),
    FOREIGN KEY (Oid) REFERENCES Orders(Oid),
    FOREIGN KEY (Pid) REFERENCES Product(Pid)
);



-- Customer
INSERT INTO Customer (Cid, Name) VALUES
(13, 'M.Mueller'),
(17, 'A.Meier'),
(23, 'I.Schulze');

-- Dealer
INSERT INTO Dealer (Did, Name) VALUES
(5, 'G.Hals'),
(7, 'P.Schmidt'),
(11, 'E.Meier'),
(13, 'E.Mueller');

-- Product
INSERT INTO Product (Pid, Label) VALUES
(45, 'Power adapter'),
(57, 'Cat5 cable'),
(67, 'Mainboard');

-- Offers
INSERT INTO Offers (Did, Pid) VALUES
(5, 45),
(5, 57),
(7, 67),
(7, 45),
(11, 57),
(11, 67);

-- Orders
INSERT INTO Orders (Oid, Did, Date, Cid) VALUES
(3, 7, '2002-12-01', 17),
(5, 11, '2003-04-27', 23),
(7, 5, '2003-05-13', 17),
(10, 5, '2003-09-01', 13);

-- Line_Item
INSERT INTO Line_Item (Oid, Pid, Amount) VALUES
(3, 45, 1),
(3, 67, 5),
(5, 67, 1),
(7, 57, 3),
(7, 67, 2),
(10, 57, 5),
(10, 67, 3);
