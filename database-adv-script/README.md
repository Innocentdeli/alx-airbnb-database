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
