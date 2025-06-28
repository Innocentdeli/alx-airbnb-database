# Normalization to Third Normal Form (3NF)

## Objective
Apply normalization principles to ensure the database design is in **Third Normal Form (3NF)** by removing partial, transitive, and functional dependencies.

---

## Step 1: First Normal Form (1NF)

**1NF Requirements:**
- Atomic values (no repeating groups or arrays)
- Each field contains only one value per record

✅ **Satisfied** — All attributes contain atomic values (e.g., `first_name`, `email`, `start_date`, etc.)

---

## Step 2: Second Normal Form (2NF)

**2NF Requirements:**
- Must be in 1NF
- No partial dependency on a **composite primary key**

✅ **Satisfied** — All tables use **single-column primary keys** (`UUID`), so no partial dependencies exist.

---

## Step 3: Third Normal Form (3NF)

**3NF Requirements:**
- Must be in 2NF
- No **transitive dependencies** (non-key attributes must not depend on other non-key attributes)

---

### 🔍 Table-by-Table 3NF Review

#### ✅ User
- `user_id` → all other fields
- No transitive dependencies

#### ✅ Property
- `property_id` → all fields
- `host_id` is a foreign key to User (not a non-key attribute)
- No transitive dependencies

#### ✅ Booking
- `booking_id` → all fields
- `property_id` and `user_id` are foreign keys
- `total_price` is precomputed but could be computed dynamically; however, it’s acceptable to store it for audit/history
- No transitive dependencies

#### ✅ Payment
- `payment_id` → all fields
- `booking_id` is a foreign key
- All other fields depend directly on the primary key

#### ✅ Review
- `review_id` → all fields
- `property_id` and `user_id` are foreign keys
- `rating` and `comment` are atomic
- No transitive dependencies

#### ✅ Message
- `message_id` → all fields
- `sender_id` and `recipient_id` are both foreign keys
- `message_body` and `sent_at` depend on the message

---

## ✅ Conclusion

All tables are in **Third Normal Form (3NF)**:
- No repeating groups or multivalued fields (1NF)
- No partial dependencies (2NF)
- No transitive dependencies (3NF)

**No further normalization needed.**

