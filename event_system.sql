create database event;
use event;
-- EVENT TABLE CREATION--

CREATE TABLE Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(100),
    EventDate DATETIME,
    Location VARCHAR(200),
    TotalSeats INT,
    TicketPrice DECIMAL(10, 2),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TICKET TABLE CREATION--

CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT,
    TicketType VARCHAR(50), 
    Price DECIMAL(10, 2),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- CUSTOMERS TABLE CREATION--

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    RegisteredAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- RESERVATIONS  TABLE CREATION--

CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    EventID INT,
    ReservedSeats INT,
    ReservationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- SALES TABLE CREATION--

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    ReservationID INT,
    TicketID INT,
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    SaleDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID),
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
);

-- VALUE INSERTION IN CATEGORIES TABLE --

INSERT INTO Events (EventName, EventDate, Location, TotalSeats, TicketPrice)
VALUES 
('Concert 2024', '2024-05-01 19:00:00', 'Arena 1', 500, 50.00),
('Festival 2024', '2024-06-10 15:00:00', 'Open Grounds', 1000, 30.00),
('Art Exhibit', '2024-07-05 10:00:00', 'City Gallery', 200, 15.00),
('Comedy Night', '2024-08-15 20:00:00', 'Downtown Club', 150, 25.00),
('Tech Summit', '2024-09-20 09:00:00', 'Convention Center', 800, 120.00),
('Play Premiere', '2024-10-10 18:00:00', 'Grand Theater', 300, 40.00),
('Music Fest', '2024-11-25 12:00:00', 'Central Park', 2000, 20.00);
     
     -- VALUE INSERTION IN TICKETS--
    
INSERT INTO Ticket (EventID, TicketType, Price)
VALUES (1, 'VIP', 100.00),
       (1, 'General', 50.00),
       (1, 'Balcony', 30.00);
       
  -- VALUE INSERTION IN  CUSTOMERS--     
INSERT INTO Customers (FullName, Email, PhoneNumber)
VALUES 
('Arun', 'arun@example.com','123-456-7890'),
('Balaji','balaji@example.com','234-567-8901'),
('Jeys', 'jeys@example.com','345-678-9012'),
('Divya','divya@example.com','456-789-0123'),
('Erlin','erlin@example.com','567-890-1234'),
('Gowtham','gowtham@example.com','678-901-2345'),
('Ashok','ashok@example.com','789-012-3456'),
('Henry','henry@example.com','890-123-4567'),
('Yogi','yogii@example.com','901-234-5678'),
('Viji','vijii@example.com','912-345-6789');
  
  -- VALUE INSERTION IN RESERVATIONS-- 
INSERT INTO Reservations (CustomerID, EventID, ReservedSeats)
VALUES 
(1, 1, 2),
(2, 1, 3),
(3, 2, 1),
(4, 2, 2),
(5, 3, 4),
(6, 4, 1),
(7, 5, 2);

-- VALUE INSERTION IN SALES--
INSERT INTO Sales (ReservationID, TicketID, Quantity, TotalPrice)
VALUES 
    (1, 1, 2, 200), 
    (2, 2, 3, 150), 
    (3, 3, 1, 30),  
    (4, 1, 4, 400), 
    (5, 2, 5, 250), 
    (6, 3, 2, 60),
    (7, 1, 6, 600), 
    (8, 2, 7, 350), 
    (9, 3, 3, 90),  
    (10, 1, 1, 100),
    (11, 2, 4, 200),
    (12, 3, 2, 60); 

-- TO RETRIVE ALL THE TABLES--
SELECT  * FROM EVENTS;
SELECT * FROM TICKET;
SELECT * FROM CUSTOMERS;
SELECT * FROM  RESERVATIONS;
SELECT * FROM SALES;

-- WHERE Clause 
-- get events happening at "city gallery"
SELECT * FROM Events
WHERE Location = 'city gallery';

--  ORDER BY 
-- List tickets sorted by price in descending order
SELECT * FROM Ticket
ORDER BY Price DESC;

-- GROUP BY with Aggregate Functions
-- Get total revenue for each ticket type.
SELECT TicketType, SUM(TotalPrice) AS TotalRevenue
FROM Sales S
JOIN Ticket T ON S.TicketID = T.TicketID
GROUP BY TicketType;

-- join
-- Retrieve all reservations with customer and event details.
SELECT R.ReservationID, C.FullName, E.EventName, R.ReservedSeats
FROM Reservations R
JOIN Customers C ON R.CustomerID = C.CustomerID
JOIN Events E ON R.EventID = E.EventID;

-- left join
-- Get all customers, including those without reservations.
SELECT C.CustomerID, C.FullName, R.ReservationID
FROM Customers C
LEFT JOIN Reservations R ON C.CustomerID = R.CustomerID;

-- INNER JOIN
-- Get sales data with ticket and event details.
SELECT S.SaleID, T.TicketType, E.EventName, S.TotalPrice
FROM Sales S
JOIN Ticket T ON S.TicketID = T.TicketID
JOIN Events E ON T.EventID = E.EventID;

-- Distinct
-- Query Customers Who Reserved Tickets
SELECT DISTINCT C.FullName, C.Email
FROM Customers C
JOIN Reservations R ON C.CustomerID = R.CustomerID;

-- create a View
-- Create a view to display all reservations with event details.
CREATE VIEW ReservationDetails AS
SELECT R.ReservationID, C.FullName, E.EventName, R.ReservedSeats, R.ReservationDate
FROM Reservations R
JOIN Customers C ON R.CustomerID = C.CustomerID
JOIN Events E ON R.EventID = E.EventID;

-- Query the View
SELECT * FROM ReservationDetails;


-- Stored Procedures
-- Calculate Total Sales for a Ticket Type

DELIMITER //

CREATE PROCEDURE GetTotalSales(IN TicketType VARCHAR(50))
BEGIN
    SELECT T.TicketType, SUM(S.TotalPrice) AS TotalRevenue
    FROM Sales S
    JOIN Ticket T ON S.TicketID = T.TicketID
    WHERE T.TicketType = TicketType
    GROUP BY T.TicketType;
END //

DELIMITER ;




