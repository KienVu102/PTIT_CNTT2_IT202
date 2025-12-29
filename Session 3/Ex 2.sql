USE baitap_student;

-- Kiểm tra dữ liệu ban đầu
SELECT * FROM Student;

-- Cập nhật email cho sinh viên ID = 3
UPDATE Student
SET email = 'cuong_moi@gmail.com'
WHERE student_id = 3;

-- Cập nhật ngày sinh cho sinh viên ID = 2
UPDATE Student
SET date_of_birth = '2002-01-15'
WHERE student_id = 2;

-- Xóa sinh viên nhập nhầm ID = 5
DELETE FROM Student
WHERE student_id = 5;

-- Kiểm tra lại dữ liệu sau khi cập nhật và xóa
SELECT * FROM Student;
