SELECT
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings
FROM properties p
JOIN bookings b ON b.property_id = p.property_id
WHERE b.booking_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY p.property_id, p.name
ORDER BY total_bookings DESC;

EXPLAIN ANALYZE
SELECT
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings
FROM properties p
JOIN bookings b ON b.property_id = p.property_id
WHERE b.booking_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY p.property_id, p.name
ORDER BY total_bookings DESC;

-> Seq Scan on bookings  (cost=0.00..2341.00 rows=50000)
   Filter: (booking_date >= CURRENT_DATE - INTERVAL '30 days')

-- Add index to speed up date filter
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Add index to speed up join condition
CREATE INDEX idx_bookings_property_id ON bookings(property_id);


EXPLAIN ANALYZE
SELECT
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings
FROM properties p
JOIN bookings b ON b.property_id = p.property_id
WHERE b.booking_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY p.property_id, p.name
ORDER BY total_bookings DESC;

