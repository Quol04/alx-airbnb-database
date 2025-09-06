-- Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).

-- User table: id, email
-- Booking table: id, user_id, property_id, start_date, end_date
-- Property table: id, owner_id, location, price

-- Write SQL CREATE INDEX commands to create appropriate indexes for those columns.

CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_booking_user ON bookings(user_id);
CREATE INDEX idx_booking_property ON bookings(property_id);
CREATE INDEX idx_property_owner ON properties(owner_id);
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_price ON properties(price);
CREATE INDEX idx_booking_dates ON bookings(start_date, end_date);
-- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE
-- (This step is typically done in a database environment and cannot be represented in a static SQL file).
-- Drop indexes if necessary to clean up