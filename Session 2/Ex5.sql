create database Vu_Dinh_Kien;
use Vu_Dinh_Kien;

create table Student (
    student_id varchar(10) primary key,
    full_name varchar(100) not null
);

create table Subject (
    subject_id varchar(10) primary key,
    subject_name varchar(100) not null
);

create table Score (
    student_id varchar(10),
    subject_id varchar(10),
    process_score decimal(4,2) check (process_score between 0 and 10),
    final_score decimal(4,2) check (final_score between 0 and 10),
    primary key (student_id, subject_id),
    foreign key (student_id) references Student(student_id),
    foreign key (subject_id) references Subject(subject_id)
);