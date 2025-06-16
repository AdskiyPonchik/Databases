-- Таблица: flight
CREATE TABLE flight (
    label VARCHAR(20),
    date DATE,
    destination VARCHAR(100),
    flight_time TIME,
    distance INT,
    PRIMARY KEY (label, date)
);

-- Таблица: plane_type
CREATE TABLE plane_type (
    type VARCHAR(30) PRIMARY KEY,
    manufacturer VARCHAR(50),
    number_of_seats INT,
    cruising_speed INT
);

-- Таблица: plane
CREATE TABLE plane (
    type VARCHAR(30),
    serial_number VARCHAR(50),
    purchase_date DATE,
    flight_hours INT,
    PRIMARY KEY (type, serial_number),
    FOREIGN KEY (type) REFERENCES plane_type(type)
);

-- Таблица: departure
CREATE TABLE departure (
    flight_label VARCHAR(20),
    flight_date DATE,
    type VARCHAR(30),
    serial_number VARCHAR(50),
    captain VARCHAR(100),
    PRIMARY KEY (flight_label, flight_date),
    FOREIGN KEY (flight_label, flight_date) REFERENCES flight(label, date),
    FOREIGN KEY (type, serial_number) REFERENCES plane(type, serial_number)
);

-- Таблица: employee
CREATE TABLE employee (
    ID INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    job VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Таблица: passenger
CREATE TABLE passenger (
    passenger_ID INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    age INT
);

-- Таблица: booking
CREATE TABLE booking (
    passenger_ID INT,
    flight_label VARCHAR(20),
    flight_date DATE,
    class VARCHAR(20),
    seat_number VARCHAR(10),
    price DECIMAL(10,2),
    PRIMARY KEY (passenger_ID, flight_label, flight_date),
    FOREIGN KEY (passenger_ID) REFERENCES passenger(passenger_ID),
    FOREIGN KEY (flight_label, flight_date) REFERENCES flight(label, date)
);

-- Таблица: spare_part
CREATE TABLE spare_part (
    ID INT PRIMARY KEY,
    label VARCHAR(100),
    price DECIMAL(10,2)
);

-- Таблица: requires
CREATE TABLE requires (
    type VARCHAR(30),
    serial_number VARCHAR(50),
    spare_part_ID INT,
    PRIMARY KEY (type, serial_number, spare_part_ID),
    FOREIGN KEY (type, serial_number) REFERENCES plane(type, serial_number),
    FOREIGN KEY (spare_part_ID) REFERENCES spare_part(ID)
);

-- Таблица: pilot
CREATE TABLE pilot (
    employee_ID INT PRIMARY KEY,
    license VARCHAR(20),
    flight_hours INT,
    FOREIGN KEY (employee_ID) REFERENCES employee(ID)
);

-- Таблица: technician
CREATE TABLE technician (
    employee_ID INT PRIMARY KEY,
    team_number INT,
    FOREIGN KEY (employee_ID) REFERENCES employee(ID)
);

-- Таблица: can_fly
CREATE TABLE can_fly (
    employee_ID INT,
    type VARCHAR(30),
    PRIMARY KEY (employee_ID, type),
    FOREIGN KEY (employee_ID) REFERENCES pilot(employee_ID),
    FOREIGN KEY (type) REFERENCES plane_type(type)
);

-- Таблица: can_maintain
CREATE TABLE can_maintain (
    employee_ID INT,
    type VARCHAR(30),
    PRIMARY KEY (employee_ID, type),
    FOREIGN KEY (employee_ID) REFERENCES technician(employee_ID),
    FOREIGN KEY (type) REFERENCES plane_type(type)
);
