# Database Normalization (Up to 3NF)

## Objective
The objective of this document is to review the Airbnb database schema and apply normalization principles to ensure that the database is in **Third Normal Form (3NF)**. This reduces redundancy, avoids update anomalies, and ensures data integrity.

---

## Step 1: First Normal Form (1NF)

**Requirement:**  
- Eliminate repeating groups.  
- Ensure each column contains atomic (indivisible) values.  
- Each row must be unique.

**Applied to our schema:**  

- All attributes (e.g., `first_name`, `last_name`, `email`, `address`, etc.) are atomic.  
- Every table has a primary key (`user_id`, `property_id`, `booking_id`, etc.).  
- No repeating groups (e.g., multiple emails or phone numbers in a single column).  

---

## Step 2: Second Normal Form (2NF)
**Requirement:**  

- Must be in 1NF.  
- No partial dependency (i.e., no attribute should depend on only part of a composite primary key).  

**Applied to our schema:**  
- Most tables use a single-column primary key (surrogate keys like `user_id`, `property_id`, etc.).  
- For example:  
  - `Booking` table has a single PK (`booking_id`). Attributes like `start_date`, `end_date`, `total_price` depend entirely on `booking_id`.  
  - No non-key attribute depends on part of a composite key.  

---

## Step 3: Third Normal Form (3NF)
**Requirement:**  

- Must be in 2NF.  
- No transitive dependencies (non-key attributes should not depend on other non-key attributes).  

**Applied to our schema:**  

- **User Table**: No transitive dependencies (e.g., `email` → `phone_number` does not exist).  
- **Property Table**: Attributes like `city` and `country` are descriptive but do not depend on each other. If we want to avoid redundancy (e.g., multiple properties in the same city/country), we could normalize further into a separate `Location` table.  
- **Booking Table**: `total_price` is derived from `price_per_night × number_of_nights`. For strict 3NF, derived attributes should not be stored but calculated.  
- **Payment Table**: Attributes depend only on `payment_id` and `booking_id`.  
- **Review Table**: Attributes depend only on `review_id`.  

After review, the schema is in **3NF**.  
⚡ Optional refinement: Extract a `Location` entity (`location_id`, `city`, `country`) referenced by `Property` to minimize redundancy.

---

## Final Notes

- The database design is now in **Third Normal Form (3NF)**.  
- Redundancies were identified in the `Property` table (`city`, `country`) and can be factored into a `Location` table if desired.  
- Derived attributes like `total_price` can be excluded from storage and computed dynamically to maintain normalization.

---

## Deliverables
- `normalization.md` (this file)  
- Updated ER diagram (`ERD/airbnb_erd.png`) if a new `Location` table is introduced
