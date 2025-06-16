INSERT INTO employee (ID, name, address, job, salary) VALUES
(1, 'Anna Müller', 'Berlin', 'Dipl.-Ing.', 7000),
(2, 'Paul Albrecht', 'Hamburg', 'technician', 5900),
(3, 'Laura Klein', 'Munich', 'steward/-ess', 6100),
(4, 'Karl Lehmann', 'Stuttgart', 'pilot', 11000),
(5, 'Lena Lenz', 'Frankfurt', 'Dipl.-Ing.', 6450),
(6, 'Aliya Laser', 'Dresden', 'pilot', 9600),
(7, 'Lothar Langel', 'Hannover', 'technician', 6400),
(8, 'Albert Lang', 'Köln', 'pilot', 5800);

INSERT INTO pilot (employee_ID, license, flight_hours) VALUES
(4, 'I', 1200),
(6, 'III', 800),
(8, 'IV', 950);


INSERT INTO technician (employee_ID, team_number) VALUES
(2, 1),
(7, 2);

INSERT INTO plane_type (type, manufacturer, number_of_seats, cruising_speed) VALUES
('A-340', 'Airbus', 300, 900),
('TRIDENT', 'Hawker Siddeley', 180, 850),
('BOEING-737', 'Boeing', 200, 870);


INSERT INTO plane (type, serial_number, purchase_date, flight_hours) VALUES
('A-340', 'SN123', '2019-03-01', 5000),
('TRIDENT', 'SN456', '2018-06-15', 6200),
('BOEING-737', 'SN789', '2020-01-20', 4000);


INSERT INTO spare_part (ID, label, price) VALUES
(1, 'Engine Module', 200000),
(2, 'Navigation System', 30000),
(3, 'Hydraulic Pump', 15000);


INSERT INTO requires (type, serial_number, spare_part_ID) VALUES
('A-340', 'SN123', 1),
('A-340', 'SN123', 3),
('TRIDENT', 'SN456', 2),
('BOEING-737', 'SN789', 1);

INSERT INTO can_fly (employee_ID, type) VALUES
(4, 'A-340'),
(6, 'TRIDENT'),
(8, 'BOEING-737');

INSERT INTO can_maintain (employee_ID, type) VALUES
(2, 'A-340'),
(7, 'TRIDENT');

INSERT INTO passenger (passenger_ID, name, address, age) VALUES
(1, 'Max Meier', 'Berlin', 35),
(2, 'Eva Schulz', 'Leipzig', 28),
(3, 'Tom Becker', 'Bremen', 45);

INSERT INTO flight (label, date, destination, flight_time, distance) VALUES
('FL001', '2024-06-15', 'Paris', '02:15:00', 850),
('FL002', '2024-06-16', 'London', '01:45:00', 720),
('FL003', '2024-06-17', 'Rome', '02:30:00', 1050);

INSERT INTO departure (flight_label, flight_date, type, serial_number, captain) VALUES
('FL001', '2024-06-15', 'A-340', 'SN123', 'Karl Lehmann'),
('FL002', '2024-06-16', 'TRIDENT', 'SN456', 'Aliya Laser'),
('FL003', '2024-06-17', 'BOEING-737', 'SN789', 'Albert Lang');

INSERT INTO booking (passenger_ID, flight_label, flight_date, class, seat_number, price) VALUES
(1, 'FL001', '2024-06-15', 'economy', '12A', 250.00),
(2, 'FL002', '2024-06-16', 'business', '3C', 560.00),
(3, 'FL003', '2024-06-17', 'economy', '14F', 230.00);
