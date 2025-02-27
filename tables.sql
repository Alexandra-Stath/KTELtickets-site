CREATE TABLE Accounts (
	user_name VARCHAR(50) NOT NULL,
	user_password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
	PRIMARY KEY (user_name)
);

CREATE TABLE Routes (
	route_id INT NOT NULL,
	route VARCHAR(150) NOT NULL,
	routes_date DATETIME NOT NULL,
	travel_time TIME NOT NULL,
	route_type VARCHAR(20) NOT NULL,
    seats_count INT NOT NULL,
    price DECIMAL(5,2) NOT NULL,
	PRIMARY KEY (route_id)
);

CREATE TABLE Bus (
	route_id INT NOT NULL,
    seat_number INT NOT NULL,
	reserved BOOLEAN NOT NULL,
    FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT NOT NULL,
    seat_number INT NOT NULL,
    route VARCHAR(150) NOT NULL,
    email VARCHAR(50) NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (ticket_id)
);