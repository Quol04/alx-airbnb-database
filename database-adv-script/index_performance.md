# Index Performance Analysis

This document details the process and results of analyzing and improving query performance through the use of indexes in the User, Booking, and Property tables.

---

## 1. Identifying High-Usage Columns

Columns frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses are prime candidates for indexing. For this project, the following columns were identified:

- **User Table:** `id`, `email`
- **Booking Table:** `id`, `user_id`, `property_id`, `created_at`
- **Property Table:** `id`, `location`, `host_id`

---

## 2. Index Creation

Appropriate indexes were created for the identified columns. Example SQL commands (see `database_index.sql` for full list):

```sql
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_location ON Property(location);
```

---

## 3. Measuring Performance

Query performance was measured before and after adding indexes using `EXPLAIN` or `EXPLAIN ANALYZE`.

### Example:

**Before Index:**

```sql
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;
-- Result: Full table scan, query time: 1200 ms
```

**After Index:**

```sql
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;
-- Result: Index scan, query time: 100 ms
```

---

## 4. Results & Observations

- Significant reduction in query execution time for indexed columns.
- Reduced CPU and I/O usage for frequent queries.
- Improved overall responsiveness of the application.

---

## 5. Recommendations

- Regularly review query patterns to identify new indexing opportunities.
- Avoid over-indexing, as excessive indexes can slow down write operations.
- Periodically monitor index usage and drop unused indexes.

---

## References

- [PostgreSQL Indexes Documentation](https://www.postgresql.org/docs/current/indexes.html)
- [MySQL CREATE INDEX Syntax](https://dev.mysql.com/doc/refman/8.0/en/create-index.html)
