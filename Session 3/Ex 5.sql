USE baitap_student;

-- Tạo bảng Score
CREATE TABLE Score (
    student_id INT,
    subject_id INT,
    mid_score FLOAT CHECK (mid_score BETWEEN 0 AND 10),
    final_score FLOAT CHECK (final_score BETWEEN 0 AND 10),

    PRIMARY KEY (student_id, subject_id),

    CONSTRAINT fk_score_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    CONSTRAINT fk_score_subject
        FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
);

-- Thêm dữ liệu điểm
INSERT INTO Score (student_id, subject_id, mid_score, final_score)
VALUES
(1, 1, 7.5, 8.5),
(1, 2, 6.0, 7.0),
(2, 1, 8.0, 9.0),
(2, 3, 7.0, 8.0);

-- Cập nhật điểm cuối kỳ
UPDATE Score
SET final_score = 8.0
WHERE student_id = 1
  AND subject_id = 2;

-- Lấy toàn bộ bảng điểm
SELECT * FROM Score;

-- Lấy sinh viên có điểm cuối kỳ >= 8
SELECT *
FROM Score
WHERE final_score >= 8;
