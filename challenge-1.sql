-- tables
-- Table: airline
CREATE TABLE airline (
    id bigint NOT NULL,
    airline_code bigint NOT NULL,
    airline_name bigint NOT NULL,
    airline_country varchar(50) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    CONSTRAINT airline_pk PRIMARY KEY (id)
);

-- Table: airport
CREATE TABLE airport (
    id bigint NOT NULL,
    airport_name varchar(50) NOT NULL,
    country varchar(50) NOT NULL,
    state varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    CONSTRAINT airport_pk PRIMARY KEY (id)
);

-- Table: baggage
CREATE TABLE baggage (
    id bigint NOT NULL,
    weight_in_k int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    booking_id bigint NOT NULL,
    CONSTRAINT baggage_pk PRIMARY KEY (id)
);

-- Table: baggage_check
CREATE TABLE baggage_check (
    id bigint NOT NULL,
    check_result varchar(50) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    passenger_id bigint NOT NULL,
    booking_id bigint NOT NULL,
    CONSTRAINT baggage_check_pk PRIMARY KEY (id)
);

-- Table: boarding_pass
CREATE TABLE boarding_pass (
    id bigint NOT NULL,
    qr_code text(16383) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    booking_id bigint NOT NULL,
    CONSTRAINT boarding_pass_pk PRIMARY KEY (id)
);

-- Table: booking
CREATE TABLE booking (
    id bigint NOT NULL,
    flight_id bigint NOT NULL,
    status varchar(20) NOT NULL,
    booking_platform varchar(20) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    passenger_id bigint NOT NULL,
    CONSTRAINT booking_pk PRIMARY KEY (id)
);

-- Table: flight
CREATE TABLE flight (
    id bigint NOT NULL,
    departing_gate varchar(20) NOT NULL,
    arriving_gate varchar(20) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    airline_id bigint NOT NULL,
    departing_airport_id bigint NOT NULL,
    arriving_airport_id bigint NOT NULL,
    CONSTRAINT flight_pk PRIMARY KEY (id)
);

-- Table: flight_manifest
CREATE TABLE flight_manifest (
    id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    booking_id bigint NOT NULL,
    flight_id bigint NOT NULL,
    CONSTRAINT flight_manifest_pk PRIMARY KEY (id)
);

-- Table: no_fly_list
CREATE TABLE no_fly_list (
    id bigint NOT NULL,
    active_from date NOT NULL,
    active_to date NOT NULL,
    no_fly_reason varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    passenger_id bigint NOT NULL,
    CONSTRAINT no_fly_list_pk PRIMARY KEY (id)
);

-- Table: passenger
CREATE TABLE passenger (
    id bigint NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    date_of_birth date NOT NULL,
    country_of_citizenship varchar(50) NOT NULL,
    country_of_residence varchar(50) NOT NULL,
    passport_number varchar(20) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    CONSTRAINT passenger_pk PRIMARY KEY (id)
);

-- Table: security_check
CREATE TABLE security_check (
    id bigint NOT NULL,
    check_result varchar(50) NOT NULL,
    comments text(65535) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    passenger_id bigint NOT NULL,
    CONSTRAINT security_check_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: baggage_booking (table: baggage)
ALTER TABLE baggage ADD CONSTRAINT baggage_booking FOREIGN KEY baggage_booking (booking_id)
    REFERENCES booking (id);

-- Reference: baggage_check_booking (table: baggage_check)
ALTER TABLE baggage_check ADD CONSTRAINT baggage_check_booking FOREIGN KEY baggage_check_booking (booking_id)
    REFERENCES booking (id);

-- Reference: baggage_check_passenger (table: baggage_check)
ALTER TABLE baggage_check ADD CONSTRAINT baggage_check_passenger FOREIGN KEY baggage_check_passenger (passenger_id)
    REFERENCES passenger (id);

-- Reference: boarding_pass_booking (table: boarding_pass)
ALTER TABLE boarding_pass ADD CONSTRAINT boarding_pass_booking FOREIGN KEY boarding_pass_booking (booking_id)
    REFERENCES booking (id);

-- Reference: booking_passenger (table: booking)
ALTER TABLE booking ADD CONSTRAINT booking_passenger FOREIGN KEY booking_passenger (passenger_id)
    REFERENCES passenger (id);

-- Reference: flight_airline (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_airline FOREIGN KEY flight_airline (airline_id)
    REFERENCES airline (id);

-- Reference: flight_airport (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_airport1 FOREIGN KEY flight_airport1 (arriving_airport_id)
    REFERENCES airport (id);

-- Reference: flight_airport (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_airport2 FOREIGN KEY flight_airport2 (departing_airport_id)
    REFERENCES airport (id);

-- Reference: flight_manifest_booking (table: flight_manifest)
ALTER TABLE flight_manifest ADD CONSTRAINT flight_manifest_booking FOREIGN KEY flight_manifest_booking (booking_id)
    REFERENCES booking (id);

-- Reference: flight_manifest_flight (table: flight_manifest)
ALTER TABLE flight_manifest ADD CONSTRAINT flight_manifest_flight FOREIGN KEY flight_manifest_flight (flight_id)
    REFERENCES flight (id);
    
-- Reference: no_fly_list_passenger (table: no_fly_list)
ALTER TABLE no_fly_list ADD CONSTRAINT no_fly_list_passenger FOREIGN KEY no_fly_list_passenger (passenger_id)
    REFERENCES passenger (id);
    
-- Reference: security_check_passenger (table: security_check)
ALTER TABLE security_check ADD CONSTRAINT security_check_passenger FOREIGN KEY security_check_passenger (passenger_id)
    REFERENCES passenger (id);
    
-- End of file.