-- Check if the database exists, and create it if it doesn't
CREATE DATABASE IF NOT EXISTS jcbdatabase;

-- Select the database
USE jcbdatabase;

-- DROP TABLE IF EXISTS and CREATE TABLE statement for items table
DROP TABLE IF EXISTS items;
CREATE TABLE items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    issue INT NOT NULL,
    grade FLOAT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- DROP TABLE IF EXISTS and CREATE TABLE statement for order information table
DROP TABLE IF EXISTS order_info;
CREATE TABLE order_info (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    quantity_ordered INT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    order_date DATE NOT NULL,
    -- Add any additional information fields here as needed
    
    -- FOREIGN KEY to link to the items table
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);