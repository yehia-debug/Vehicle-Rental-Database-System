CREATE DATABASE publictransportdb;
USE publictransportdb;

CREATE TABLE Passenger (
    Passenger_ID INT NOT NULL,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Date_Of_Birth DATE,
    Gender VARCHAR(10),
    PRIMARY KEY (Passenger_ID)
);
CREATE TABLE User_Account (
    User_ID INT NOT NULL,
    Passenger_ID INT,
    Username VARCHAR(50),
    Password_Hash VARCHAR(255),
    User_Role VARCHAR(20),
    Created_At DATETIME,
    PRIMARY KEY (User_ID)
);
CREATE TABLE Station (
    Station_ID INT NOT NULL,
    Station_Name VARCHAR(100),
    City VARCHAR(50),
    Location VARCHAR(150),
    Station_Type VARCHAR(20),
    PRIMARY KEY (Station_ID)
);
CREATE TABLE Vehicle (
    Vehicle_ID INT NOT NULL,
    Vehicle_Number VARCHAR(30),
    Vehicle_Type VARCHAR(20),
    Capacity INT,
    Vehicle_Status VARCHAR(20),
    PRIMARY KEY (Vehicle_ID)
);
CREATE TABLE Route (
    Route_ID INT NOT NULL,
    Route_Name VARCHAR(100),
    Start_Station_ID INT,
    End_Station_ID INT,
    Distance_KM DECIMAL(6,2),
    Base_Fare DECIMAL(6,2),
    Route_Status VARCHAR(20),
    PRIMARY KEY (Route_ID)
);
CREATE TABLE Route_Stop (
    Route_Stop_ID INT NOT NULL,
    Route_ID INT,
    Station_ID INT,
    Stop_Order INT,
    Distance_From_Start_KM DECIMAL(6,2),
    PRIMARY KEY (Route_Stop_ID)
);
CREATE TABLE Schedule (
    Schedule_ID INT NOT NULL,
    Route_ID INT,
    Vehicle_ID INT,
    Departure_Time TIME,
    Arrival_Time TIME,
    Travel_Date DATE,
    Available_Seats INT,
    Schedule_Status VARCHAR(20),
    PRIMARY KEY (Schedule_ID)
);
CREATE TABLE Ticket (
    Ticket_ID INT NOT NULL,
    Passenger_ID INT,
    Schedule_ID INT,
    Seat_Number INT,
    Booking_Date DATETIME,
    Fare_Amount DECIMAL(6,2),
    Ticket_Status VARCHAR(20),
    PRIMARY KEY (Ticket_ID)
);
CREATE TABLE Payment (
    Payment_ID INT NOT NULL,
    Ticket_ID INT,
    Payment_Method VARCHAR(30),
    Payment_Amount DECIMAL(6,2),
    Payment_Date DATETIME,
    Payment_Status VARCHAR(20),
    PRIMARY KEY (Payment_ID)
);

ALTER TABLE User_Account
ADD FOREIGN KEY (Passenger_ID)
REFERENCES Passenger(Passenger_ID);



ALTER TABLE Route
ADD FOREIGN KEY (Start_Station_ID)
REFERENCES Station(Station_ID);


ALTER TABLE Route
ADD FOREIGN KEY (End_Station_ID)
REFERENCES Station(Station_ID);

ALTER TABLE Route_Stop
ADD FOREIGN KEY (Route_ID)
REFERENCES Route(Route_ID);

ALTER TABLE Route_Stop
ADD FOREIGN KEY (Station_ID)
REFERENCES Station(Station_ID);

ALTER TABLE Schedule
ADD FOREIGN KEY (Route_ID)
REFERENCES Route(Route_ID);


ALTER TABLE Schedule
ADD FOREIGN KEY (Vehicle_ID)
REFERENCES Vehicle(Vehicle_ID);

ALTER TABLE Ticket
ADD FOREIGN KEY (Passenger_ID)
REFERENCES Passenger(Passenger_ID);

