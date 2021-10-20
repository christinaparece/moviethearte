
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    addresss VARCHAR(150),
    billing_info VARCHAR(150)
);

CREATE TABLE ticket(
    ticket_id SERIAL PRIMARY KEY,
    movie_duration INTEGER NOT NULL,
    showing_date DATE DEFAULT CURRENT_DATE,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    
);

CREATE TABLE seat(
    seat_id SERIAL PRIMARY KEY,
    theatre_number INTEGER NOT NULL,
    seat_number INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    ticket_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
);

CREATE TABLE movie(
    movie_id SERIAL PRIMARY KEY,
    movie_title VARCHAR(150),
    movie_rating VARCHAR(8),
    movie_duration INTEGER NOT NULL,
    ticket_id INTEGER NOT NULL,
    FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
);

CREATE TABLE concession(
    concession_id SERIAL PRIMARY KEY,
    item_food_beverage VARCHAR(100),
    order_total NUMERIC(8,2),
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);