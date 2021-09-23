--Exercise 1
--The difference between DDL and DML is that DDL is used to define the schema or
--the structure of database which means it is used to create the table(relation)
--and the DML is used to access, or modify the schema or table created by DDL.
--
--a)
--DDL commands:CREATE,ALTER,DROP
--
--b)
--DML commands:SELECT,INSERT,UPDATE,DELETE


--Exercise 2
CREATE TABLE order_items(
    order_code integer NOT NULL UNIQUE REFERENCES orders (code),
    product_id varchar NOT NULL UNIQUE REFERENCES products (id),
    quantity   integer NOT NULL CHECK (quantity>0),
    PRIMARY KEY (order_code,product_id)
);

CREATE TABLE products(
    id          varchar PRIMARY KEY,
    name        varchar NOT NULL UNIQUE,
    description text,
    price       double precision NOT NULL CHECK (price>0)
);

CREATE TABLE orders(
    code        integer PRIMARY KEY,
    customer_id integer REFERENCES customers (id),
    total_sum   double precision NOT NULL CHECK (total_sum>0),
    is_paid     boolean NOT NULL
);

CREATE TABLE customers(
    id               integer PRIMARY KEY,
    full_name        varchar(50) NOT NULL,
    timestamp        timestamp NOT NULL,
    delivery_address text NOT NULL
);


--Exercise 3
CREATE TABLE university(
    
);

CREATE TABLE students(
    id integer PRIMARY KEY,
    full_name varchar(50) NOT NULL,
    age integer NOT NULL CHECK (age>0),
    birth_date date,
    gender varchar(20),
    average_grade double precision,
    information_about_yourself text,
    need_for_a_dormitory boolean,
    additional_info text
);

CREATE TABLE instructors(
    full_name varchar(50),
    speaking_languages text,
    work_experience integer,
    possibility_of_remote_lessons boolean
);

CREATE TABLE lesson_participants(
    lesson_title varchar(50),
    teaching_instructor varchar(50) ,
    studying_students varchar(50) ,
    room_number integer NOT NULL
);


--Exercise 4
INSERT INTO products VALUES ('012081','Computer','Gaming Computer',399999.99);

UPDATE products
SET description='Lenovo Legion'
WHERE description='Gaming Computer';

DELETE FROM products
WHERE price=399999.99;