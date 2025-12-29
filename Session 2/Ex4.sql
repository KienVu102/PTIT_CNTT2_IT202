create database Vu_Dinh_Kien;
use Vu_Dinh_Kien;

create table Subject (
    subject_id varchar(10) primary key,
    subject_name varchar(100) not null,
    credit int check (credit > 0)
);

create table Teacher (
    teacher_id varchar(10) primary key,
    full_name varchar(100) not null,
    email varchar(100) unique
);

alter table Subject
add teacher_id varchar(10);

alter table Subject
add constraint fk_subject_teacher
foreign key (teacher_id)
references Teacher(teacher_id);