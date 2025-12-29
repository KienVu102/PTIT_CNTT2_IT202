-- Tạo bảng Student
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);

-- Thêm dữ liệu sinh viên
INSERT INTO Student (student_id, full_name, date_of_birth, email)
VALUES
(1, 'Nguyễn Văn An', '2002-05-10', 'an@gmail.com'),
(2, 'Trần Thị Bình', '2001-11-20', 'binh@gmail.com'),
(3, 'Lê Hoàng Cường', '2003-03-15', 'cuong@gmail.com');

-- Lấy toàn bộ sinh viên
SELECT * FROM Student;

-- Lấy mã sinh viên và họ tên
SELECT student_id, full_name FROM Student;
