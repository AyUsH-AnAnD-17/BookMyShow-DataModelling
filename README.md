# BookMyShow Database Schema

A comprehensive database design for a movie ticketing platform similar to BookMyShow, featuring normalized tables, efficient queries, and production-ready SQL scripts.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Database Schema](#database-schema)
- [Entity Relationship](#entity-relationship)
- [Normalization](#normalization)
- [SQL Scripts](#sql-scripts)

## 🎬 Overview

This project provides a complete database schema for a movie ticketing platform that handles:
- Multiple theatres with multiple screens
- Movie scheduling and show management
- Customer booking and seat reservation
- Flexible pricing models
- Real-time seat availability tracking

## ✨ Features

- **🏛️ Multi-Theatre Support**: Manage multiple theatre locations  
- **🎭 Movie Management**: Store movie details with ratings, languages, and genres  
- **🎫 Show Scheduling**: Flexible show timing and date management  
- **💺 Seat Management**: Individual seat tracking with different pricing tiers  
- **👥 Customer Management**: User registration and booking history  
- **💳 Booking System**: Complete booking workflow with payment status  
- **📊 Reporting**: Built-in queries for analytics and reporting  
- **🔒 Data Integrity**: Foreign key constraints and validation rules  

## 🗄️ Database Schema

### Core Entities

| Entity          | Description                     | Key Attributes                                 |
|-----------------|---------------------------------|------------------------------------------------|
| **Theatre**     | Cinema locations                | name, location, address, contact               |
| **Movie**       | Film information                | title, duration, genre, language, rating       |
| **Screen**      | Individual screens within theatres | screen_name, capacity                      |
| **Seat**        | Individual seats within screens | seat_number, seat_type, price                  |
| **Show**        | Movie screenings                | show_date, show_time, pricing                  |
| **Customer**    | User accounts                   | name, email, phone                             |
| **Booking**     | Ticket reservations             | booking_date, total_amount, status             |
| **Booking_Seat**| Seat assignments                | booking-seat relationships                     |

---

## 🏗️ Entity Relationship

### Primary Relationships
- Theatre → Screen (1:N)  
- Screen → Seat (1:N)  
- Movie → Show (1:N)  
- Screen → Show (1:N)  
- Customer → Booking (1:N)  
- Show → Booking (1:N)  
- Booking ↔ Seat (M:N via Booking_Seat)  

### Key Constraints
- Each show must have a unique combination of screen, date, and time  
- Seats are unique within each screen  
- Bookings track payment status and total amount  
- Available seats are updated in real-time  

## 📐 Normalization

### Compliance Levels
- **1NF ✅**: Atomic values, no repeating groups  
- **2NF ✅**: No partial dependencies  
- **3NF ✅**: No transitive dependencies  
- **BCNF ✅**: Every determinant is a candidate key  

### Benefits of Normalization
- **Data Integrity**  
- **Storage Efficiency**  
- **No Update Anomalies**  
- **Scalability**

---

### 🔹 SQL Scripts

- [x] Table creation
- [x] Sample data insertion
- [x] Query to fetch all shows at a given theatre on a specific date

```sql
-- Sample Query
SELECT 
    m.title AS movie_title,
    m.language,
    m.rating,
    s.show_time,
    s.available_seats,
    s.total_seats,
    s.base_price,
    sc.screen_name
FROM show_schedule s
JOIN movie m ON s.movie_id = m.movie_id
JOIN screen sc ON s.screen_id = sc.screen_id
JOIN theatre t ON sc.theatre_id = t.theatre_id
WHERE t.name = 'PVR Nexus Forum' 
  AND s.show_date = '2023-04-25'
ORDER BY s.show_time;
