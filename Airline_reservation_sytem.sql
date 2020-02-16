USE airline_reservation;

CREATE TABLE passengers(
   id INT(11) AUTO_INCREMENT,
   first_name VARCHAR(100),
   last_name VARCHAR(100),
   email VARCHAR(50),
   address VARCHAR(100),
   country VARCHAR(100),
   PRIMARY KEY(id)
);

CREATE TABLE bookings(
   id INT(11) AUTO_INCREMENT,
   passenger_id INT(11),
   booking_type VARCHAR(100),
   currency VARCHAR(100),
   location VARCHAR(20),
   destination VARCHAR(20),
   leaving_date DATE,
   returning_date DATE,
   travel_class VARCHAR(100),
   PRIMARY KEY(id),
   FOREIGN KEY(passenger_id) references passengers(id)
);

CREATE TABLE payment(
   id INT(11) AUTO_INCREMENT,
   passenger_id INT(11),
   booking_id INT(11),
   amount DECIMAL(15,2),
   payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY(id),
   FOREIGN KEY(passenger_id) references passengers(id),
   FOREIGN KEY(booking_id) references bookings(id)
);

CREATE TABLE fligh_details(
   id INT(11) AUTO_INCREMENT,
   passenger_id INT(11),
   ticket_number VARCHAR(100),
   seat_number VARCHAR(15),
   PRIMARY KEY(id),
   FOREIGN KEY(passenger_id) references passengers(id)
);

SELECT * FROM passengers;
INSERT INTO passengers (first_name, last_name, email, address, country)
 values ('Fred', 'Smith', 'fred@gmail.com', 'plot 234 Arab road Kubwa Abuja', 'Nigeria'),
 ('Sara', 'Watson', 'sara@gmail.com', 'opposite square plaze, Gwarimpa', 'Nigeria');

SELECT * FROM bookings;
INSERT INTO bookings (passenger_id, booking_type, currency, location, destination, leaving_date, returning_date, travel_class) 
values (2, 'Round trip', 'Nigeria Naira', 'Abuja', 'Lagos', '2020-04-22', '2020-05-16', 'Business'),
 (1, 'Round trip', 'US dollar', 'Lagos', 'Sokoto', '2020-02-08', '2020-03-11', 'First class');

SELECT * FROM passengers JOIN bookings ON passengers.id = bookings.id; 

SELECT * FROM payment;
INSERT INTO payment (passenger_id, booking_id, amount) values (2, 1, 43000), (1, 2, 300);

SELECT * FROM passengers JOIN bookings ON passengers.id = bookings.id JOIN payment ON passengers.id = payment.id;

SELECT * FROM fligh_details;
INSERT INTO fligh_details (passenger_id, ticket_number, seat_number)
 values (2, 'XVR123', 4), (1, 'XVR566', 7);

SELECT * FROM passengers JOIN bookings ON passengers.id = bookings.id 
JOIN payment ON passengers.id = payment.id JOIN fligh_details ON passengers.id = fligh_details.id;
