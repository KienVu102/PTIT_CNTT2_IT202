USE baitap_student;

-- Tạo bảng Enrollment
CREATE TABLE Enrollment (
    student_id INT,
    subject_id INT,
    enroll_date DATE,

    PRIMARY KEY (student_id, subject_id),

    CONSTRAINT fk_enroll_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    CONSTRAINT fk_enroll_subject
        FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
);

-- Thêm dữ liệu đăng ký môn học
INSERT INTO Enrollment (student_id, subject_id, enroll_date)
VALUES
(1, 1, '2024-09-01'),
(1, 2, '2024-09-01'),
(2, 1, '2024-09-02'),
(2, 3, '2024-09-02');

-- Lấy tất cả các lượt đăng ký
SELECT * FROM Enrollment;

-- Lấy lượt đăng ký của sinh viên cụ thể
SELECT *
FROM Enrollment
WHERE student_id = 1;