ALTER TABLE Ticket
ADD FOREIGN KEY (Schedule_ID)
REFERENCES Schedule(Schedule_ID);


ALTER TABLE Payment
ADD FOREIGN KEY (Ticket_ID)
REFERENCES Ticket(Ticket_ID);



USE publictransportdb;

INSERT INTO Passenger VALUES
(1, 'Ahmed', 'Ali', 'ahmed.ali@email.com', '01011111111', '2002-05-14', 'Male'),
(2, 'Sara', 'Mohamed', 'sara.mohamed@email.com', '01022222222', '2003-03-20', 'Female'),
(3, 'Omar', 'Hassan', 'omar.hassan@email.com', '01033333333', '2001-11-10', 'Male'),
(4, 'Mona', 'Ibrahim', 'mona.ibrahim@email.com', '01044444444', '2002-07-25', 'Female'),
(5, 'Youssef', 'Khaled', 'youssef.khaled@email.com', '01055555555', '2000-09-12', 'Male'),
(6, 'Nour', 'Adel', 'nour.adel@email.com', '01066666666', '2004-01-30', 'Female'),
(7, 'Kareem', 'Samir', 'kareem.samir@email.com', '01077777777', '2001-06-18', 'Male'),
(8, 'Laila', 'Mostafa', 'laila.mostafa@email.com', '01088888888', '2003-12-05', 'Female'),
(9, 'Hana', 'Tarek', 'hana.tarek@email.com', '01099999999', '2002-10-09', 'Female'),
(10, 'Mahmoud', 'Fathy', 'mahmoud.fathy@email.com', '01111111111', '2000-04-22', 'Male'),
(11, 'Ali', 'Nasser', 'ali.nasser@email.com', '01122222222', '2001-08-13', 'Male'),
(12, 'Farah', 'Magdy', 'farah.magdy@email.com', '01133333333', '2003-02-17', 'Female'),
(13, 'Hossam', 'Reda', 'hossam.reda@email.com', '01144444444', '2002-06-01', 'Male'),
(14, 'Dina', 'Ashraf', 'dina.ashraf@email.com', '01155555555', '2004-09-19', 'Female'),
(15, 'Tamer', 'Said', 'tamer.said@email.com', '01166666666', '2001-03-29', 'Male'),
(16, 'Reem', 'Wael', 'reem.wael@email.com', '01177777777', '2002-12-11', 'Female'),
(17, 'Mostafa', 'Gamal', 'mostafa.gamal@email.com', '01188888888', '2000-05-07', 'Male'),
(18, 'Salma', 'Sherif', 'salma.sherif@email.com', '01199999999', '2003-07-14', 'Female'),
(19, 'Hany', 'Ezz', 'hany.ezz@email.com', '01211111111', '2002-01-21', 'Male'),
(20, 'Nada', 'Ramy', 'nada.ramy@email.com', '01222222222', '2004-11-03', 'Female'),
(21, 'Mariam', 'Sameh', 'mariam.sameh@email.com', '01233333333', '2002-08-08', 'Female'),
(22, 'Adham', 'Nabil', 'adham.nabil@email.com', '01244444444', '2001-10-16', 'Male'),
(23, 'Jana', 'Ayman', 'jana.ayman@email.com', '01255555555', '2003-04-04', 'Female'),
(24, 'Seif', 'Osama', 'seif.osama@email.com', '01266666666', '2000-12-23', 'Male'),
(25, 'Malak', 'Hesham', 'malak.hesham@email.com', '01277777777', '2004-06-15', 'Female'),
(26, 'Amr', 'Salah', 'amr.salah@email.com', '01288888888', '2001-02-02', 'Male'),
(27, 'Yara', 'Kamal', 'yara.kamal@email.com', '01299999999', '2003-09-09', 'Female'),
(28, 'Fady', 'Waheed', 'fady.waheed@email.com', '01511111111', '2000-03-13', 'Male'),
(29, 'Rana', 'Essam', 'rana.essam@email.com', '01522222222', '2002-07-07', 'Female'),
(30, 'Karim', 'Atef', 'karim.atef@email.com', '01533333333', '2001-05-19', 'Male');

