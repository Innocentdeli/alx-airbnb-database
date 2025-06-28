# Property Booking Platform Database

This project defines a relational database schema for a property booking platform similar to Airbnb, allowing **users** to register as guests or hosts, **list properties**, **make bookings**, **process payments**, **leave reviews**, and **exchange messages**.

---

## Entities and Relationships

| Entity    | Description                                  |
|-----------|----------------------------------------------|
| `users`   | Stores all registered users (guests, hosts, admins) |
| `properties` | Property listings posted by hosts         |
| `bookings` | Records of users booking properties         |
| `payments` | Payments associated with bookings           |
| `reviews`  | User reviews for properties                 |
| `messages` | Communication between users                 |

All relationships are normalized up to **Third Normal Form (3NF)** for data integrity and efficiency.

---

## Schema Features

- **UUID Primary Keys** for all entities
- **Foreign Key Constraints** for relational integrity
- **Enumerated Fields** for roles, status, and payment methods
- **CHECK Constraints** on ratings and enums
- **Timestamps** for tracking creation and updates
- **Indexes** on foreign keys and frequently queried fields

---

## Normalization

This schema follows **3NF**:
- All attributes are atomic (1NF)
- No partial dependencies (2NF)
- No transitive dependencies (3NF)

All data fields depend directly and only on the primary key of their respective tables.

---

## Setup Instructions

1. Clone the project or copy the SQL files.
2. Run the SQL schema in your preferred RDBMS (PostgreSQL, MySQL, etc.):

   ```sql
   -- Using psql (PostgreSQL)
   \i schema.sql
