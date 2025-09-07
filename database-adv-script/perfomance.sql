-- Initial query retrieving all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name AS user_name,
    u.email,
    p.property_id,
    p.title AS property_title,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND b.end_date <= '2025-12-31'
  AND pay.amount > 100;

-- Analyze query performance
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.title AS property_title,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND b.end_date <= '2025-12-31'
  AND pay.amount > 100
ORDER BY b.start_date DESC;

-- Refactored version (example: reduce unnecessary joins, leverage indexes)
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND b.end_date <= '2025-12-31'
  AND pay.amount > 100
ORDER BY b.start_date DESC;




----------------------------------------------------------
-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details.

-- Initial query to fetch bookings with users, properties, and payments
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
   

-- Analyze the query’s performance using EXPLAIN and identify any inefficiencies.
EXPLAIN SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;        


-- Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.

-- Ensure proper indexes exist:
-- CREATE INDEX idx_bookings_user_id ON bookings(user_id);
-- CREATE INDEX idx_bookings_property_id ON bookings(property_id);
-- CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Optimized query
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
