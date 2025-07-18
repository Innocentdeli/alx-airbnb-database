-- Rank properties by total number of bookings
SELECT
  property_id,
  COUNT(*) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;


-- Using ROW_NUMBER() to rank properties after aggregation
SELECT
  property_id,
  total_bookings,
  ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
  SELECT
    property_id,
    COUNT(*) AS total_bookings
  FROM bookings
  GROUP BY property_id
) AS property_bookings;


