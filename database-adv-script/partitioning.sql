-- Create the parent bookings table with partitioning
DROP TABLE IF EXISTS bookings CASCADE;

CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  status VARCHAR(20)
) PARTITION BY RANGE (start_date);

-- Create partitions (e.g., by year)
CREATE TABLE bookings_2023 PARTITION OF bookings
  FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Example query to test performance
EXPLAIN ANALYZE
SELECT * 
FROM bookings 
WHERE start_date BETWEEN '2024-05-01' AND '2024-06-30';

