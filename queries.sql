-- Query to get all shows for a specific date and theatre
-- Parameters: theatre_name = 'PVR Nexus Forum', show_date = '2023-04-25'

SELECT 
    m.title AS movie_title,
    m.language,
    m.rating,
    m.duration,
    s.show_time,
    s.available_seats,
    s.total_seats,
    s.base_price,
    sc.screen_name,
    CONCAT(s.available_seats, '/', s.total_seats) AS seat_availability
FROM show_schedule s
JOIN movie m ON s.movie_id = m.movie_id
JOIN screen sc ON s.screen_id = sc.screen_id
JOIN theatre t ON sc.theatre_id = t.theatre_id
WHERE t.name = 'PVR Nexus Forum' 
  AND s.show_date = '2023-04-25'
ORDER BY s.show_time;
