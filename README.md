# ALX Airbnb Database

## 📌 Overview
This repository contains the design and implementation of a relational database for an **Airbnb-clone platform**.  
The project demonstrates concepts of **requirement analysis, ER modeling, database normalization, SQL schema design, and seeding sample data**.  

It is organized into multiple directories, each focusing on a specific stage of database development.

---

## 📖 Project Stages

### 1. **Requirement Analysis & ERD**
- Identified entities: **User, Property, Booking, Payment, Review**  
- Defined attributes and relationships.  
- Created an **ER Diagram** (`ERD/airbnb_erd.png`) for visualization.  

### 2. **Normalization**
- Ensured the schema adheres to **Third Normal Form (3NF)**.  
- Eliminated redundancies and transitive dependencies.  
- Considered optional optimization with a `Location` table.  

### 3. **Database Schema (DDL)**
- SQL `CREATE TABLE` scripts with:
  - Primary keys, foreign keys, and unique constraints.  
  - Indexes for query optimization.  
  - Check constraints (e.g., review rating 1–5).  
  - Cascading deletes for referential integrity.  

### 4. **Seed Data (DML)**
- Inserted realistic sample data:
  - Multiple users, properties, and bookings.  
  - Payments (full and partial).  
  - Reviews linked to bookings.  

---

## 🚀 Getting Started

### Prerequisites
- PostgreSQL installed on your system.  
- A database created for this project (e.g., `airbnb_db`).  

### Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/alx-airbnb-database.git
   cd alx-airbnb-database


