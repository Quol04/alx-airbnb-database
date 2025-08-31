# Airbnb Database Seed Data

## Overview
This directory contains SQL scripts to **populate the Airbnb database with sample data** for testing and development.

## Entities Seeded

- **Users** – 4 users (Alice, Bob, Carol, David)  
- **Property** – 4 properties across different Kenyan cities  
- **Booking** – 4 bookings with different statuses (confirmed, pending, cancelled)  
- **Payment** – sample payments, including full and partial payments  
- **Review** – reviews linked to completed bookings  

## How to Use

1. Make sure the database schema is already created:
   ```bash
   psql -U <username> -d <database> -f ../database-script-0x01/schema.sql
