-- Active: 1742315814543@@127.0.0.1@5432@bookstore_db@public

-- Create a "books" table
CREATE TABLE books (
    id SERIAL NOT NULL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    price DECIMAL(10,2) CHECK(price >= 0),
    stock INT NOT NULL,
    published_year INT
);



-- Insert Sample "books" Data
INSERT INTO books (title, author, price, stock, published_year)    VALUES
    ('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
    ('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
    ('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
    ('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
    ('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

-- All books
SELECT * FROM books;

-- Create a "customers" table 
CREATE TABLE customers (
     id SERIAL NOT NULL PRIMARY KEY,
     name VARCHAR(200),
     email VARCHAR(100) NOT NULL UNIQUE,
     joined_date DATE DEFAULT CURRENT_DATE
)

-- Insert Sample "customers" Data
INSERT INTO customers (id, name, email, joined_date) 
    VALUES
    (1, 'Alice', 'alice@email.com', '2023-01-10'),
    (2, 'Bob', 'bob@email.com', '2022-05-15'),
    (3, 'Charlie', 'charlie@email.com', '2023-06-20');


-- All customers
SELECT * FROM customers;

-- Create an "orders" table
CREATE TABLE orders (
     id SERIAL NOT NULL PRIMARY KEY,
     customer_id INT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
     book_id INT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
     quantity INT,
     order_date DATE  DEFAULT CURRENT_TIMESTAMP
)


-- Insert Sample "orders" Data
INSERT INTO orders (customer_id,book_id,quantity)
    VALUES
    (1,2,1),
    ( 2,1,1),
    (1,3,2)

-- All Orders
SELECT * FROM orders;

-- Find books that are out of stock.
SELECT title FROM books
    WHERE stock = 0

-- Retrieve the most expensive book in the store.
SELECT * FROM books 
    ORDER BY price DESC
    LIMIT 1

-- Find the total number of orders placed by each customer.
SELECT name, COUNT(*) AS total_orders 
    FROM orders
    JOIN customers ON orders.customer_id = customers.id
    GROUP BY name

--  Calculate the total revenue generated from book sales.
SELECT SUM(b.price * o.quantity) AS total_revenue
    FROM orders AS o
    JOIN books AS b ON o.book_id = b.id


--  List all customers who have placed more than one order.
SELECT name, COUNT(*) AS orders_count
    FROM orders
    JOIN customers ON orders.customer_id = customers.id
    GROUP BY name
    HAVING COUNT(*) > 1


-- Find the average price of books in the store.
SELECT AVG(b.price)::NUMERIC(10,2) AS avg_book_price 
    FROM books AS b

--  Increase the price of all books published before 2000 by 10%.
UPDATE books
    SET price = price * 1.10
    WHERE published_year < 2000

SELECT * FROM books


-- Delete customers who haven't placed any orders
DELETE FROM customers
    WHERE id NOT IN ( SELECT customer_id FROM orders )



SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;