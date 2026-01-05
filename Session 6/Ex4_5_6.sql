DROP DATABASE IF EXISTS Ex4_5_6_ss6;
CREATE DATABASE Ex4_5_6_ss6;
USE Ex4_5_6_ss6;

-- Ex 4
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    city VARCHAR(255)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    total_amount DECIMAL(15,2), -- Cột này để phục vụ tính toán ở Bài 5
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, full_name, city) VALUES
(1, 'Nguyễn Văn An', 'Hà Nội'),
(2, 'Trần Thị Bình', 'Hồ Chí Minh'),
(3, 'Lê Văn Cường', 'Đà Nẵng'),
(4, 'Phạm Thị Dung', 'Hà Nội'),
(5, 'Hoàng Văn Em', 'Cần Thơ');

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 15000000),
(2, 'Chuột không dây', 500000),
(3, 'Bàn phím cơ', 1200000),
(4, 'Tai nghe', 800000),
(5, 'Màn hình', 4000000);

INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(101, 1, '2024-12-01', 'completed', 16000000),
(102, 1, '2024-12-05', 'completed', 2000000),
(103, 1, '2024-12-10', 'completed', 5000000), -- KH 1 có 3 đơn, tổng > 10tr (Khách VIP)
(104, 2, '2024-12-03', 'completed', 34000000),
(105, 3, '2024-12-10', 'cancelled', 2400000);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 5), (101, 2, 10), -- SP 2 bán được 10 cái 
(102, 3, 2), (102, 2, 5),
(103, 5, 2),
(104, 1, 12),              -- SP 1 bán được 12 cái
(105, 4, 3);

-- Hiển thị mỗi sản phẩm đã bán được bao nhiêu
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- Tính doanh thu và lọc doanh thu > 5.000.000
SELECT p.product_name, SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING revenue > 5000000;

-- Ex 5
SELECT 
    c.full_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
HAVING total_orders >= 3 AND total_spent > 10000000
ORDER BY total_spent DESC;

-- Ex 6
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * p.price) AS total_revenue,
    AVG(p.price) AS avg_price
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING total_quantity_sold >= 10
ORDER BY total_revenue DESC
LIMIT 5;