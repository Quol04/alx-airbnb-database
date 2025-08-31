# Airbnb Database Schema

## Overview
This directory contains the SQL schema for the **Airbnb database**.  
The schema is designed to be in **Third Normal Form (3NF)** to reduce redundancy and ensure data integrity.

## Entities
- **Users** – stores user details (guests and hosts).  
- **Property** – stores property listings.  
- **Booking** – stores booking records.  
- **Payment** – stores payment details.  
- **Review** – stores user reviews after completed bookings.  

## Features
- Primary keys and foreign key constraints for referential integrity.  
- Unique constraints on user email and phone numbers.  
- Indexes on frequently searched columns (e.g., city, country, user_id, property_id).  
- Check constraints on rating to ensure values are between 1 and 5.  
- Cascading deletes to maintain consistency when parent records are removed.  

## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/alx-airbnb-database.git
   cd alx-airbnb-database/database-script-0x01
