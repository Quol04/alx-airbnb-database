-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details.
SELECT b.*, u.*, p.*, pay.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
INNER JOIN payments pay ON b.id = pay.booking_id;   

-- Analyze the query’s performance using EXPLAIN and identify any inefficiencies.
-- (This step is typically done in a database environment and cannot be represented in a static SQL file).


-- Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.
SELECT b.id, b.start_date, b.end_date, u.id AS user_id, u.name AS user_name, p.id AS property_id, p.location AS property_location, pay.amount AS payment_amount
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
INNER JOIN payments pay ON b.id = pay.booking_id;
-- Re-analyze the performance of the refactored query using EXPLAIN and compare it with the initial analysis.