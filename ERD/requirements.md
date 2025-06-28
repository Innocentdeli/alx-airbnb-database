# ER Diagram Description

## Entities

### User
- user_id (PK)
- first_name
- last_name
- email (UNIQUE)
- password_hash
- phone_number
- role (ENUM: guest, host, admin)
- created_at

### Property
- property_id (PK)
- host_id (FK → User.user_id)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### Booking
- booking_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- start_date
- end_date
- total_price
- status (ENUM: pending, confirmed, canceled)
- created_at

### Payment
- payment_id (PK)
- booking_id (FK → Booking.booking_id)
- amount
- payment_date
- payment_method (ENUM: credit_card, paypal, stripe)

### Review
- review_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- rating (1–5)
- comment
- created_at

### Message
- message_id (PK)
- sender_id (FK → User.user_id)
- recipient_id (FK → User.user_id)
- message_body
- sent_at

## Relationships

- **User** 1 — * M **Property** (host owns many properties)
- **User** 1 — * M **Booking** (user books many properties)
- **Property** 1 — * M **Booking**
- **Booking** 1 — 1 **Payment**
- **User** 1 — * M **Review**
- **Property** 1 — * M **Review**
- **User** 1 — * M **Message** (as sender and recipient)

