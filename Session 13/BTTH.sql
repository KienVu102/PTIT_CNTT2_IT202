CREATE DATABASE SocialNetworkDB;
USE SocialNetworkDB;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    total_posts INT DEFAULT 0
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE post_audits (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    old_content TEXT,
    new_content TEXT,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Task 1
DELIMITER //
CREATE TRIGGER tg_CheckPostContent
BEFORE INSERT ON posts
FOR EACH ROW
BEGIN
    IF NEW.content IS NULL OR TRIM(NEW.content) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nội dung bài viết không được để trống!';
    END IF;
END //
DELIMITER ;

-- Tn insert
-- 1. Tạo người dùng
INSERT INTO users (username) VALUES ('NguyenVanA');

-- 2. Chèn bài viết hợp lệ (Kiểm tra users.total_posts xem có lên 1 không)
INSERT INTO posts (user_id, content) VALUES (1, 'Chào buổi sáng!');
SELECT * FROM users;


-- Cleanup
DROP TRIGGER IF EXISTS tg_CheckPostContent;
