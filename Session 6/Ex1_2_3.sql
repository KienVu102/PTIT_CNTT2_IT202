DROP DATABASE IF EXISTS Ex1_2_3_ss6;
CREATE DATABASE Ex1_2_3_ss6;
USE Ex1_2_3_ss6;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    city VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, full_name, city) VALUES
(1, 'Nguyễn Văn An', 'Hà Nội'),
(2, 'Trần Thị Bình', 'Hồ Chí Minh'),
(3, 'Lê Văn Cường', 'Đà Nẵng'),
(4, 'Phạm Thị Dung', 'Hà Nội'),
(5, 'Hoàng Văn Em', 'Cần Thơ');

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(101, 1, '2024-12-01', 'completed'),
(102, 1, '2024-12-05', 'pending'),
(103, 2, '2024-12-03', 'completed'),
(104, 3, '2024-12-10', 'cancelled'),
(105, 2, '2024-12-15', 'completed');

SELECT 
    o.order_id, 
    c.full_name, 
    o.order_date, 
    o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT 
    c.customer_id, 
    c.full_name, 
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;

SELECT 
    c.customer_id, 
    c.full_name, 
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(o.order_id) >= 1;

-- Ex 2
ALTER TABLE orders
ADD COLUMN total_amount DECIMAL(10,2);

UPDATE orders SET total_amount = 1500000 WHERE order_id = 101;
UPDATE orders SET total_amount = 800000  WHERE order_id = 102;
UPDATE orders SET total_amount = 2200000 WHERE order_id = 103;
UPDATE orders SET total_amount = 500000  WHERE order_id = 104;
UPDATE orders SET total_amount = 1800000 WHERE order_id = 105;

SELECT
    c.customer_id,
    c.full_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;

SELECT
    c.customer_id,
    c.full_name,
    MAX(o.total_amount) AS max_order_value
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;

SELECT
    c.customer_id,
    c.full_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_spent DESC;

-- Ex 3
SELECT
    order_date,
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'completed'
GROUP BY order_date;

SELECT
    order_date,
    COUNT(order_id) AS total_orders
FROM orders
WHERE status = 'completed'
GROUP BY order_date;

SELECT
    order_date,
    SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM orders
WHERE status = 'completed'
GROUP BY order_date
HAVING SUM(total_amount) > 10000000;