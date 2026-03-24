# Hotel Booking System — CS27 Group Project

## Project Overview
A fully functional relational database for managing a hotel booking system.
Built with MySQL 8.0 as part of the CS27 end-of-semester project.

## Group 15 — Members
- BATIONO BETRANEL
- COMPAORE KISITO
- KIENDREBEOGO PINGWENDE SEPHORA LEOCADIE
- SAWADOGO FLAVIENNE GRACE
- YAMEOGO WENDGOUNDI HYACINTE AYMAR
- ZONGO PAWENDTAORE JOTHAM MALKIRAM

## School
Burkina Institute of Technology
Course: CS27 — The Relational Model & Databases
Instructor: Kweyakie Afi Blebo — March 2026

## Database Tables
- `rooms` — Hotel rooms (type, price, capacity, status)
- `guests` — Customer records
- `bookings` — Reservations linking rooms and guests
- `services` — Additional hotel services
- `booking_services` — Junction table (M:N bookings ↔ services)
- `invoices` — One invoice per booking (1:1)

## How to Run
1. Open phpMyAdmin or MySQL Workbench
2. Run `01_schema.sql` first — creates the database and all tables
3. Run `02_data.sql` — inserts sample data (10+ rows per table)
4. Run `03_updates.sql` — UPDATE, DELETE and integrity demo
5. Run `04_queries.sql` — all SELECT queries and aggregate reports

## Tools Used
- MySQL 8.0 + phpMyAdmin
- dbdiagram.io (schema diagram)
## links 
-youtube link:https://youtu.be/8WuS4QRjir0?feature=shared
-github link : https://github.com/bationobetranel86-tech/Hotel-bookings-system
