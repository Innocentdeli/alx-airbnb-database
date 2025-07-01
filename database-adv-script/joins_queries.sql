#Inner join
SELECT 
  bookings.booking_id,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date,
  bookings.total_price,
  bookings.status,
  bookings.created_at AS booking_created_at,
  users.user_id,
  users.first_name,
  users.last_name,
  users.email
FROM 
  bookings
INNER JOIN 
  users ON bookings.user_id = users.user_id;

#Left Join
SELECT 
  properties.property_id,
  properties.name AS property_name,
  properties.description,
  properties.location,
  properties.pricepernight,
  reviews.review_id,
  reviews.user_id AS reviewer_id,
  reviews.rating,
  reviews.comment,
  reviews.created_at AS review_date
FROM
  properties
LEFT JOIN
  reviews ON properties.property_id = reviews.property_id
ORDER BY
  reviews.created_at DESC;


#Full outer join
SELECT 
  users.user_id,
  users.first_name,
  users.last_name,
  users.email,
  bookings.booking_id,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date,
  bookings.total_price,
  bookings.status
FROM 
  users
FULL OUTER JOIN 
  bookings ON users.user_id = bookings.user_id;

