-- Assume the Booking table is large and query performance is slow. Implement partitioning on the Booking table based on the start_date column. 
CREATE TABLE Booking (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Test the performance of queries on the partitioned table (e.g., fetching bookings by date range).
-- (This step is typically done in a database environment and cannot be represented in a static SQL file).

-- Write a brief report on the improvements you observed.
-- (This step is typically done in a database environment and cannot be represented in a static SQL file).
-- Clean up by dropping the partitioned tables if necessary.