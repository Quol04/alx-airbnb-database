-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT 
    p.id,
    p.title,
    p.location
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);


-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT 
    u.id,
    u.name,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
-- Write a query to find properties that have never been booked using a subquery.
-- SELECT 
--     p.id,
--     p.title,
--     p.location
-- FROM properties p
-- WHERE p.id NOT IN (
--     SELECT b.property_id
--     FROM bookings b
-- );  