create database session4;
use session4;

create table students (
	studentId int primary key auto_increment,
    fullName varchar(100) not null,
	birthday date not null,
    email varchar(50) unique not null
);

create table teachers(
	teacherId int primary key auto_increment,
    fullName varchar(100) not null,
    email varchar(50) unique not null
);

create table courses(
	courseId int primary key auto_increment,
    courseName varchar(50) not null,
    description text not null,
    lesson int not null,
	teacherId int,

    foreign key (teacherId) references teachers(teacherId),
    check(lesson > 0)
);

create table enrollment(
	studentId int,
    courseId int,
    enrollDate timestamp,

    primary key (studentId, courseId),
	foreign key (studentId) references students(studentId),
    foreign key (courseId) references courses(courseId)
);

create table score(
	studentId int,
    courseId int,

    midScore decimal(4,2),
    finalScore decimal(4,2),

    primary key (studentId, courseId),
    foreign key (studentId) references students(studentId),
    foreign key (courseId) references courses(courseId),
    check(midScore >= 0 and midScore <= 10),
    check(finalScore >= 0 and midScore <= 10)
);
INSERT INTO students (fullName, birthday, email) VALUES
('Nguyễn Văn A', '2003-05-12', 'vana@example.com'),
('Trần Thị B', '2002-09-20', 'tranb@example.com'),
('Lê Văn C', '2004-01-15', 'levc@example.com'),
('Phạm Thị D', '2003-07-08', 'phamtd@example.com'),
('Hoàng Văn E', '2002-11-30', 'hoange@example.com');

INSERT INTO teachers (fullName, email) VALUES
('Thầy Nguyễn Văn Giáo', 'giaovn@example.com'),
('Cô Trần Thị Giảng', 'giangtt@example.com'),
('Thầy Lê Văn Dạy', 'daylv@example.com'),
('Cô Phạm Thị Hướng', 'huongpt@example.com'),
('Thầy Hoàng Văn Trí', 'trihv@example.com');

INSERT INTO courses (courseName, description, lesson, teacherId) VALUES
('Cơ sở dữ liệu', 'Khóa học về thiết kế và quản lý CSDL', 15, 1),
('Hệ điều hành', 'Khóa học về nguyên lý hệ điều hành', 20, 2),
('Mạng máy tính', 'Khóa học về mạng và truyền thông', 18, 3),
('Công nghệ phần mềm', 'Khóa học về quy trình phát triển phần mềm', 12, 4),
('Trí tuệ nhân tạo', 'Khóa học về AI và ứng dụng', 25, 5);

INSERT INTO enrollment (studentId, courseId, enrollDate) VALUES
(1, 1, CURRENT_TIMESTAMP),
(2, 2, CURRENT_TIMESTAMP),
(3, 3, CURRENT_TIMESTAMP),
(4, 4, CURRENT_TIMESTAMP),
(5, 5, CURRENT_TIMESTAMP);

UPDATE students
SET fullName = 'Nguyễn Văn A (đã sửa)', email = 'vana_update@example.com'
WHERE studentId = 1;

UPDATE teachers	
SET fullName = 'Thầy Nguyễn Văn Giáo (update)'
WHERE teacherId = 1;

UPDATE courses
SET lesson = 30
WHERE courseId = 1;

UPDATE enrollment
SET enrollDate = '2025-01-01 08:00:00'
WHERE studentId = 1 AND courseId = 1;

UPDATE score
SET midScore = 9.00, finalScore = 9.50
WHERE studentId = 1 AND courseId = 1;

DELETE FROM students
WHERE studentId = 2;

DELETE FROM teachers
WHERE teacherId = 2;

DELETE FROM courses
WHERE courseId = 3;

DELETE FROM enrollment
WHERE studentId = 3 AND courseId = 3;

DELETE FROM score
WHERE studentId = 3 AND courseId = 3;

SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM courses;
SELECT * FROM enrollment;
SELECT * FROM score;
