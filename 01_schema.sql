-- ================================================
-- CS27 - Hotel Booking System - Group 15
-- FILE 01 : Database schema - CREATE TABLE
-- ================================================

CREATE DATABASE IF NOT EXISTS hotel_booking;
USE hotel_booking;

-- Table 1 : rooms
CREATE TABLE rooms (
  room_id         INT AUTO_INCREMENT PRIMARY KEY,
  room_number     VARCHAR(10)  NOT NULL UNIQUE,
  type            ENUM('single','double','suite') NOT NULL,
  price_per_night DECIMAL(10,2) NOT NULL,
  capacity        INT NOT NULL DEFAULT 1,
  status          ENUM('available','occupied','maintenance')
                  DEFAULT 'available'
);

-- Table 2 : guests
CREATE TABLE guests (
  guest_id    INT AUTO_INCREMENT PRIMARY KEY,
  first_name  VARCHAR(50)  NOT NULL,
  last_name   VARCHAR(50)  NOT NULL,
  email       VARCHAR(100) NOT NULL UNIQUE,
  phone       VARCHAR(20),
  nationality VARCHAR(50)
);

-- Table 3 : services
CREATE TABLE services (
  service_id   INT AUTO_INCREMENT PRIMARY KEY,
  service_name VARCHAR(100) NOT NULL,
  category     VARCHAR(50),
  price        DECIMAL(10,2) NOT NULL,
  description  TEXT
);

-- Table 4 : bookings
CREATE TABLE bookings (
  booking_id  INT AUTO_INCREMENT PRIMARY KEY,
  room_id     INT NOT NULL,
  guest_id    INT NOT NULL,
  check_in    DATE NOT NULL,
  check_out   DATE NOT NULL,
  total_price DECIMAL(10,2),
  status      ENUM('pending','confirmed','cancelled','completed')
              DEFAULT 'pending',
  FOREIGN KEY (room_id)  REFERENCES rooms(room_id),
  FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);

-- Table 5 : booking_services (pivot M:N)
CREATE TABLE booking_services (
  booking_id INT NOT NULL,
  service_id INT NOT NULL,
  quantity   INT DEFAULT 1,
  PRIMARY KEY (booking_id, service_id),
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
  FOREIGN KEY (service_id) REFERENCES services(service_id)
);

-- Table 6 : invoices
CREATE TABLE invoices (
  invoice_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT NOT NULL UNIQUE,
  issue_date DATE NOT NULL,
  amount_due DECIMAL(10,2) NOT NULL,
  paid       BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

SHOW TABLES;