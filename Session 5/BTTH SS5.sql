DROP DATABASE IF EXISTS product_db;
CREATE DATABASE product_db;
USE product_db;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    status VARCHAR(20) -- ACTIVE, INACTIVE
);

INSERT INTO products (product_name, category, price, stock, status) VALUES
('Laptop', 'Electronics', 1500, 10, 'ACTIVE'),
('Mouse', 'Accessories', 20, 100, 'ACTIVE'),
('Keyboard', 'Accessories', 50, 50, 'ACTIVE'),
('Monitor', 'Electronics', 300, 20, 'ACTIVE'),
('Printer', 'Electronics', 200, 0, 'INACTIVE'),
('USB Cable', 'Accessories', 10, 200, 'ACTIVE'),
('Webcam', 'Electronics', 80, 15, 'ACTIVE'),
('Headphone', 'Accessories', 120, 0, 'INACTIVE'),
('Tablet', 'Electronics', 600, 8, 'ACTIVE'),
('Speaker', 'Accessories', 150, 12, 'ACTIVE');

-- lấy ds tất cả các sp
select * from product_db.products;

-- lấy ds các sp đang đc bán
select * from products where status = 'ACTIVE';

-- lấy tên sp và giá các sp đấy > 100
select * from products where price > 100;

-- lất các sp có giá từ 50 -> 300
select * from products where price between 50 and 300;

-- lấy các sản phẩm thuộc nhóm Electronics
select * from products where category = 'Electronics';

-- lấy các snar phẩm có tồn kho = 0
select * from products where stock = 0;

-- lấy các sản phẩm có chứa tên chữ "o"
select * from products where product_name like '%o%';

-- sắp xếp sp theo giá tăng dần
select * from products order by price asc;

-- sắp xếp sp theo giá tồn kho giảm dần
select * from products order by stock desc;

-- hiển thị 5 sp đầu tiên trong ds sp
select * from products limit 5;
