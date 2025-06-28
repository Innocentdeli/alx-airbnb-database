#  Sample Data for Property Booking Database

This file contains **realistic sample data** to populate the Property Booking Platform database. It can be used to test queries, build demo interfaces, or validate schema relationships.

---

##  File

- **Filename:** `sample_data.sql`
- **Purpose:** Populate the following tables with test records:
  - `users`
  - `properties`
  - `bookings`
  - `payments`
  - `reviews`
  - `messages`

---

##  Sample Data Overview

###  Users
- 4 users in total: 2 hosts and 2 guests
- Includes names, emails, phone numbers, and hashed passwords

###  Properties
- 3 listings: a cottage, a loft, and a beach house
- Each property is linked to a host (`users.role = 'host'`)

###  Bookings
- 3 bookings linked to different users and properties
- Includes both `confirmed` and `pending` statuses

###  Payments
- Payments for confirmed bookings only
- Multiple payment methods used (credit card, PayPal)

###  Reviews
- Each review has a `rating` and `comment`
- Linked to a property and a guest

###  Messages
- Direct messages between guests and hosts
- Includes timestamps and message bodies

---

##  How to Use

1. Ensure you’ve already created the schema with `schema.sql`.
2. Run the sample data script in your SQL environment:

```sql
-- PostgreSQL
\i seed.sql

-- or MySQL
source seed.sql;
