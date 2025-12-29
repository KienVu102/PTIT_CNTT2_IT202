create database Vu_Dinh_Kien;
use Vu_Dinh_Kien;

create table Class (
    class_id varchar(10) primary key,
    class_name varchar(50) not null,
    school_year int not null
);

create table Student (
    student_id varchar(10) primary key,
    full_name varchar(100) not null,
    birth_date date,
    class_id varchar(10),
    foreign key (class_id) references Class(class_id)
);