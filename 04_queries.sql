-- ================================================
-- CS27 - Hotel Booking System - Group 15
-- FILE 04 : SELECT queries + aggregate functions
-- ================================================

USE hotel_booking;

-- ==== PART 2.4 - SELECT QUERIES ================

-- 1. All records from a table
SELECT * FROM rooms;

-- 2. Specific columns with WHERE
SELECT first_name, last_name, email, nationality
FROM guests
WHERE nationality = 'Burkinabe';

-- 3. ORDER BY
SELECT room_number, type, price_per_night
FROM rooms
ORDER BY price_per_night DESC;

-- 4. LIMIT
SELECT * FROM bookings
ORDER BY check_in DESC LIMIT 5;

-- 5a. BETWEEN
SELECT room_number, type, price_per_night
FROM rooms
WHERE price_per_night BETWEEN 30000 AND 100000;

-- 5b. LIKE
SELECT first_name, last_name, email
FROM guests
WHERE email LIKE '%.com';

-- 5c. IN
SELECT booking_id, status, total_price
FROM bookings
WHERE status IN ('confirmed', 'completed');

-- 6. INNER JOIN (2 tables)
SELECT b.booking_id, g.first_name, g.last_name,
       r.room_number, r.type, b.check_in, b.check_out, b.status
FROM bookings b
INNER JOIN guests g ON b.guest_id = g.guest_id
INNER JOIN rooms  r ON b.room_id  = r.room_id;

-- 7. LEFT JOIN (guests even without bookings)
SELECT g.first_name, g.last_name, b.booking_id, b.status
FROM guests g
LEFT JOIN bookings b ON g.guest_id = b.guest_id;

-- 8. JOIN across 3 tables
SELECT g.first_name, g.last_name,
       r.room_number, r.type,
       b.check_in, b.check_out,
       i.amount_due, i.paid
FROM bookings b
JOIN guests   g ON b.guest_id  = g.guest_id
JOIN rooms    r ON b.room_id   = r.room_id
JOIN invoices i ON b.booking_id = i.booking_id;

-- 9. IS NULL / IS NOT NULL
SELECT first_name, last_name, email
FROM guests WHERE phone IS NULL;

SELECT invoice_id, booking_id, amount_due
FROM invoices WHERE paid = FALSE;

-- ==== PART 3 - AGGREGATE FUNCTIONS =============

-- COUNT
SELECT COUNT(*) AS total_bookings FROM bookings;
SELECT COUNT(*) AS available_rooms FROM rooms WHERE status = 'available';

-- MAX and MIN
SELECT MAX(price_per_night) AS most_expensive,
       MIN(price_per_night) AS cheapest
FROM rooms;

-- AVG
SELECT AVG(total_price) AS avg_booking_value
FROM bookings WHERE status = 'completed';

-- GROUP BY
SELECT r.type,
       COUNT(b.booking_id) AS nb_bookings,
       SUM(b.total_price)  AS total_revenue
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY r.type ORDER BY total_revenue DESC;

-- HAVING
SELECT g.first_name, g.last_name,
       COUNT(b.booking_id) AS nb_stays
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
GROUP BY g.guest_id, g.first_name, g.last_name
HAVING nb_stays >= 2;

-- Summary report : JOIN + GROUP BY + HAVING
SELECT
  g.first_name, g.last_name, g.nationality,
  COUNT(b.booking_id) AS total_stays,
  SUM(i.amount_due)   AS total_spent,
  AVG(i.amount_due)   AS avg_invoice,
  MAX(i.amount_due)   AS highest_invoice
FROM guests g
JOIN bookings b ON g.guest_id  = b.guest_id
JOIN invoices i ON b.booking_id = i.booking_id
WHERE b.status = 'completed'
GROUP BY g.guest_id, g.first_name, g.last_name, g.nationality
HAVING total_spent > 50000
ORDER BY total_spent DESC;