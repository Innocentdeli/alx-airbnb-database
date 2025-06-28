-- =====================
-- USERS
-- =====================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('uuid-1001', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '555-1111', 'host'),
  ('uuid-1002', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '555-2222', 'guest'),
  ('uuid-1003', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw_3', '555-3333', 'guest'),
  ('uuid-1004', 'Diana', 'Adams', 'diana@example.com', 'hashed_pw_4', '555-4444', 'host');

-- =====================
-- PROPERTIES
-- =====================
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('prop-2001', 'uuid-1001', 'Cozy Cottage', 'A quiet place in the woods', 'Asheville, NC', 120.00),
  ('prop-2002', 'uuid-1004', 'Downtown Loft', 'Modern apartment downtown', 'Austin, TX', 175.00),
  ('prop-2003', 'uuid-1001', 'Beach House', 'Oceanfront view with pool', 'Malibu, CA', 300.00);

-- =====================
-- BOOKINGS
-- =====================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('book-3001', 'prop-2001', 'uuid-1002', '2025-07-01', '2025-07-04', 360.00, 'confirmed'),
  ('book-3002', 'prop-2002', 'uuid-1003', '2025-07-10', '2025-07-12', 350.00, 'pending'),
  ('book-3003', 'prop-2003', 'uuid-1002', '2025-08-01', '2025-08-05', 1200.00, 'confirmed');

-- =====================
-- PAYMENTS
-- =====================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('pay-4001', 'book-3001', 360.00, 'credit_card'),
  ('pay-4002', 'book-3003', 1200.00, 'paypal');

-- =====================
-- REVIEWS
-- =====================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('rev-5001', 'prop-2001', 'uuid-1002', 5, 'Fantastic cottage with peaceful surroundings!'),
  ('rev-5002', 'prop-2002', 'uuid-1003', 4, 'Nice apartment but a bit noisy at night.');

-- =====================
-- MESSAGES
-- =====================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('msg-6001', 'uuid-1002', 'uuid-1001', 'Hi, is the cottage available in July?'),
  ('msg-6002', 'uuid-1001', 'uuid-1002', 'Yes! It is available from July 1 to 4.'),
  ('msg-6003', 'uuid-1003', 'uuid-1004', 'Can I check in early at the loft?');

