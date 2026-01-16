drop database if exists studentmanagement;
create database studentmanagement;
use studentmanagement;

create table students (
    studentid char(5) primary key,
    fullname varchar(50) not null,
    totaldebt decimal(10,2) default 0
);

create table subjects (
    subjectid char(5) primary key,
    subjectname varchar(50) not null,
    credits int check (credits > 0)
);

create table grades (
    studentid char(5),
    subjectid char(5),
    score decimal(4,2),
    primary key (studentid, subjectid),
    constraint fk_grades_students foreign key (studentid) references students(studentid),
    constraint fk_grades_subjects foreign key (subjectid) references subjects(subjectid)
);

create table gradelog (
    logid int primary key auto_increment,
    studentid char(5),
    oldscore decimal(4,2),
    newscore decimal(4,2),
    changedate datetime default current_timestamp
);

insert into students (studentid, fullname, totaldebt) values 
('sv01', 'ho khanh linh', 5000000),
('sv03', 'tran thi khanh huyen', 0);

insert into subjects (subjectid, subjectname, credits) values 
('sb01', 'co so du lieu', 3),
('sb02', 'lap trinh java', 4),
('sb03', 'lap trinh c', 3);

insert into grades (studentid, subjectid, score) values 
('sv01', 'sb01', 8.5),
('sv03', 'sb02', 3.0);


-- Ex 1
delimiter //
create trigger tg_checkscore
before insert on grades
for each row
begin
    if new.score < 0 then
        set new.score = 0;
    elseif new.score > 10 then
        set new.score = 10;
    end if;
end //
delimiter ;

-- test Ex 1
insert into grades (studentid, subjectid, score) values ('sv01', 'sb02', 15);
insert into grades (studentid, subjectid, score) values ('sv01', 'sb03', -5);
select * from grades;



-- Ex 2
start transaction;

insert into students (studentid, fullname, totaldebt) 
values ('sv02', 'ha bich ngoc', 0);

update students 
set totaldebt = 5000000 
where studentid = 'sv02';

commit;

-- test Ex 2
select * from students where studentid = 'sv02';


-- Ex 3
delimiter //
create trigger tg_loggradeupdate
after update on grades
for each row
begin
    insert into gradelog (studentid, oldscore, newscore, changedate)
    values (old.studentid, old.score, new.score, now());
end //
delimiter ;

-- test Ex 3
update grades set score = 7.5 where studentid = 'sv03' and subjectid = 'sb02';
select * from gradelog;


-- Ex 4
delimiter //
create procedure sp_paytuition()
begin
    declare v_debt decimal(10,2);
    
    start transaction;
    
    update students set totaldebt = totaldebt - 2000000 where studentid = 'sv01';
    
    select totaldebt into v_debt from students where studentid = 'sv01';
    
    if v_debt < 0 then
        rollback;
    else
        commit;
    end if;
end //
delimiter ;

-- test Ex 4
call sp_paytuition();
select * from students where studentid = 'sv01';



-- Ex 5
delimiter //
create trigger tg_preventpassupdate
before update on grades
for each row
begin
    -- nếu old.score >= 4.0 thì phát sinh lỗi không cho cập nhật
    if old.score >= 4.0 then
        signal sqlstate '45000' 
        set message_text = 'sinh vien da qua mon, khong duoc phep sua diem!';
    end if;
end //
delimiter ;

-- test Ex 5 (sẽ báo lỗi nếu sv01 đã có 8.5 điểm):
update grades set score = 10.0 where studentid = 'sv01' and subjectid = 'sb01';



-- Ex 6
delimiter //
create procedure sp_deletestudentgrade(in p_studentid char(5), in p_subjectid char(5))
begin
    start transaction;
    
    insert into gradelog (studentid, oldscore, newscore, changedate)
    select studentid, score, null, now()
    from grades 
    where studentid = p_studentid and subjectid = p_subjectid;
    
    delete from grades where studentid = p_studentid and subjectid = p_subjectid;
    
    if row_count() = 0 then
        rollback;
    else
        commit;
    end if;
end //
delimiter ;

-- test Ex 6
call sp_deletestudentgrade('sv03', 'sb02');
select * from grades;
select * from gradelog;