INSERT INTO User_Account VALUES
(1, 1, 'ahmedali', 'pass123', 'Regular_User', '2026-04-01 10:00:00'),
(2, 2, 'saramohamed', 'pass123', 'Regular_User', '2026-04-01 10:05:00'),
(3, 3, 'omarhassan', 'pass123', 'Regular_User', '2026-04-01 10:10:00'),
(4, 4, 'monaibrahim', 'pass123', 'Regular_User', '2026-04-01 10:15:00'),
(5, 5, 'youssefkhaled', 'pass123', 'Regular_User', '2026-04-01 10:20:00'),
(6, 6, 'nouradel', 'pass123', 'Regular_User', '2026-04-01 10:25:00'),
(7, 7, 'kareemsamir', 'pass123', 'Regular_User', '2026-04-01 10:30:00'),
(8, 8, 'lailamostafa', 'pass123', 'Regular_User', '2026-04-01 10:35:00'),
(9, 9, 'hanatarek', 'pass123', 'Regular_User', '2026-04-01 10:40:00'),
(10, 10, 'mahmoudfathy', 'pass123', 'Regular_User', '2026-04-01 10:45:00'),
(11, 11, 'alinasser', 'pass123', 'Regular_User', '2026-04-01 10:50:00'),
(12, 12, 'farahmagdy', 'pass123', 'Regular_User', '2026-04-01 10:55:00'),
(13, 13, 'hossamreda', 'pass123', 'Regular_User', '2026-04-01 11:00:00'),
(14, 14, 'dinaashraf', 'pass123', 'Regular_User', '2026-04-01 11:05:00'),
(15, 15, 'tamersaid', 'pass123', 'Regular_User', '2026-04-01 11:10:00'),
(16, 16, 'reemwael', 'pass123', 'Regular_User', '2026-04-01 11:15:00'),
(17, 17, 'mostafagamal', 'pass123', 'Regular_User', '2026-04-01 11:20:00'),
(18, 18, 'salmasherif', 'pass123', 'Regular_User', '2026-04-01 11:25:00'),
(19, 19, 'hanyezz', 'pass123', 'Regular_User', '2026-04-01 11:30:00'),
(20, 20, 'nadaramy', 'pass123', 'Regular_User', '2026-04-01 11:35:00'),
(21, 21, 'mariamsameh', 'pass123', 'Regular_User', '2026-04-01 11:40:00'),
(22, 22, 'adhamnabil', 'pass123', 'Regular_User', '2026-04-01 11:45:00'),
(23, 23, 'janaayman', 'pass123', 'Regular_User', '2026-04-01 11:50:00'),
(24, 24, 'seifosama', 'pass123', 'Regular_User', '2026-04-01 11:55:00'),
(25, 25, 'malakhesham', 'pass123', 'Regular_User', '2026-04-01 12:00:00'),
(26, 26, 'amrsalah', 'pass123', 'Regular_User', '2026-04-01 12:05:00'),
(27, 27, 'yarakamal', 'pass123', 'Regular_User', '2026-04-01 12:10:00'),
(28, 28, 'fadywaheed', 'pass123', 'Regular_User', '2026-04-01 12:15:00'),
(29, 29, 'ranaessam', 'pass123', 'Regular_User', '2026-04-01 12:20:00'),
(30, 30, 'karimatef', 'pass123', 'Regular_User', '2026-04-01 12:25:00'),
(31, NULL, 'adminuser', 'admin123', 'Admin', '2026-04-01 12:30:00');

