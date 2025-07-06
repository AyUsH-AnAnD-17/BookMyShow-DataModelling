-- Create Database
CREATE DATABASE IF NOT EXISTS bookmyshow;
USE bookmyshow;

-- 1. Theatre Table
CREATE TABLE theatre (
    theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Movie Table
CREATE TABLE movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    duration INT NOT NULL COMMENT 'Duration in minutes',
    genre VARCHAR(50),
    language VARCHAR(30) NOT NULL,
    rating VARCHAR(10) COMMENT 'U, UA, A, etc.',
    release_date DATE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Screen Table
CREATE TABLE screen (
    screen_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_id INT NOT NULL,
    screen_name VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id) ON DELETE CASCADE,
    UNIQUE KEY unique_screen_per_theatre (theatre_id, screen_name)
);

-- 4. Seat Table
CREATE TABLE seat (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    screen_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    seat_type ENUM('Regular', 'Premium', 'VIP') DEFAULT 'Regular',
    base_price DECIMAL(8,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (screen_id) REFERENCES screen(screen_id) ON DELETE CASCADE,
    UNIQUE KEY unique_seat_per_screen (screen_id, seat_number)
);

-- 5. Show Table
CREATE TABLE show_schedule (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    screen_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    total_seats INT NOT NULL,
    available_seats INT NOT NULL,
    base_price DECIMAL(8,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (screen_id) REFERENCES screen(screen_id) ON DELETE CASCADE,
    UNIQUE KEY unique_show_per_screen (screen_id, show_date, show_time)
);

-- 6. Customer Table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 7. Booking Table
CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    show_id INT NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_status ENUM('Pending', 'Completed', 'Failed', 'Refunded') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (show_id) REFERENCES show_schedule(show_id) ON DELETE CASCADE
);

-- 8. Booking_Seat Junction Table
CREATE TABLE booking_seat (
    booking_id INT NOT NULL,
    seat_id INT NOT NULL,
    seat_price DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (booking_id, seat_id),
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (seat_id) REFERENCES seat(seat_id) ON DELETE CASCADE
);
