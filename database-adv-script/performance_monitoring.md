# Database Performance Monitoring

This document outlines strategies and tools for monitoring, analyzing, and improving the performance of your database. Regular performance monitoring helps identify bottlenecks and ensures your database runs efficiently.

---

## 1. Monitoring Tools & Commands

Use the following SQL commands and tools to monitor query and database performance:

- **SHOW PROFILE**: Provides detailed information about resource usage for individual queries (MySQL).
- **EXPLAIN / EXPLAIN ANALYZE**: Shows the execution plan for a query, helping to identify slow operations and potential optimizations.
- **SHOW PROCESSLIST**: Lists currently running queries and their status.
- **pg_stat_statements**: (PostgreSQL) Extension for tracking execution statistics of all SQL statements.
- **Performance Schema**: (MySQL) Provides insight into server execution at a low level.

## 2. Steps for Performance Monitoring

1. **Identify Frequently Used Queries**

   - Focus on SELECT, UPDATE, or JOIN queries that are run often or take significant time.

2. **Analyze Query Performance**

   - Use `EXPLAIN` or `EXPLAIN ANALYZE` to review the execution plan.
   - Use `SHOW PROFILE` (MySQL) to get resource usage details.

3. **Monitor Server Metrics**
   - Track CPU, memory, disk I/O, and network usage.
   - Use database dashboards or monitoring tools (e.g., Grafana, Prometheus).

## 3. Identifying Bottlenecks

- Look for full table scans, missing indexes, or inefficient joins in execution plans.
- Monitor slow query logs for queries exceeding acceptable thresholds.
- Check for locking/contention issues or high resource usage.

## 4. Optimization Strategies

- **Add Indexes**: Create indexes on columns used in WHERE, JOIN, or ORDER BY clauses.
- **Schema Adjustments**: Normalize or denormalize tables as needed for query patterns.
- **Query Refactoring**: Rewrite queries for efficiency (e.g., avoid subqueries, use JOINs appropriately).
- **Partitioning**: Split large tables into partitions to improve query speed.

## 5. Reporting Improvements

After implementing changes:

- Re-run the monitored queries and compare execution times and resource usage.
- Document the before-and-after metrics (e.g., query time reduced from 5s to 1s).
- Summarize the impact of each change (e.g., new index reduced full table scan occurrences).

---

## Example Workflow

1. Use `EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 123;`
2. Notice a full table scan in the plan.
3. Add an index: `CREATE INDEX idx_user_id ON bookings(user_id);`
4. Re-run `EXPLAIN ANALYZE` and observe improved performance.
5. Record the improvement in this document.

---

