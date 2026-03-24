-- ================================================
-- CS27 - Hotel Booking System - Group 15
-- FILE 02 : Sample data - INSERT INTO
-- ================================================

USE hotel_booking;

-- 1. ROOMS (12 rows)
INSERT INTO rooms (room_number, type, price_per_night, capacity, status) VALUES
('101', 'single',  25000,  1, 'available'),
('102', 'single',  25000,  1, 'occupied'),
('103', 'single',  28000,  1, 'available'),
('104', 'single',  22000,  1, 'available'),
('201', 'double',  45000,  2, 'available'),
('202', 'double',  45000,  2, 'available'),
('203', 'double',  48000,  2, 'maintenance'),
('204', 'double',  50000,  2, 'occupied'),
('301', 'suite',   95000,  4, 'available'),
('302', 'suite',  110000,  4, 'occupied'),
('303', 'suite',  120000,  6, 'available'),
('304', 'suite',   98000,  4, 'available');

-- 2. GUESTS (10 rows)
INSERT INTO guests (first_name, last_name, email, phone, nationality) VALUES
('Mamadou',  'Ouedraogo', 'm.ouedraogo@email.com',  '+22670000001', 'Burkinabe'),
('Fatimata', 'Sawadogo',  'f.sawadogo@email.com',   '+22670000002', 'Burkinabe'),
('Jean',     'Dupont',     'j.dupont@email.fr',      '+33600000001', 'French'),
('Amina',    'Coulibaly', 'a.coulibaly@email.ml',   '+22366000001', 'Malian'),
('Paul',     'Barro',      'p.barro@email.com',      '+22670000005', 'Burkinabe'),
('Aicha',    'Traore',     'a.traore@email.com',     '+22670000006', 'Burkinabe'),
('Carlos',   'Mendes',     'c.mendes@email.br',      '+5511900000001','Brazilian'),
('Mariam',   'Kone',       'm.kone@email.ci',        '+22507000001', 'Ivorian'),
('Ali',      'Hassan',     'a.hassan@email.sn',      '+22177000001', 'Senegalese'),
('Sophie',   'Martin',     's.martin@email.be',      '+3247000001',  'Belgian');

-- 3. SERVICES (10 rows)
INSERT INTO services (service_name, category, price, description) VALUES
('Breakfast',        'Food',      3500,  'Full buffet breakfast'),
('Lunch',            'Food',      6000,  'Midday meal at restaurant'),
('Dinner',           'Food',      8000,  'Gastronomic dinner'),
('Spa',              'Wellness', 15000,  '2-hour spa access'),
('Swimming Pool',    'Leisure',  5000,  'Full day pool access'),
('Airport Shuttle',  'Transport',10000, 'Airport-hotel transfer'),
('Parking',          'Transport', 2000, 'Secured parking per night'),
('Laundry',          'Housekeeping',4000,'Washing and ironing'),
('Room Service',     'Food',      2500,  '24/7 in-room dining'),
('Meeting Room',     'Business', 20000, 'Room rental 8am-6pm');

-- 4. BOOKINGS (12 rows)
INSERT INTO bookings (room_id, guest_id, check_in, check_out, total_price, status) VALUES
(1,  1, '2025-01-05', '2025-01-08',  75000, 'completed'),
(2,  2, '2025-01-10', '2025-01-12',  50000, 'completed'),
(5,  3, '2025-02-01', '2025-02-05', 180000, 'completed'),
(9,  4, '2025-02-14', '2025-02-16', 190000, 'completed'),
(3,  5, '2025-03-01', '2025-03-03',  56000, 'confirmed'),
(6,  6, '2025-03-10', '2025-03-15', 225000, 'confirmed'),
(10, 7, '2025-03-20', '2025-03-25', 550000, 'confirmed'),
(4,  8, '2025-04-01', '2025-04-02',  22000, 'pending'),
(7,  9, '2025-04-05', '2025-04-07',  96000, 'pending'),
(11,10, '2025-04-10', '2025-04-14', 480000, 'pending'),
(1,  3, '2025-05-01', '2025-05-03',  50000, 'cancelled'),
(5,  1, '2025-05-15', '2025-05-18', 135000, 'confirmed');

-- 5. BOOKING_SERVICES (11 rows)
INSERT INTO booking_services (booking_id, service_id, quantity) VALUES
(1, 1, 3), (1, 7, 3),
(2, 1, 2), (2, 9, 1),
(3, 1, 4), (3, 4, 1), (3, 6, 1),
(4, 2, 2), (4, 3, 2),
(5, 1, 2),
(6, 5, 5);

-- 6. INVOICES (10 rows)
INSERT INTO invoices (booking_id, issue_date, amount_due, paid) VALUES
(1,  '2025-01-08',  81000, TRUE),
(2,  '2025-01-12',  55000, TRUE),
(3,  '2025-02-05', 204000, TRUE),
(4,  '2025-02-16', 206000, TRUE),
(5,  '2025-03-03',  63000, FALSE),
(6,  '2025-03-15', 250000, FALSE),
(7,  '2025-03-25', 550000, FALSE),
(8,  '2025-04-02',  22000, FALSE),
(9,  '2025-04-07',  96000, FALSE),
(10, '2025-04-14', 480000, FALSE);

-- Verify row counts
SELECT 'rooms'             AS tbl, COUNT(*) AS rows_count FROM rooms
UNION ALL SELECT 'guests',           COUNT(*) FROM guests
UNION ALL SELECT 'services',         COUNT(*) FROM services
UNION ALL SELECT 'bookings',         COUNT(*) FROM bookings
UNION ALL SELECT 'booking_services', COUNT(*) FROM booking_services
UNION ALL SELECT 'invoices',         COUNT(*) FROM invoices;