-- Drop the database if it already exists
DROP DATABASE IF EXISTS sql_ETL_cities;

-- Create the database
CREATE DATABASE sql_ETL_cities;

-- Use the database
USE sql_ETL_cities;

-- Create the 'cities' table
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
    city VARCHAR(255) NOT NULL, -- Name of the city
    latitude FLOAT, -- Latitude of the city
    longitude FLOAT, -- Longitude of the city
    country VARCHAR(255), -- Name of the city's country
    PRIMARY KEY (city_id) -- Primary key to uniquely identify each city
);

-- Create the 'populations' table
CREATE TABLE populations (
    city_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
	population INT, -- number for population
    timestamp_population DATE, -- When the data was retrieved
    PRIMARY KEY (city_id), -- Primary key to uniquely identify each book
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to connect the population to the cities
);

-- Create 'weathers' table
CREATE TABLE weathers(
	weather_entry_id INT AUTO_INCREMENT NOT NULL, -- Automatically generated for each weather entry
    city_id INT NOT NULL, -- ID for each city
    forecast_time DATETIME, -- Date and time of the forecast
    temperature FLOAT, -- temperature of the forecast
    feels_like FLOAT, -- what the temperature feels like
    forecast VARCHAR(255), -- weather forecast
    rain FLOAT, -- whether it has rained or not and how much in mm
    wind FLOAT, -- wind speed
    PRIMARY KEY (weather_entry_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- foreign key to connect weather data to cities
);

-- Create 'airports' table
CREATE TABLE airports (
	airport_icao VARCHAR(25), -- icao of the airport
    airport_name VARCHAR(255), -- the name of the airport
    PRIMARY KEY (airport_icao)
);

-- Create 'cities_airports' table
CREATE TABLE cities_airports(
	city_id INT, -- ID of the city
    airport_icao VARCHAR(5), -- icao of the city's airport
	FOREIGN KEY (city_id) REFERENCES cities(city_id), -- forgein key to connect cities_airports to cities
    FOREIGN KEY (airport_icao) REFERENCES airports(airport_icao) -- foreign key to connect cities_airports to airports
);

-- Create 'flights' table
CREATE TABLE flights (
	flight_id INT AUTO_INCREMENT NOT NULL, -- Automatically generated ID for each flight
    flight_number VARCHAR(25), -- the flight number, made of letters and numbers
    departure_airport_icao VARCHAR(25), -- icao of the airport the flight departed from
    arrival_airport_icao VARCHAR(25), -- icao of the airport the flight is arriving at
    scheduled_arrival_time DATETIME, -- the time when the flight arrives
    PRIMARY KEY (flight_id),
    FOREIGN KEY (arrival_airport_icao) REFERENCES airports(airport_icao) -- forgein key to connect flights to airports
);