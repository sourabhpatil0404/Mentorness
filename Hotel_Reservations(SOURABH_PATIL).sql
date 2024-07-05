# Database name is internship
# Table name is hotel_r

# 1st Created database for importing Data
CREATE database Internship; 
use internship;

# Overlooking dataset
select * from hotel_r;

# 1)What is the total number of reservations in the dataset?
	SELECT count(Booking_ID) FROM hotel_r;

# 2)Which meal plan is the most popular among guests?
    SELECT type_of_meal_plan, COUNT(*) AS total FROM hotel_r
    GROUP BY type_of_meal_plan
    ORDER BY total DESC
    LIMIT 1;
    
# 3)What is the average price per room for reservations involving children?
    SELECT AVG(avg_price_per_room) AS With_children FROM hotel_r
    WHERE no_of_children > 0;
  
# 4)How many reservations were made for the year 20XX (replace XX with the desired year)?
    SELECT COUNT(*) AS total_reservations FROM hotel_r
    WHERE YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2017;
    
# 5)What is the most commonly booked room type?    
    SELECT room_type_reserved, COUNT(*) AS booking_count FROM hotel_r
    GROUP BY room_type_reserved
    ORDER BY booking_count DESC
    LIMIT 1;
    
# 6)How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
    SELECT COUNT(*) AS weekend_reservations FROM hotel_r
    WHERE no_of_weekend_nights > 0;
    
# 7)What is the highest and lowest lead time for reservations?    
    SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
    FROM hotel_r;

# 8)What is the most common market segment type for reservations?
   SELECT market_segment_type, COUNT(*) AS segment_count FROM hotel_r
   GROUP BY market_segment_type
   ORDER BY segment_count DESC
   LIMIT 1;

# 9)How many reservations have a booking status of "Confirmed"?
   SELECT COUNT(*) AS confirmed_reservations_count FROM hotel_r
   WHERE booking_status = 'Confirmed';
   
# 10)What is the total number of adults and children across all reservations?
   SELECT 
    SUM(no_of_adults) AS total_adults,
    SUM(no_of_children) AS total_children
   FROM hotel_r;
   
# 11)What is the average number of weekend nights for reservations involving children?
   SELECT avg(no_of_weekend_nights) FROM hotel_r
   WHERE no_of_children >0;
   
# 12)How many reservations were made in each month of the year?
   SELECT 
    EXTRACT(MONTH FROM arrival_date) AS month,
    COUNT(*) AS reservations_count
   FROM hotel_r
   GROUP BY EXTRACT(MONTH FROM arrival_date)
   ORDER BY month;

# 13)What is the average number of nights (both weekend and weekday) spent by guests for each room type?
   SELECT room_type_reserved, AVG(no_of_weekend_nights + no_of_week_nights) AS avg_nights_spent
   FROM hotel_r
   GROUP BY room_type_reserved;
   
# 14)For reservations involving children, what is the most common room type, and what is the average price for that room type?   
   SELECT room_type_reserved, COUNT(*) AS reservation_count FROM hotel_r
   WHERE no_of_children > 0
   GROUP BY room_type_reserved
   ORDER BY reservation_count DESC
   LIMIT 1;

# 15)Find the market segment type that generates the highest average price per room.
   SELECT market_segment_type, AVG(avg_price_per_room) AS avg_price FROM hotel_r
   GROUP BY market_segment_type
   ORDER BY avg_price DESC
   LIMIT 1;