INSERT INTO Station VALUES
(1, 'Cairo Central Station', 'Cairo', 'Ramses Square', 'Train'),
(2, 'Giza Station', 'Giza', 'Giza Square', 'Train'),
(3, 'Nasr City Station', 'Cairo', 'Nasr City', 'Bus'),
(4, 'Maadi Station', 'Cairo', 'Maadi', 'Metro'),
(5, 'Helwan Station', 'Cairo', 'Helwan', 'Metro'),
(6, 'Dokki Station', 'Giza', 'Dokki', 'Metro'),
(7, 'October Station', 'Giza', '6th October', 'Bus'),
(8, 'New Cairo Station', 'Cairo', 'New Cairo', 'Bus'),
(9, 'Alexandria Station', 'Alexandria', 'Misr Station', 'Train'),
(10, 'Tanta Station', 'Gharbia', 'Tanta City', 'Train'),
(11, 'Mansoura Station', 'Dakahlia', 'Mansoura City', 'Train'),
(12, 'Zagazig Station', 'Sharqia', 'Zagazig City', 'Train'),
(13, 'Ismailia Station', 'Ismailia', 'Ismailia City', 'Train'),
(14, 'Suez Station', 'Suez', 'Suez City', 'Bus'),
(15, 'Fayoum Station', 'Fayoum', 'Fayoum City', 'Bus'),
(16, 'Beni Suef Station', 'Beni Suef', 'Beni Suef City', 'Train'),
(17, 'Minya Station', 'Minya', 'Minya City', 'Train'),
(18, 'Asyut Station', 'Asyut', 'Asyut City', 'Train'),
(19, 'Sohag Station', 'Sohag', 'Sohag City', 'Train'),
(20, 'Luxor Station', 'Luxor', 'Luxor City', 'Train'),
(21, 'Abbasiya Station', 'Cairo', 'Abbasiya', 'Bus'),
(22, 'Tora Station', 'Cairo', 'Tora', 'Metro'),
(23, 'Sadat Station', 'Cairo', 'Tahrir Square', 'Metro'),
(24, 'Damanhur Station', 'Beheira', 'Damanhur City', 'Train'),
(25, 'Qalyub Station', 'Qalyubia', 'Qalyub City', 'Train');


INSERT INTO Vehicle VALUES
(1, 'BUS-101', 'Bus', 50, 'Active'),
(2, 'BUS-102', 'Bus', 45, 'Active'),
(3, 'BUS-103', 'Bus', 40, 'Active'),
(4, 'BUS-104', 'Bus', 50, 'Active'),
(5, 'BUS-105', 'Bus', 55, 'Active'),
(6, 'METRO-201', 'Metro', 220, 'Active'),
(7, 'METRO-202', 'Metro', 220, 'Active'),
(8, 'METRO-203', 'Metro', 210, 'Active'),
(9, 'TRAIN-301', 'Train', 300, 'Active'),
(10, 'TRAIN-302', 'Train', 320, 'Active'),
(11, 'TRAIN-303', 'Train', 310, 'Active'),
(12, 'TRAIN-304', 'Train', 350, 'Active'),
(13, 'BUS-106', 'Bus', 45, 'Maintenance'),
(14, 'BUS-107', 'Bus', 50, 'Active'),
(15, 'BUS-108', 'Bus', 40, 'Active'),
(16, 'METRO-204', 'Metro', 230, 'Active'),
(17, 'METRO-205', 'Metro', 220, 'Maintenance'),
(18, 'TRAIN-305', 'Train', 330, 'Active'),
(19, 'TRAIN-306', 'Train', 340, 'Active'),
(20, 'TRAIN-307', 'Train', 360, 'Active');

