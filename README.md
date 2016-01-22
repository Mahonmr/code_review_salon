CREATE DATABASE hair_salon;


hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar, date_of_employment timestamp, certification_from varchar, certification_completed timestamp);

CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, hair_style varchar, preferred_appointment varchar, stylist_id int);
