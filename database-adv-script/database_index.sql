-- Indexes on Users table
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_users_email ON users(email);

-- Indexes on Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Indexes on Properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);


EXPLAIN ANALYZE
SELECT p.property_id, COUNT(*) 
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
GROUP BY p.property_id
ORDER BY COUNT(*) DESC;