INSERT INTO Route VALUES
(1, 'Cairo to Giza', 1, 2, 25.50, 5.00, 'Active'),
(2, 'Cairo to Nasr City', 1, 3, 18.00, 5.00, 'Active'),
(3, 'Cairo to Maadi', 1, 4, 15.00, 5.00, 'Active'),
(4, 'Maadi to Helwan', 4, 5, 20.00, 5.00, 'Active'),
(5, 'Giza to Dokki', 2, 6, 8.00, 5.00, 'Active'),
(6, 'Giza to October', 2, 7, 30.00, 7.00, 'Active'),
(7, 'Nasr City to New Cairo', 3, 8, 22.00, 7.00, 'Active'),
(8, 'Cairo to Alexandria', 1, 9, 220.00, 20.00, 'Active'),
(9, 'Cairo to Tanta', 1, 10, 95.00, 15.00, 'Active'),
(10, 'Cairo to Mansoura', 1, 11, 125.00, 15.00, 'Active'),
(11, 'Cairo to Zagazig', 1, 12, 85.00, 15.00, 'Active'),
(12, 'Cairo to Ismailia', 1, 13, 120.00, 15.00, 'Active'),
(13, 'Cairo to Suez', 1, 14, 135.00, 15.00, 'Active'),
(14, 'Cairo to Fayoum', 1, 15, 100.00, 15.00, 'Active'),
(15, 'Cairo to Beni Suef', 1, 16, 115.00, 15.00, 'Active'),
(16, 'Cairo to Minya', 1, 17, 245.00, 20.00, 'Active'),
(17, 'Cairo to Asyut', 1, 18, 375.00, 20.00, 'Active'),
(18, 'Cairo to Sohag', 1, 19, 470.00, 20.00, 'Active'),
(19, 'Cairo to Luxor', 1, 20, 670.00, 25.00, 'Active'),
(20, 'Alexandria to Tanta', 9, 10, 110.00, 15.00, 'Active');


INSERT INTO Route_Stop VALUES
(1, 1, 23, 1, 4.00),
(2, 1, 6, 2, 14.00),
(3, 2, 21, 1, 8.00),
(4, 3, 23, 1, 4.00),
(5, 3, 22, 2, 10.00),
(6, 4, 22, 1, 8.00),
(7, 6, 6, 1, 5.00),
(8, 7, 21, 1, 6.00),
(9, 8, 24, 1, 160.00),
(10, 9, 25, 1, 25.00),
(11, 10, 12, 1, 85.00),
(12, 11, 25, 1, 30.00),
(13, 12, 12, 1, 70.00),
(14, 13, 13, 1, 120.00),
(15, 14, 25, 1, 25.00),
(16, 15, 25, 1, 30.00),
(17, 16, 16, 1, 115.00),
(18, 17, 16, 1, 115.00),
(19, 17, 17, 2, 245.00),
(20, 18, 18, 1, 375.00);

INSERT INTO Schedule VALUES
(1, 1, 1, '08:00:00', '09:00:00', '2026-05-01', 50, 'Scheduled'),
(2, 2, 2, '09:00:00', '10:00:00', '2026-05-01', 45, 'Scheduled'),
(3, 3, 6, '10:00:00', '10:45:00', '2026-05-01', 220, 'Scheduled'),
(4, 4, 7, '11:00:00', '12:00:00', '2026-05-01', 220, 'Scheduled'),
(5, 5, 8, '12:00:00', '12:30:00', '2026-05-01', 210, 'Scheduled'),
(6, 6, 3, '13:00:00', '14:30:00', '2026-05-01', 40, 'Scheduled'),
(7, 7, 4, '14:00:00', '15:15:00', '2026-05-01', 50, 'Scheduled'),
(8, 8, 9, '07:00:00', '10:30:00', '2026-05-02', 300, 'Scheduled'),
(9, 9, 10, '08:00:00', '09:45:00', '2026-05-02', 320, 'Scheduled'),
(10, 10, 11, '09:00:00', '11:15:00', '2026-05-02', 310, 'Scheduled'),
(11, 11, 12, '10:00:00', '11:30:00', '2026-05-02', 350, 'Scheduled'),
(12, 12, 14, '11:00:00', '13:00:00', '2026-05-02', 50, 'Scheduled'),
(13, 13, 15, '12:00:00', '14:15:00', '2026-05-02', 40, 'Scheduled'),
(14, 14, 5, '13:00:00', '15:00:00', '2026-05-02', 55, 'Scheduled'),
(15, 15, 18, '14:00:00', '16:20:00', '2026-05-02', 330, 'Scheduled'),
(16, 16, 19, '15:00:00', '19:00:00', '2026-05-03', 340, 'Scheduled'),
(17, 17, 20, '16:00:00', '22:00:00', '2026-05-03', 360, 'Scheduled'),
(18, 18, 9, '17:00:00', '23:30:00', '2026-05-03', 300, 'Scheduled'),
(19, 19, 10, '18:00:00', '05:00:00', '2026-05-03', 320, 'Scheduled'),
(20, 20, 11, '19:00:00', '21:00:00', '2026-05-03', 310, 'Scheduled'),
(21, 1, 2, '16:00:00', '17:00:00', '2026-05-04', 45, 'Scheduled'),
(22, 8, 12, '06:30:00', '10:00:00', '2026-05-04', 350, 'Scheduled'),
(23, 9, 18, '07:30:00', '09:15:00', '2026-05-04', 330, 'Scheduled'),
(24, 12, 19, '08:30:00', '10:45:00', '2026-05-04', 340, 'Scheduled'),
(25, 19, 20, '20:00:00', '07:00:00', '2026-05-04', 360, 'Scheduled');






