# Entity-Relationship (ER) Diagram for Airbnb Database

## Objective
The purpose of this document is to outline the entities, attributes, and relationships for the **Airbnb database** and provide a visual ER diagram.

---

## Entities and Attributes

### 1. User

- **user_id**: Primary Key, UUID, Indexed
- first_name: VARCHAR, NOT NULL
- last_name: VARCHAR, NOT NULL
- email: VARCHAR, UNIQUE, NOT NULL
- password_hash: VARCHAR, NOT NULL
- phone_number: VARCHAR, NULL
- role: ENUM (guest, host, admin), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 2. Property

- **property_id** (PK)
- user_id (FK → User.user_id)
- property_id: Primary Key, UUID, Indexed
- host_id: Foreign Key, references User(user_id)
- name: VARCHAR, NOT NULL
- description: TEXT, NOT NULL
- location: VARCHAR, NOT NULL
- pricepernight: DECIMAL, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP


### 3. Booking

- **booking_id** (PK)
- user_id (FK → User.user_id)
- property_id (FK → Property.property_id)
- booking_id: Primary Key, UUID, Indexed
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- start_date: DATE, NOT NULL
- end_date: DATE, NOT NULL
- total_price: DECIMAL, NOT NULL
- status: ENUM (pending, confirmed, canceled), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 4. Review

- **review_id** (PK)
- booking_id (FK → Booking.booking_id)
- user_id (FK → User.user_id)
- review_id: Primary Key, UUID, Indexed
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- comment: TEXT, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 5. Payment

- **payment_id** (PK)
- booking_id (FK → Booking.booking_id)
- payment_id: Primary Key, UUID, Indexed
- booking_id: Foreign Key, references Booking(booking_id)
- amount: DECIMAL, NOT NULL
- payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

### 6. Message
- message_id: Primary Key, UUID, Indexed
- sender_id: Foreign Key, references User(user_id)
- recipient_id: Foreign Key, references User(user_id)
- message_body: TEXT, NOT NULL
- sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Relationships

1. **User – Booking**
   - A user can make many bookings.
   - A booking belongs to one user.
   - (1-to-Many)

2. **Property – Booking**
   - A property can have many bookings.
   - A booking belongs to one property.
   - (1-to-Many)

3. **User – Property**
   - A user (host) can list many properties.
   - A property belongs to one user.
   - (1-to-Many)

4. **Booking – Review**
   - A booking can have one review.
   - A review belongs to one booking.
   - (1-to-1)

5. **Booking – Payment**
   - A booking can have many payments (e.g., partial payments).
   - A payment belongs to one booking.
   - (1-to-Many)

---



