-- Insert Sample Theatres
INSERT INTO theatre (name, location, address, phone, email) VALUES
('PVR Nexus Forum', 'Koramangala', '154, Maharaja Complex, Koramangala 4th Block, Bangalore', '+91-80-12345678', 'nexusforum@pvr.com'),
('INOX Mantri Square', 'Malleswaram', 'Mantri Square Mall, Malleswaram, Bangalore', '+91-80-87654321', 'mantrisquare@inox.com'),
('Cinepolis Forum', 'Whitefield', 'Forum Value Mall, Whitefield, Bangalore', '+91-80-11223344', 'whitefield@cinepolis.com');

-- Insert Sample Movies
INSERT INTO movie (title, duration, genre, language, rating, release_date, description) VALUES
('Dasara', 150, 'Action/Drama', 'Telugu', 'UA', '2023-03-30', 'Action drama set in Telangana'),
('Kisi Ka Bhai Kisi Ki Jaan', 145, 'Action/Comedy', 'Hindi', 'UA', '2023-04-21', 'Action comedy film'),
('Tu Jhoothi Main Makkaar', 165, 'Romance/Comedy', 'Hindi', 'UA', '2023-03-08', 'Romantic comedy film'),
('Avatar: The Way of Water', 192, 'Sci-Fi/Adventure', 'English', 'UA', '2022-12-16', 'Sequel to Avatar');

-- Insert Sample Screens
INSERT INTO screen (theatre_id, screen_name, capacity) VALUES
(1, 'Screen 1', 200),
(1, 'Screen 2', 150),
(1, 'Screen 3', 180),
(2, 'Audi 1', 220),
(2, 'Audi 2', 160),
(3, 'Screen A', 190);

-- Insert Sample Seats (showing few examples)
INSERT INTO seat (screen_id, seat_number, seat_type, base_price) VALUES
(1, 'A1', 'Regular', 150.00),
(1, 'A2', 'Regular', 150.00),
(1, 'B1', 'Regular', 150.00),
(1, 'B2', 'Regular', 150.00),
(1, 'C1', 'Premium', 200.00),
(1, 'C2', 'Premium', 200.00);

-- Insert Sample Shows
INSERT INTO show_schedule (movie_id, screen_id, show_date, show_time, total_seats, available_seats, base_price) VALUES
-- Shows for 2023-04-25 (matching the screenshot date)
(1, 1, '2023-04-25', '10:00:00', 200, 195, 150.00),
(2, 1, '2023-04-25', '13:30:00', 200, 180, 160.00),
(2, 1, '2023-04-25', '17:00:00', 200, 165, 160.00),
(2, 1, '2023-04-25', '20:30:00', 200, 170, 180.00),
(3, 2, '2023-04-25', '11:30:00', 150, 140, 150.00),
(4, 3, '2023-04-25', '21:00:00', 180, 175, 200.00),
-- Shows for other dates
(1, 1, '2023-04-26', '10:30:00', 200, 200, 150.00),
(2, 1, '2023-04-26', '14:00:00', 200, 195, 160.00),
(3, 2, '2023-04-26', '18:00:00', 150, 150, 150.00);

-- Insert Sample Customers
INSERT INTO customer (name, email, phone) VALUES
('John Doe', 'john.doe@email.com', '+91-9876543210'),
('Jane Smith', 'jane.smith@email.com', '+91-9876543211'),
('Raj Kumar', 'raj.kumar@email.com', '+91-9876543212');

-- Insert Sample Bookings
INSERT INTO booking (customer_id, show_id, total_amount, payment_status) VALUES
(1, 1, 300.00, 'Completed'),
(2, 2, 480.00, 'Completed'),
(3, 3, 160.00, 'Pending');

-- Insert Sample Booking Seats
INSERT INTO booking_seat (booking_id, seat_id, seat_price) VALUES
(1, 1, 150.00),
(1, 2, 150.00),
(2, 3, 160.00),
(2, 4, 160.00),
(2, 5, 160.00),
(3, 6, 160.00);
