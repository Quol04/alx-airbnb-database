-- Airbnb Database Seed Data
-- Author: [Your Name]
-- Repository: alx-airbnb-database
-- Description: Sample INSERT statements for Users, Property, Booking, Payment, and Review

-- ==========================
-- Users
-- ==========================
INSERT INTO Users (first_name, last_name, email, phone_number, password)
VALUES 
('Alice', 'Johnson', 'alice@example.com', '+254700111222', 'hashedpassword1'),
('Bob', 'Smith', 'bob@example.com', '+254700333444', 'hashedpassword2'),
('Carol', 'Wanjiku', 'carol@example.com', '+254700555666', 'hashedpassword3'),
('David', 'Omondi', 'david@example.com', '+254700777888', 'hashedpassword4');

-- ==========================
-- Property
-- ==========================
INSERT INTO Property (user_id, title, description, address, city, country, price_per_night)
VALUES
(1, 'Cozy Apartment in Nairobi', '2-bedroom fully furnished apartment with WiFi', '123 Riverside Drive', 'Nairobi', 'Kenya', 50.00),
(2, 'Beach House Mombasa', 'Oceanfront beach house with 3 bedrooms', 'Diani Beach Road', 'Mombasa', 'Kenya', 120.00),
(3, 'Studio in Kisumu', 'Affordable studio apartment near CBD', '567 Lakeview St', 'Kisumu', 'Kenya', 30.00),
(1, 'Modern Loft in Nakuru', 'Stylish loft apartment near town center', '89 Market Rd', 'Nakuru', 'Kenya', 45.00);

-- ==========================
-- Booking
-- ==========================
INSERT INTO Booking (user_id, property_id, start_date, end_date, total_price, booking_status)
VALUES
(2, 1, '2025-09-10', '2025-09-15', 250.00, 'confirmed'),
(3, 2, '2025-10-01', '2025-10-05', 480.00, 'pending'),
(4, 3, '2025-09-20', '2025-09-22', 60.00, 'confirmed'),
(1, 2, '2025-11-01', '2025-11-07', 720.00, 'cancelled');

-- ==========================
-- Payment
-- ==========================
INSERT INTO Payment (booking_id, payment_method, amount, status, paid_at)
VALUES
(1, 'credit_card', 250.00, 'paid', '2025-09-01 10:00:00'),
(2, 'mobile_money', 200.00, 'partial', '2025-09-25 09:00:00'),
(3, 'credit_card', 60.00, 'paid', '2025-09-15 14:00:00');

-- ==========================
-- Review
-- ==========================
INSERT INTO Review (booking_id, user_id, rating, comment)
VALUES
(1, 2, 5, 'Amazing stay! The host was very helpful.'),
(3, 4, 4, 'Great location, but the WiFi was slow.');
