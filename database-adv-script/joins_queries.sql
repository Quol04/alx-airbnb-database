-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.id;


-- Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

SELECT 
    p.id AS property_id,
    p.title,
    r.id AS review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r
    ON p.id = r.property_id
ORDER BY p.id;


-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN bookings b
    ON u.id = b.user_id;

-- For databases that do not support FULL OUTER JOIN, you can achieve similar results using a UNION of LEFT JOIN and RIGHT JOIN:
-- SELECT 
--     u.id AS user_id,
--     u.name AS user_name,
--     b.id AS booking_id,
--     b.start_date,
--     b.end_date
-- FROM users u
-- LEFT JOIN bookings b
--     ON u.id = b.user_id

-- UNION

-- SELECT 
--     u.id AS user_id,
--     u.name AS user_name,
--     b.id AS booking_id,
--     b.start_date,
--     b.end_date
-- FROM users u
-- RIGHT JOIN bookings b
--     ON u.id = b.user_id;
