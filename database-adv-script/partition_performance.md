# Partitioning Performance Report

This report evaluates the impact of partitioning the large `Booking` table by the `start_date` column to improve query performance, especially for date range queries.

---

## 1. Background

The `Booking` table has grown significantly, resulting in slow query performance, particularly when filtering by date ranges. Partitioning is implemented to address this issue.

---

## 2. Partitioning Implementation

The table was partitioned by the `start_date` column. The SQL statements used for partitioning are saved in `partitioning.sql`.

**Example (PostgreSQL Range Partitioning):**

```sql
CREATE TABLE Booking (
		id SERIAL PRIMARY KEY,
		user_id INT,
		property_id INT,
		start_date DATE,
		...
) PARTITION BY RANGE (start_date);

CREATE TABLE Booking_2024 PARTITION OF Booking
		FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE Booking_2025 PARTITION OF Booking
		FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
-- Additional partitions as needed
```

---

## 3. Performance Testing

Queries fetching bookings by date range were tested before and after partitioning:

**Example Query:**

```sql
SELECT * FROM Booking WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';
```

**Performance Measurement:**

- Used `EXPLAIN ANALYZE` to compare query plans and execution times.

---

## 4. Results & Observations

- **Before Partitioning:**
  - Full table scan for date range queries.
  - High query execution time (e.g., 2000 ms).
- **After Partitioning:**
  - Only relevant partitions are scanned.
  - Query execution time reduced significantly (e.g., 300 ms).
- **Resource Usage:**
  - Lower CPU and I/O usage for partitioned queries.

---

## 5. Recommendations

- Use partitioning for large tables with frequent range queries on date or numeric columns.
- Regularly review partitioning strategy as data grows.
- Monitor partition sizes and add new partitions as needed.

---

## References

- [PostgreSQL Table Partitioning](https://www.postgresql.org/docs/current/ddl-partitioning.html)
- [MySQL Partitioning Documentation](https://dev.mysql.com/doc/refman/8.0/en/partitioning.html)