DROP PROCEDURE IF EXISTS CalculateFare;


DELIMITER //

CREATE PROCEDURE CalculateFare(IN routeId INT)
BEGIN
    SELECT 
        Route_ID,
        Route_Name,
        Base_Fare,
        Distance_KM,
        Base_Fare + (Distance_KM * 0.50) AS Final_Fare
    FROM Route
    WHERE Route_ID = routeId;
END //

DELIMITER ;


CALL CalculateFare(1);


CREATE INDEX schedule_search_index
ON Schedule (Route_ID, Travel_Date, Departure_Time);
EXPLAIN 
SELECT *
FROM Schedule
WHERE Route_ID = 1
AND Travel_Date = '2026-05-01';


START TRANSACTION;

INSERT INTO Ticket VALUES
(1, 1, 1, 27, '2026-04-25 09:00:00', 17.75, 'Booked'),
(2, 2, 2, 14, '2026-04-25 09:05:00', 14.00, 'Booked'),
(3, 3, 3, 88, '2026-04-25 09:10:00', 12.50, 'Booked'),
(4, 4, 4, 156, '2026-04-25 09:15:00', 15.00, 'Booked'),
(5, 5, 5, 42, '2026-04-25 09:20:00', 9.00, 'Booked'),
(6, 6, 6, 31, '2026-04-25 09:25:00', 22.00, 'Booked'),
(7, 7, 7, 9, '2026-04-25 09:30:00', 18.00, 'Booked'),
(8, 8, 8, 214, '2026-04-25 09:35:00', 130.00, 'Booked'),
(9, 9, 9, 178, '2026-04-25 09:40:00', 62.50, 'Booked'),
(10, 10, 10, 299, '2026-04-25 09:45:00', 77.50, 'Booked'),
(11, 11, 11, 73, '2026-04-25 09:50:00', 57.50, 'Booked'),
(12, 12, 12, 38, '2026-04-25 09:55:00', 75.00, 'Booked'),
(13, 13, 13, 22, '2026-04-25 10:00:00', 82.50, 'Booked'),
(14, 14, 14, 49, '2026-04-25 10:05:00', 65.00, 'Booked'),
(15, 15, 15, 187, '2026-04-25 10:10:00', 72.50, 'Booked'),
(16, 16, 16, 301, '2026-04-25 10:15:00', 142.50, 'Booked'),
(17, 17, 17, 345, '2026-04-25 10:20:00', 207.50, 'Booked'),
(18, 18, 18, 266, '2026-04-25 10:25:00', 255.00, 'Booked'),
(19, 19, 19, 115, '2026-04-25 10:30:00', 360.00, 'Booked'),
(20, 20, 20, 287, '2026-04-25 10:35:00', 70.00, 'Booked'),
(21, 21, 21, 33, '2026-04-25 10:40:00', 17.75, 'Booked'),
(22, 22, 22, 120, '2026-04-25 10:45:00', 130.00, 'Booked'),
(23, 23, 23, 210, '2026-04-25 10:50:00', 62.50, 'Booked'),
(24, 24, 24, 240, '2026-04-25 10:55:00', 75.00, 'Booked'),
(25, 25, 25, 346, '2026-04-25 11:00:00', 360.00, 'Booked'),
(26, 26, 1, 44, '2026-04-25 11:05:00', 17.75, 'Booked'),
(27, 27, 2, 22, '2026-04-25 11:10:00', 14.00, 'Booked'),
(28, 28, 8, 108, '2026-04-25 11:15:00', 130.00, 'Booked'),
(29, 29, 19, 215, '2026-04-25 11:20:00', 360.00, 'Booked'),
(30, 30, 25, 25, '2026-04-25 11:25:00', 360.00, 'Booked');

