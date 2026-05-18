# Vehicle-Rental-Database-System
# Public Transport Management System Database Project

A relational database project designed and implemented using MySQL for managing public transportation operations.

This project focuses on database design, SQL implementation, normalization, transactions, query optimization, and data integrity using a Public Transport Management System scenario. 

The system manages:

* Passengers and user accounts
* Vehicles and transport routes
* Stations and route stops
* Trip schedules
* Ticket bookings
* Payment records

---

# Project Overview

The goal of this project is to build a structured and normalized database for managing transportation services such as buses, metro lines, and trains.

The project includes:

* Database analysis and design
* ERD creation
* Normalization up to 3NF
* SQL table creation
* CRUD operations
* SQL joins and subqueries
* Stored procedures
* Transactions
* Query optimization using indexes
* Data integrity and validation

The database was implemented using MySQL. 

---

# Main Features

## Passenger Management

* Store passenger information
* Manage user accounts
* Support login structure

## Vehicle Management

* Store vehicle details and capacity
* Track vehicle status

## Route and Station Management

* Define routes between stations
* Manage route stops and station order

## Schedule Management

* Store trip schedules
* Track departure and arrival times
* Manage available seats

## Ticket Booking

* Book tickets for passengers
* Store seat and fare information

## Payment System

* Store payment records
* Link payments to booked tickets

---

# Technologies Used

| Technology      | Purpose                         |
| --------------- | ------------------------------- |
| MySQL           | Database implementation         |
| SQL             | Database queries and operations |
| MySQL Workbench | Database management             |
| ERD Design      | Database modeling               |
| Git & GitHub    | Version control                 |

---

# Database Design

The database contains the following main tables:

* Passenger
* User_Account
* Station
* Vehicle
* Route
* Route_Stop
* Schedule
* Ticket
* Payment

The ERD uses relationships between tables to connect passengers, routes, schedules, tickets, and payments. The Route_Stop table solves the many-to-many relationship between Route and Station. 

---

# Normalization

The database was normalized to Third Normal Form (3NF).

Normalization helped reduce:

* Duplicate data
* Update problems
* Insertion problems
* Deletion problems

The design separates related data into different tables to improve consistency and organization. 

---

# Main Database Tables

| Table        | Purpose                       |
| ------------ | ----------------------------- |
| Passenger    | Stores passenger information  |
| User_Account | Stores account and login data |
| Station      | Stores station details        |
| Vehicle      | Stores vehicle information    |
| Route        | Stores transport routes       |
| Route_Stop   | Stores route stops            |
| Schedule     | Stores trip schedules         |
| Ticket       | Stores booking records        |
| Payment      | Stores payment information    |



---

# SQL Features Implemented

The project includes several SQL operations:

## CRUD Operations

* SELECT
* INSERT
* UPDATE
* DELETE

These operations were used for schedules, tickets, seat management, and payments. 

---

# SQL Concepts Used

## JOIN Queries

JOIN operations were used to:

* Validate fares
* Retrieve related booking data
* Check seat assignments

## Aggregate Functions

Used for:

* Counting tickets
* Calculating total revenue

## Subqueries

Used for advanced filtering and fare comparison.



---

# Stored Procedures and Transactions

## Stored Procedure

A stored procedure named:

```
CalculateFare
```

was created to calculate the final fare based on:

* Base fare
* Route distance



---

## Transactions

Transactions were used during ticket booking to ensure consistency between:

* Ticket insertion
* Payment insertion
* Seat updates

This prevents incomplete booking operations. 

---

# Query Optimization

Indexes were created to improve search performance.

Example:

```
CREATE INDEX schedule_search_index
ON Schedule (Route_ID, Travel_Date, Departure_Time);
```

This improves schedule searching and reduces full-table scanning. 

---

# Data Integrity and Security

The database uses:

* Primary Keys
* Foreign Keys
* UNIQUE constraints
* CHECK constraints

Examples include:

* Unique passenger emails
* Positive vehicle capacity
* Non-negative available seats



---

# Security Features

The system supports:

* User roles
* Password hash structure
* Access control concepts
* Administrator privileges



---

# Testing and Validation

The database was tested using sample data for:

* Passengers
* Stations
* Routes
* Vehicles
* Schedules
* Tickets
* Payments

Testing included:

* CRUD operations
* JOIN queries
* Transactions
* Revenue calculations
* Seat availability updates



---

# Challenges and Limitations

## Challenges

* Designing route and station relationships
* Maintaining seat consistency during booking

## Limitations

The current project does not include:

* Web or mobile application
* Real-time GPS tracking
* Online payment integration



---

# Project Structure

```
Public Transport Management System/
│
├── ER Diagram
├── SQL Scripts
├── Database Report
├── Sample Data
├── Stored Procedures
├── Transactions
└── README.md
```

---

# Example SQL Query

```
SELECT *
FROM Schedule
WHERE Route_ID = 1
AND Travel_Date = '2026-05-01';
```

---

# Example Stored Procedure

```
CALL CalculateFare(1);
```

---

# Example Transaction

```
START TRANSACTION;

INSERT INTO Ticket ...
INSERT INTO Payment ...

UPDATE Schedule
SET Available_Seats = Available_Seats - 1;

COMMIT;
```

---

# Future Improvements

Possible future improvements include:

* Web application integration
* Mobile application support
* Real-time vehicle tracking
* Online payment gateway integration
* Advanced reporting and analytics

---

# Learning Outcomes

This project demonstrates understanding of:

* Relational database design
* SQL development
* ERD modeling
* Database normalization
* Query optimization
* Transactions and consistency
* Data integrity and validation
* MySQL implementation

---

# Project Purpose

This repository was created to demonstrate practical database design and SQL development skills through the implementation of a Public Transport Management System database.
