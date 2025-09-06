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
