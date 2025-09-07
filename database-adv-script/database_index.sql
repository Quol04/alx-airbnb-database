-- Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).

-- User table: id, email
-- Booking table: id, user_id, property_id, start_date, end_date
-- Property table: id, owner_id, location, price

-- Write SQL CREATE INDEX commands to create appropriate indexes for those columns.

-- Indexes for Users table
CREATE INDEX idx_users_email ON users(email);

-- Indexes for Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);

-- Indexes for Properties table
CREATE INDEX idx_properties_location ON properties(location);

-- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE

-- before adding indexes:
EXPLAIN SELECT * 
FROM bookings 
WHERE user_id = 5;

-- after adding indexes:
EXPLAIN SELECT * 
FROM bookings 
WHERE user_id = 5;

-- after join optimization
EXPLAIN SELECT u.name, b.id, p.title
FROM users u
JOIN bookings b ON u.id = b.user_id
JOIN properties p ON b.property_id = p.id
WHERE p.location = 'Nairobi';




-----------------------------------------------

-- Create indexes to improve performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_properties_location ON properties(location);

-- Test query performance before and after indexes
-- Example: Fetch bookings for a specific user and date range

-- Analyze query execution plan
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, u.name, p.title
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE u.email = 'testuser@example.com'
  AND b.start_date BETWEEN '2025-01-01' AND '2025-06-01'
ORDER BY b.start_date DESC;

-- Another performance test: properties by location
EXPLAIN ANALYZE
SELECT p.property_id, p.title, COUNT(b.booking_id) AS total_bookings
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
WHERE p.location = 'Nairobi'
GROUP BY p.property_id, p.title
ORDER BY total_bookings DESC;
