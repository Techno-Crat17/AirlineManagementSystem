

USE airlinemanagementsystem;

-- Goal: Find the top 5 flights with the highest number of active reservations.

SELECT 
    f.f_code AS FlightCode,
    f.f_name AS Airline,
    f.source AS Source,
    f.destination AS Destination,
    COUNT(r.PNR) AS ActiveBookings
FROM flight f
LEFT JOIN reservation r 
    ON f.f_code = r.flightcode
GROUP BY 
    f.f_code, 
    f.f_name, 
    f.source, 
    f.destination
ORDER BY ActiveBookings DESC
LIMIT 5;


-- Goal: Find passengers who have booked flights on 2 or more different airlines.


SELECT 
    p.aadhar AS Aadhar,
    p.name AS PassengerName,
    COUNT(DISTINCT r.flightname) AS UniqueAirlinesBooked
FROM passenger p
JOIN reservation r 
    ON p.aadhar = r.aadhar
GROUP BY 
    p.aadhar, 
    p.name
HAVING UniqueAirlinesBooked >= 2
ORDER BY UniqueAirlinesBooked DESC;



-- Goal: Calculate the cancellation rate (percentage of bookings canceled) for each flight.


SELECT 
    f.f_code AS FlightCode,
    f.f_name AS Airline,
    COUNT(DISTINCT r.PNR) AS ActiveBookings,
    COUNT(DISTINCT c.pnr) AS CancelledBookings,
    ROUND(
        (COUNT(DISTINCT c.pnr) * 100.0) / 
        NULLIF(COUNT(DISTINCT r.PNR) + COUNT(DISTINCT c.pnr), 0), 2
    ) AS CancellationRatePercentage
FROM flight f
LEFT JOIN reservation r 
    ON f.f_code = r.flightcode
LEFT JOIN cancel c 
    ON f.f_code = c.fcode
GROUP BY 
    f.f_code, 
    f.f_name;



-- Goal: Identify the most traveled city routes (Source to Destination) based on active reservations.


SELECT 
    src AS DepartureCity,
    des AS ArrivalCity,
    COUNT(PNR) AS TotalBookings
FROM reservation
GROUP BY 
    src, 
    des
ORDER BY TotalBookings DESC
LIMIT 3;


-- Goal: Find passengers who currently have an active reservation but also have at least one ticket cancellation in the history log.


SELECT DISTINCT 
    r.aadhar AS Aadhar,
    r.name AS PassengerName,
    r.PNR AS ActivePNR,
    c.cancelno AS CancellationNo
FROM reservation r
JOIN cancel c 
    ON r.name = c.name
ORDER BY r.name;

-- Goal: Get the counts and percentage distribution of Male and Female passengers booked on each flight.


SELECT 
    r.flightcode AS FlightCode,
    r.flightname AS Airline,
    SUM(CASE WHEN p.gender = 'Male' THEN 1 ELSE 0 END) AS MalePassengers,
    SUM(CASE WHEN p.gender = 'Female' THEN 1 ELSE 0 END) AS FemalePassengers,
    ROUND(SUM(CASE WHEN p.gender = 'Male' THEN 1 ELSE 0 END) * 100.0 / COUNT(r.PNR), 2) AS MalePercentage,
    ROUND(SUM(CASE WHEN p.gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(r.PNR), 2) AS FemalePercentage
FROM reservation r
JOIN passenger p 
    ON r.aadhar = p.aadhar
GROUP BY 
    r.flightcode, 
    r.flightname;


-- Goal: Rank the departure cities (sources) by the volume of active departing passengers.


SELECT 
    src AS DepartureCity,
    COUNT(PNR) AS ActiveDepartures,
    DENSE_RANK() OVER (ORDER BY COUNT(PNR) DESC) AS BusiestRank
FROM reservation
GROUP BY src;


-- Goal: Find flights that currently have zero active reservations.


SELECT 
    f.f_code AS FlightCode,
    f.f_name AS Airline,
    f.source AS Source,
    f.destination AS Destination
FROM flight f
LEFT JOIN reservation r 
    ON f.f_code = r.flightcode
WHERE r.PNR IS NULL;


-- Goal: Rank flights within each airline carrier by their total booking numbers 


SELECT 
    f.f_name AS Airline,
    f.f_code AS FlightCode,
    COUNT(r.PNR) AS BookingsCount,
    DENSE_RANK() OVER (
        PARTITION BY f.f_name 
        ORDER BY COUNT(r.PNR) DESC
    ) AS RankWithinAirline
FROM flight f
LEFT JOIN reservation r 
    ON f.f_code = r.flightcode
GROUP BY 
    f.f_name, 
    f.f_code;


-- Goal: Find the passengers who have cancelled the highest number of flights.


SELECT 
    name AS PassengerName,
    COUNT(cancelno) AS TotalCancellations
FROM cancel
GROUP BY name
ORDER BY TotalCancellations DESC
LIMIT 3;

-- Goal: Find flights carrying passengers of more than 3 distinct nationalities.


SELECT 
    flightcode AS FlightCode,
    flightname AS Airline,
    COUNT(DISTINCT nationality) AS DistinctNationalities
FROM reservation
GROUP BY 
    flightcode, 
    flightname
HAVING DistinctNationalities > 3
ORDER BY DistinctNationalities DESC;


-- Goal: Identify if multiple passenger profiles are sharing the same contact phone 
--       number (useful for finding duplicate records or family bookings).


SELECT 
    phone AS ContactNumber,
    COUNT(aadhar) AS ProfilesSharingNumber,
    GROUP_CONCAT(name ORDER BY name SEPARATOR ', ') AS SharedNames
FROM passenger
GROUP BY phone
HAVING ProfilesSharingNumber > 1;

-- Goal: Generate a unified transaction ledger showing both active reservations 
--       and past cancellations for a specific passenger name.


SELECT 
    'ACTIVE BOOKING' AS RecordStatus,
    PNR AS ReferenceID,
    flightcode AS FlightCode,
    src AS Source,
    des AS Destination,
    ddate AS TravelDate
FROM reservation
WHERE name = 'John Doe'

UNION ALL

SELECT 
    'CANCELLED TICKET' AS RecordStatus,
    cancelno AS ReferenceID,
    fcode AS FlightCode,
    '-' AS Source,
    '-' AS Destination,
    date AS TravelDate
FROM cancel
WHERE name = 'John Doe'

ORDER BY TravelDate DESC;


-- Goal: Identify which dates have the highest volume of scheduled travel bookings.


SELECT 
    ddate AS TravelDate,
    COUNT(PNR) AS ActivePassengersTravelling
FROM reservation
GROUP BY ddate
ORDER BY ActivePassengersTravelling DESC;



-- Goal: List all flights whose destinations are one of the top 3 busiest arrival 
--       cities in the database.

SELECT 
    f_code AS FlightCode,
    f_name AS Airline,
    source AS DepartureHub,
    destination AS ArrivalHub
FROM flight
WHERE destination IN (
    SELECT des
    FROM (
        SELECT des, COUNT(PNR) as booking_count
        FROM reservation
        GROUP BY des
        ORDER BY booking_count DESC
        LIMIT 3
    ) as top_cities
);
