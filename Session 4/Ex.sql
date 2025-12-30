create database student;
use student;

create table student (
	student_id int primary key auto_increment,
    student_name varchar(100) not null,
    email varchar(100) unique not null,
    phone char(50) not null
);

create table course (
	course_id int primary key auto_increment,
    course_name varchar(100) not null,
    credits int check (credits > 0)
);

create table enrollment (
	student_id int,
    course_id int,
    grade decimal(3,1) default 0,
    primary key (student_id, course_id),
	foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);

insert into student (student_name, email, phone) values
('Vu Dinh A', 'a@gmail.com', '0988566151'),
('Vu Dinh B', 'b@gmail.com', '0988566152'),
('Vu Dinh C', 'c@gmail.com', '0988566153'),
('Vu Dinh D', 'd@gmail.com', '0988566154'),
('Vu Dinh E', 'e@gmail.com', '0988566155');

insert into course (course_name, credits) values
('JS', 1),
('TSX', 2),
('CSS', 3),
('Java', 4),
('HTML', 5);

insert into enrollment (student_id, course_id, grade) values
(1, 1, 9.0),
(2, 3, 4.0), 
(3, 2, 5.0),
(4, 4, 4.0),
(5, 5, 5.0);

-- Cap nhat diem so
update enrollment
set grade = 9.0 where student_id = 2 and course_id = 3;

-- Lay danh sach sinh vien
select * from student;
select * from course;
select * from enrollment;

-- Câu lệnh xóa khóa học có Mã KH là 101
DELETE FROM Course WHERE course_id = 101;

-- GIẢI THÍCH: Nếu hệ thống báo lỗi không cho xóa mã khóa học 101, nguyên nhân là do:
-- Dữ liệu đang bị "khóa": Mã khóa học này vẫn còn nằm trong bảng đăng ký môn 
-- học (enrollment), tức là có sinh viên đang học nó nên hệ thống không cho phép xóa
-- Tránh lỗi dữ liệu: SQL chặn lại vì nếu xóa lớp học đi mà thông tin đăng 
-- ký của sinh viên vẫn còn thì dữ liệu sẽ bị treo, không biết lớp đó là lớp nào.
