# 📘 SQL JOIN Summary – Booking System

This summary outlines how different SQL JOIN types are used across key tables (`users`, `bookings`, `properties`, `reviews`) in a property booking platform.

---

###  1. INNER JOIN – Users & Bookings

**Purpose:** Get all bookings with their associated users (only matched records).

```sql
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
```

✅ Returns only bookings that have a matching user.

---

###  2. LEFT JOIN – Properties & Reviews

**Purpose:** Get all properties and their reviews, **including** those with no reviews.

```sql
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
  reviews ON properties.property_id = reviews.property_id;
```

✅ Ensures every property appears; unmatched reviews show as `NULL`.

---

###  3. FULL OUTER JOIN – Users & Bookings

**Purpose:** Show **all users** and **all bookings**, even if no match exists between them.

```sql
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
```

✅ Includes:

* Users with no bookings
* Bookings not linked to any user

> ⚠️ **MySQL users:** Use this **UNION workaround** since `FULL OUTER JOIN` isn't supported:

```sql
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
LEFT JOIN
  bookings ON users.user_id = bookings.user_id

UNION

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
  bookings
LEFT JOIN
  users ON users.user_id = bookings.user_id
WHERE
  users.user_id IS NULL;
```

---

# 📘 SQL Subqueries: Correlated and Non-Correlated

This document explains how to write and understand **non-correlated** and **correlated** subqueries in SQL, including the use of the `IN` clause.

---

##  1. Non-Correlated Subquery – Properties with High Ratings

###  Objective:

Find all properties where the **average rating is greater than 4.0**.

###  Simple Explanation:

* First, look at the `reviews` table.
* For each `property_id`, calculate the average rating.
* Keep only property\_ids with an average above 4.
* Then go to the `properties` table and return details for only those matching property IDs.

###  Query:

```sql
SELECT property_id, name, location, pricepernight
FROM properties
WHERE property_id IN (
  SELECT property_id
  FROM reviews
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);
```

###  What is `IN` Doing?

The `IN` clause checks if a value (here, `property_id`) exists **in the list of values** returned by the subquery.

> It's like asking: "Is this property in the list of highly-rated properties?"

---

##  2. Correlated Subquery – Users with More Than 3 Bookings

###  Objective:

Find all users who have made **more than 3 bookings**.

###  Simple Explanation:

* Go through each user.
* For that user, count how many bookings they made by checking the `bookings` table.
* If that number is greater than 3, show that user.

###  Query:

```sql
SELECT user_id, first_name, last_name, email
FROM users u
WHERE (
  SELECT COUNT(*)
  FROM bookings b
  WHERE b.user_id = u.user_id
) > 3;
```

