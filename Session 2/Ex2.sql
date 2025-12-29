create database Vu_Dinh_Kien;
use Vu_Dinh_Kien;

create table Student (
    student_id varchar(10) primary key,
    full_name varchar(100) not null
);

create table Subject (
    subject_id varchar(10) primary key,
    subject_name varchar(100) not null,
    credit int check (credit > 0)
);