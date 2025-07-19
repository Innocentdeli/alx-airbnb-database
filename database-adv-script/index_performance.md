EXPLAIN ANALYZE
SELECT p.property_id, COUNT(*) 
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
GROUP BY p.property_id
ORDER BY COUNT(*) DESC;

