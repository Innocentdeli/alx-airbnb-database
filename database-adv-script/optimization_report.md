-- Refactored version of the same query

SELECT
  b.booking_id,
  b.booking_date,
  u.name AS user_name,
  p.name AS property_name,
  pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
-- Optional: Add date filter to reduce data scanned
-- WHERE b.booking_date >= CURRENT_DATE - INTERVAL '30 days'
ORDER BY b.booking_date DESC
LIMIT 100;