INSERT INTO Payment VALUES
(1, 1, 'Cash', 17.75, '2026-04-25 09:01:00', 'Paid'),
(2, 2, 'Card', 14.00, '2026-04-25 09:06:00', 'Paid'),
(3, 3, 'Cash', 12.50, '2026-04-25 09:11:00', 'Paid'),
(4, 4, 'Mobile Wallet', 15.00, '2026-04-25 09:16:00', 'Paid'),
(5, 5, 'Cash', 9.00, '2026-04-25 09:21:00', 'Paid'),
(6, 6, 'Card', 22.00, '2026-04-25 09:26:00', 'Paid'),
(7, 7, 'Mobile Wallet', 18.00, '2026-04-25 09:31:00', 'Paid'),
(8, 8, 'Card', 130.00, '2026-04-25 09:36:00', 'Paid'),
(9, 9, 'Cash', 62.50, '2026-04-25 09:41:00', 'Paid'),
(10, 10, 'Card', 77.50, '2026-04-25 09:46:00', 'Paid'),
(11, 11, 'Cash', 57.50, '2026-04-25 09:51:00', 'Paid'),
(12, 12, 'Mobile Wallet', 75.00, '2026-04-25 09:56:00', 'Paid'),
(13, 13, 'Card', 82.50, '2026-04-25 10:01:00', 'Paid'),
(14, 14, 'Cash', 65.00, '2026-04-25 10:06:00', 'Paid'),
(15, 15, 'Mobile Wallet', 72.50, '2026-04-25 10:11:00', 'Paid'),
(16, 16, 'Card', 142.50, '2026-04-25 10:16:00', 'Paid'),
(17, 17, 'Cash', 207.50, '2026-04-25 10:21:00', 'Paid'),
(18, 18, 'Card', 255.00, '2026-04-25 10:26:00', 'Paid'),
(19, 19, 'Mobile Wallet', 360.00, '2026-04-25 10:31:00', 'Paid'),
(20, 20, 'Cash', 70.00, '2026-04-25 10:36:00', 'Paid'),
(21, 21, 'Card', 17.75, '2026-04-25 10:41:00', 'Paid'),
(22, 22, 'Cash', 130.00, '2026-04-25 10:46:00', 'Paid'),
(23, 23, 'Mobile Wallet', 62.50, '2026-04-25 10:51:00', 'Paid'),
(24, 24, 'Card', 75.00, '2026-04-25 10:56:00', 'Paid'),
(25, 25, 'Cash', 360.00, '2026-04-25 11:01:00', 'Paid'),
(26, 26, 'Card', 17.75, '2026-04-25 11:06:00', 'Paid'),
(27, 27, 'Mobile Wallet', 14.00, '2026-04-25 11:11:00', 'Paid'),
(28, 28, 'Cash', 130.00, '2026-04-25 11:16:00', 'Paid'),
(29, 29, 'Card', 360.00, '2026-04-25 11:21:00', 'Paid'),
(30, 30, 'Mobile Wallet', 360.00, '2026-04-25 11:26:00', 'Paid');

