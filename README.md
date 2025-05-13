# BookMyShow-DataModelling
Book My Show database modelling scenario with entities and attributes. Also, SQL queries.
## 📌 Problem Statement

Design a relational database for a ticketing platform where:
- Users can view show listings for a selected theatre and date.
- The system should display all movies running in the theatre along with show timings.

## 📦 Deliverables

### 🔹 Part 1: Database Design
- Entities: Theatre, Movie, Screen, Show
- Normalized up to BCNF
- ER Diagram created in Draw.io

### 🔹 Entity Attributes

#### 🎭 Theatre
- `theatre_id` (PK)
- `name`
- `location`

#### 🖥️ Screen
- `screen_id` (PK)
- `theatre_id` (FK)
- `screen_number`
- `capacity`

#### 🎬 Movie
- `movie_id` (PK)
- `title`
- `language`
- `duration_minutes`
- `genre`

#### ⏰ Show
- `show_id` (PK)
- `movie_id` (FK)
- `screen_id` (FK)
- `show_date`
- `show_time`

---

### 🔹 SQL Scripts

- [x] Table creation
- [x] Sample data insertion
- [x] Query to fetch all shows at a given theatre on a specific date

```sql
-- Sample Query
SELECT 
    s.show_id, m.title AS movie_title, sc.screen_number, s.show_time
FROM Show s
JOIN Movie m ON s.movie_id = m.movie_id
JOIN Screen sc ON s.screen_id = sc.screen_id
JOIN Theatre t ON sc.theatre_id = t.theatre_id
WHERE 
    s.show_date = '2025-05-13' AND
    t.name = 'PVR Phoenix';
