USE baitap_student;

-- Tạo bảng Subject
CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit INT CHECK (credit > 0)
);

-- Thêm dữ liệu môn học
INSERT INTO Subject (subject_id, subject_name, credit)
VALUES
(1, 'Cơ sở dữ liệu', 3),
(2, 'Lập trình C', 4),
(3, 'Cấu trúc dữ liệu', 3);

-- Cập nhật số tín chỉ môn Lập trình C
UPDATE Subject
SET credit = 5
WHERE subject_id = 2;

-- Đổi tên môn học
UPDATE Subject
SET subject_name = 'CTDL & Giải thuật'
WHERE subject_id = 3;

-- Hiển thị tất cả môn học
SELECT * FROM Subject;

-- Lọc các môn có số tín chỉ >= 4
SELECT subject_id, subject_name, credit
FROM Subject
WHERE credit >= 4;
