# Shipment Management System

A **relational database project** built with **MySQL** that models a complete online shipment management platform -- covering users, couriers, shipments, real-time tracking, payments, and warehouse management.

---

## Project Overview

This system manages the full lifecycle of a shipment -- from the moment a user places a request, to courier assignment, warehouse routing, real-time tracking, and final payment settlement.

**Tech Stack:** MySQL - SQL DDL/DML - Relational Database Design

---

## Database Schema

The database (`project_final_1`) consists of **14 interrelated tables**:

| Table | Description |
|---|---|
| `user` | Registered users (senders and receivers) |
| `address_user` | User address details (street, city, country) |
| `user_pass` | User credentials |
| `user_phonenumber` | Multi-valued phone numbers per user |
| `courier` | Delivery personnel linked to tracking |
| `courier_phone` | Multi-valued phone numbers per courier |
| `shipment` | Core shipment records (cost, weight, status, type) |
| `tracking` | Real-time tracking entries (location, time, status) |
| `payment` | Payment records (method, amount, status) |
| `ware_house` | Warehouse locations and capacity |
| `user_tracking` | Junction: users - tracking |
| `tracking_shipment` | Junction: tracking - shipments |
| `courier_warehouse` | Junction: couriers - warehouses |
| `shipment_warehouse` | Junction: shipments - warehouses |

---

## Features

- **User Management** -- roles (sender/receiver), addresses, multi-phone support
- **Shipment Lifecycle** -- standard and express options, weight, cost, delivery date
- **Real-time Tracking** -- location, timestamp, and status per shipment
- **Courier Assignment** -- couriers linked to shipments and warehouses
- **Payment Processing** -- cash and credit card, paid/pending status
- **Warehouse Routing** -- shipments routed through warehouse checkpoints
- **Advanced SQL Queries** -- JOINs, GROUP BY, HAVING, subqueries, aggregations

---

## Files

| File | Description |
|---|---|
| `Online-Shipment_final.sql` | Final schema + full INSERT/UPDATE/SELECT/DELETE |
| `Online-Shipment.sql` | Initial version of the schema |
| `Online-Shipment-Database-System.pptx` | Project presentation slides |
| `Slide 1.docx` | Additional documentation |

---

## Getting Started

**Prerequisites:** MySQL Server 8.0+ and MySQL Workbench

\\\sql
-- 1. Run the SQL file
source Online-Shipment_final.sql;

-- 2. Verify tables
USE project_final_1;
SHOW TABLES;

-- 3. Example query
SELECT s.shipment_id, s.status, c.f_name, c.l_name
FROM shipment s LEFT JOIN courier c ON s.courier_id = c.courier_id;
\\\`n
---

## Sample Queries Included

- All users and their shipment statuses
- Couriers and their assigned warehouses
- Shipments with payment status and amount
- Users with full address details
- Shipments without payment (subquery)
- Shipment count per user (GROUP BY)
- Couriers in more than one warehouse (HAVING)

---

## Author

**Youssef Amr Mohamed**
Cybersecurity and Computer Science Student
[GitHub](https://github.com/youssefamr010)

---

## License

This project is for academic and educational purposes.