UPDATE Schedule
SET Available_Seats = Available_Seats - 1
WHERE Schedule_ID BETWEEN 1 AND 25;

UPDATE Schedule
SET Available_Seats = Available_Seats - 1
WHERE Schedule_ID IN (1, 2, 8, 19, 25);

COMMIT;


-- checks fares
SELECT 
    Ticket.Ticket_ID,
    Route.Route_Name,
    Route.Base_Fare,
    Route.Distance_KM,
    Ticket.Fare_Amount,
    Route.Base_Fare + (Route.Distance_KM * 0.50) AS Correct_Fare
FROM Ticket
JOIN Schedule ON Ticket.Schedule_ID = Schedule.Schedule_ID
JOIN Route ON Schedule.Route_ID = Route.Route_ID;


-- checks seat number
SELECT 
    Ticket.Ticket_ID,
    Ticket.Seat_Number,
    Vehicle.Vehicle_Number,
    Vehicle.Capacity
FROM Ticket
JOIN Schedule ON Ticket.Schedule_ID = Schedule.Schedule_ID
JOIN Vehicle ON Schedule.Vehicle_ID = Vehicle.Vehicle_ID;


-- cheks available seats after booking

SELECT 
    Schedule.Schedule_ID,
    Vehicle.Vehicle_Number,
    Vehicle.Capacity,
    Schedule.Available_Seats
FROM Schedule
JOIN Vehicle ON Schedule.Vehicle_ID = Vehicle.Vehicle_ID;






-- aggregate fucntions


SELECT COUNT(*) AS Total_Tickets
FROM Ticket;

SELECT SUM(Payment_Amount) AS Total_Revenue
FROM Payment;


-- sub query 

SELECT *
FROM Ticket
WHERE Fare_Amount > (
    SELECT AVG(Fare_Amount)
    FROM Ticket
);


-- transaction

START TRANSACTION;

INSERT INTO Ticket VALUES
(31, 1, 1, 30, '2026-04-26 09:00:00', 17.75, 'Booked');

INSERT INTO Payment VALUES
(31, 31, 'Cash', 17.75, '2026-04-26 09:01:00', 'Paid');

UPDATE Schedule
SET Available_Seats = Available_Seats - 1
WHERE Schedule_ID = 1;

COMMIT;





-- Ticket CRUD Operations

-- CREATE: Insert a new ticket
INSERT INTO Ticket
(Ticket_ID, Passenger_ID, Schedule_ID, Seat_Number, Booking_Date, Fare_Amount, Ticket_Status)
VALUES
(32, 1, 1, 35, '2026-04-26 10:00:00', 17.75, 'Booked');


-- READ: Display the new ticket
SELECT *
FROM Ticket
WHERE Ticket_ID = 32;


-- UPDATE: Cancel the ticket
UPDATE Ticket
SET Ticket_Status = 'Cancelled'
WHERE Ticket_ID = 32;


-- READ: Check ticket status after update
SELECT *
FROM Ticket
WHERE Ticket_ID = 32;


-- DELETE: Delete the ticket record
DELETE FROM Ticket
WHERE Ticket_ID = 32;

-- READ: Confirm ticket deletion
SELECT *
FROM Ticket
WHERE Ticket_ID = 32;


-- testing 


SELECT 
    Ticket.Ticket_ID,
    Route.Route_Name,
    Route.Base_Fare,
    Route.Distance_KM,
    Ticket.Fare_Amount,
    Route.Base_Fare + (Route.Distance_KM * 0.50) AS Correct_Fare
FROM Ticket
JOIN Schedule ON Ticket.Schedule_ID = Schedule.Schedule_ID
JOIN Route ON Schedule.Route_ID = Route.Route_ID;




