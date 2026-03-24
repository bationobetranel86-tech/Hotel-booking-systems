-- ================================================
-- CS27 - Hotel Booking System - Group 15
-- FILE 03 : UPDATE, DELETE, referential integrity
-- ================================================

USE hotel_booking;

-- ---- UPDATE statements -------------------------

-- UPDATE 1 : set room 101 to maintenance
UPDATE rooms
SET status = 'maintenance'
WHERE room_number = '101';

-- UPDATE 2 : fix a guest phone number
UPDATE guests
SET phone = '+22670999999'
WHERE email = 'm.ouedraogo@email.com';

-- UPDATE 3 : confirm a pending booking
UPDATE bookings
SET status = 'confirmed'
WHERE booking_id = 8;

-- ---- DELETE statements -------------------------

-- DELETE 1 : remove the cancelled booking
DELETE FROM bookings
WHERE booking_id = 11;

-- DELETE 2 : remove an unused service
DELETE FROM services
WHERE service_id = 10;

-- ---- Referential integrity violation -----------
-- This DELETE will FAIL on purpose
-- room_id=2 is referenced by existing bookings
-- MySQL will return ERROR 1451

DELETE FROM rooms WHERE room_id = 2;

-- Expected error :
-- ERROR 1451 (23000): Cannot delete or update a parent row:
-- a foreign key constraint fails
-- Explanation : bookings table has rows referencing room_id=2.
-- MySQL refuses deletion to prevent orphan records.