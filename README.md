CREATE DATABASE hair_salon;


hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar, date_of_employment timestamp, certification_from varchar, certification_completed timestamp);

CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, hair_style varchar, preferred_appointment varchar, stylist_id int);

#Salon App

###By: Mike Mahoney

Salon App lets an owner of a salon to add, edit, delete, and view their clients
and the stylists who work at the salon.  The owner can also assign clients to
stylists and can later view a list of clients that are assigned to that stylist.

##Installation

Install Salon app by cloning this repository:
```
https://github.com/Mahonmr/code_review_salon.git
```
##DATABASE Instrunctions

Database was created using PostgreSQL

Step 1

```
CREATE DATABASE hair_salon;
```

Step 2

```
CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar, date_of_employment timestamp, certification_from varchar, certification_completed timestamp);
```

Step 3

```
CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, hair_style varchar, preferred_appointment varchar, stylist_id int);
```

Step 4

```
CREATE DATABASE stylists_test WITH TEMPLATE stylists;
```



##License

MIT License, Copyright 2015 Epicodus
