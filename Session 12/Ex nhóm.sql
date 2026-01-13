create database thuchanh;
use thuchanh;

create table users(
	user_id int primary key auto_increment,
    username varchar(50) unique not null,
    password varchar(255) not null,
    email varchar(100) unique not null,
    created_at datetime default current_timestamp()
);

insert into users (username, password, email) values
('nguyenvana', 'nguyenvana@123', 'nguyenvana@gmail.com'),
('tranthib', 'tranthib@123', 'tranthib@gmail.com'),
('levanc', 'levanc@123', 'levanc@gmail.com'),
('phamthid', 'phamthid@123', 'phamthid@gmail.com'),
('hoangvane', 'hoangvane@123', 'hoangvane@gmail.com'),
('vuthif', 'vuthif@123', 'vuthif@gmail.com'),
('dangvang', 'dangvang@123', 'dangvang@gmail.com'),
('buithih', 'buithih@123', 'buithih@gmail.com'),
('dinhvani', 'dinhvani@123', 'dinhvani@gmail.com'),
('ngothij', 'ngothij@123', 'ngothij@gmail.com'),
('phamvank', 'phamvank@123', 'phamvank@gmail.com'),
('tranthil', 'tranthil@123', 'tranthil@gmail.com'),
('levanm', 'levanm@123', 'levanm@gmail.com'),
('hoangthin', 'hoangthin@123', 'hoangthin@gmail.com'),
('vuvanp', 'vuvanp@123', 'vuvanp@gmail.com'),
('dangthiq', 'dangthiq@123', 'dangthiq@gmail.com'),
('buivanr', 'buivanr@123', 'buivanr@gmail.com'),
('dinhthis', 'dinhthis@123', 'dinhthis@gmail.com'),
('ngovanth', 'ngovanth@123', 'ngovanth@gmail.com'),
('phamthiu', 'phamthiu@123', 'phamthiu@gmail.com');

create table posts(
	post_id int primary key auto_increment,
    user_id int,
    content text not null,
    created_at datetime default current_timestamp(),
    
    foreign key (user_id) references users(user_id)
);

insert into posts (user_id, content) values
(1,  'hôm nay trời mát, đi làm mà thấy dễ chịu hẳn'),
(2,  'vừa hoàn thành xong bài tập sql, nhẹ cả người'),
(3,  'cuối tuần rồi mà vẫn phải ngồi debug code'),
(4,  'mới học xong stored procedure, thấy cũng thú vị'),
(5,  'cà phê sáng nay ngon hơn mọi ngày'),
(6,  'ai có tài liệu mysql hay không cho mình xin với'),
(7,  'tối nay chắc phải thức khuya làm deadline'),
(8,  'code chạy được không lỗi là vui rồi'),
(9,  'học công nghệ thông tin đúng là không bao giờ hết cái để học'),
(10, 'sáng nay dậy sớm đi làm mà buồn ngủ quá'),

(11, 'vừa fix xong một bug khó, cảm giác đã thật sự'),
(12, 'hôm nay học về cursor trong mysql, hơi rối não'),
(13, 'ai cũng bảo sql dễ mà sao mình thấy khó ghê'),
(14, 'cuối tháng rồi mà lương vẫn chưa về'),
(15, 'trưa nay ăn cơm văn phòng hơi ngán'),
(16, 'đang tập viết trigger trong mysql'),
(17, 'mấy hôm nay trời nóng quá'),
(18, 'tối về chỉ muốn ngủ một giấc thật ngon'),
(19, 'học nhóm buổi tối cũng vui phết'),
(20, 'làm đồ án mà cả nhóm ai cũng mệt'),

(1,  'sáng nay chạy bộ một vòng cho tỉnh táo'),
(3,  'ngồi sửa sql cả buổi chiều'),
(5,  'vừa uống trà sữa vừa code'),
(7,  'deadline tới nơi rồi mà vẫn chưa xong'),
(9,  'đang tìm hiểu thêm về index trong mysql'),
(12, 'học càng nhiều càng thấy mình biết ít'),
(15, 'chiều nay làm việc không hiệu quả lắm'),
(18, 'tối nay chắc lại phải thức khuya'),
(20, 'hy vọng project này chạy ổn định'),
(2,  'mai kiểm tra môn cơ sở dữ liệu, hơi lo');

create table comments(
	comment_id int primary key auto_increment,
	post_id int,
	user_id int,
	content text not null,
	 created_at datetime default current_timestamp(),
	 
	foreign key(user_id) references users(user_id),
	foreign key(post_id) references posts(post_id)
);

insert into comments (post_id, user_id, content) values
(1, 2,  'đúng luôn, thời tiết dạo này dễ chịu thật'),
(1, 3,  'nghe là thấy muốn đi chơi liền'),
(2, 4,  'mình cũng vừa xong bài sql hôm qua'),
(2, 5,  'làm xong là nhẹ người hẳn'),
(3, 6,  'debug mấy lỗi này mệt ghê'),
(3, 7,  'cuối tuần mà còn code là hiểu rồi'),
(4, 8,  'stored procedure lúc đầu hơi khó'),
(4, 9,  'quen rồi thấy cũng ổn'),
(5, 10, 'cà phê sáng mà không ngon là buồn cả ngày'),
(5, 11, 'chắc đổi quán khác thử xem'),

(6, 12, 'tài liệu mysql trên mạng cũng nhiều lắm'),
(6, 13, 'bạn tìm trên w3schools thử xem'),
(7, 14, 'deadline lúc nào cũng dí'),
(7, 15, 'cố lên rồi cũng xong thôi'),
(8, 16, 'code chạy không lỗi là hạnh phúc'),
(8, 17, 'chỉ sợ chạy sai kết quả'),
(9, 18, 'ngành này học suốt đời luôn'),
(9, 19, 'càng học càng thấy thiếu'),
(10, 20,'sáng đi làm mà buồn ngủ là quen rồi'),

(11, 1, 'fix được bug là thấy đời tươi hơn'),
(11, 2, 'mấy bug khó thường tốn thời gian'),
(12, 3, 'cursor đúng là hơi rối thật'),
(12, 4, 'hiểu logic rồi thì cũng ok'),
(13, 5, 'sql không dễ như người ta nói đâu'),
(13, 6, 'phải làm nhiều mới quen'),
(14, 7, 'cuối tháng lúc nào cũng căng'),
(14, 8, 'đợi lương về là hết buồn'),
(15, 9, 'cơm văn phòng ăn riết cũng ngán'),
(15, 10,'thỉnh thoảng đổi món cho đỡ chán'),

(16, 11,'trigger viết sai là lỗi liền'),
(16, 12,'test kỹ trước khi dùng'),
(17, 13,'trời nóng đúng là khó chịu'),
(17, 14,'bật điều hòa cả ngày luôn'),
(18, 15,'ngủ một giấc là khỏe liền'),
(18, 16,'dạo này mình cũng thiếu ngủ'),
(19, 17,'học nhóm vui mà hiệu quả'),
(19, 18,'quan trọng là mọi người hợp tác'),
(20, 19,'làm đồ án nhóm lúc nào cũng mệt'),
(20, 20,'xong đồ án là muốn nghỉ ngơi liền');

create table friends(
	user_id int,
    friend_id int,
    status enum("pending", "accepted"),
    
    primary key(user_id, friend_id),
    foreign key(user_id) references users(user_id),
    foreign key(friend_id) references users(user_id)
);

insert into friends (user_id, friend_id, status) values
(1, 2, 'accepted'),
(1, 3, 'accepted'),
(1, 4, 'accepted'),
(2, 3, 'accepted'),
(2, 5, 'accepted'),
(3, 4, 'accepted'),
(3, 6, 'accepted'),
(4, 5, 'accepted'),
(4, 7, 'accepted'),
(5, 6, 'accepted'),
(5, 8, 'accepted'),
(6, 7, 'accepted'),
(6, 9, 'accepted'),
(7, 8, 'accepted'),
(7, 10,'accepted'),
(8, 9, 'accepted'),
(8, 11,'accepted'),
(9, 10,'accepted'),
(9, 12,'accepted'),
(10,11,'accepted'),
(10,13,'accepted'),
(11,12,'accepted'),
(11,14,'accepted'),
(12,13,'accepted'),
(12,15,'accepted'),
(13,14,'accepted'),
(13,16,'accepted'),
(14,15,'accepted'),
(14,17,'accepted'),
(15,16,'accepted'),
(15,18,'accepted'),
(16,17,'accepted'),
(16,19,'accepted'),
(17,18,'accepted'),
(17,20,'accepted'),
(18,19,'accepted'),
(18,20,'accepted'),
(19,20,'accepted'),
(1, 5, 'pending'),
(1, 6, 'pending'),
(2, 7, 'pending'),
(2, 8, 'pending'),
(3, 9, 'pending'),
(4, 10,'pending'),
(5, 11,'pending'),
(6, 12,'pending'),
(7, 13,'pending'),
(8, 14,'pending'),
(9, 15,'pending'),
(10,16,'pending'),
(11,17,'pending'),
(12,18,'pending'),
(13,19,'pending'),
(14,20,'pending');

create table likes(
	user_id int,
    post_id int,
    
    primary key(user_id, post_id),
    foreign key(user_id) references users(user_id),
    foreign key(post_id) references posts(post_id)
);

insert into likes (user_id, post_id) values
(2,1),(3,1),(4,1),(5,1),(6,1),
(1,2),(3,2),(4,2),(7,2),
(2,3),(5,3),(6,3),(8,3),(9,3),
(1,4),(3,4),(7,4),(10,4),
(2,5),(4,5),(6,5),(8,5),(11,5),
(1,6),(5,6),(7,6),(9,6),
(2,7),(3,7),(6,7),(10,7),
(1,8),(4,8),(5,8),(11,8),
(2,9),(6,9),(7,9),(12,9),
(1,10),(3,10),(8,10),(9,10),
(4,11),(5,11),(6,11),(13,11),
(1,12),(7,12),(9,12),(14,12),
(2,13),(4,13),(8,13),(15,13),
(3,14),(5,14),(10,14),(16,14),
(1,15),(6,15),(9,15),(17,15),
(2,16),(7,16),(11,16),(18,16),
(3,17),(8,17),(12,17),(19,17),
(4,18),(6,18),(10,18),(20,18),
(5,19),(9,19),(13,19),(18,19),
(1,20),(7,20),(14,20),(19,20),
(2,21),(6,21),(11,21),
(3,22),(8,22),(15,22),
(4,23),(9,23),(16,23),
(5,24),(10,24),(17,24),
(6,25),(11,25),(18,25),
(7,26),(12,26),(19,26),
(8,27),(13,27),(20,27),
(9,28),(14,28),
(10,29),(15,29),
(11,30),(16,30),(18,30);

-- Bài 1: Quản lý người dùng
insert into users(username, email, password) values
("sonbui17", "sonbui@gmail.com", "sonbui");
select * from users; 

-- Bài 2: Hiển thị thông tin công khai bằng VIEW 
create or replace view view_public_users as
select user_id, username, created_at from users;
select * from view_public_users;

-- Bài 3: Tối ưu tìm kiếm người dùng bằng INDEX
create index idx_username_user on users(username);
explain analyze select * from users
where username like "%son%"; 

-- Tìm kiếm bằng index nhanh hơn

-- Bài 4: Quản lý bài viết bằng Stored Procedure
delimiter $$
create procedure createPost(user_id_in int, content_in text)
begin
	declare isNull int;
    set isNull = (
		select user_id from users
        where user_id = user_id_in
    );
    
    -- Kiểm tra xem user_id có tồn tại
	if isNull is not null
		then insert into posts(user_id, content) values(user_id_in, content_in);
    end if;
end $$
delimiter ;

call createPost(0, "Sơn Bùi");

drop procedure createPost;

-- Bài 5: Hiển thị News Feed bằng VIEW 
create or replace view vw_recent_posts as
select * from posts
where created_at >= date_sub(current_date(), interval 7 day);

select * from vw_recent_posts;

-- Bài 6: Tối ưu truy vấn bài viết
create index idx_userId_createdAt on users(user_id, created_at);

explain analyze select * from posts
order by created_at desc;
 
drop index idx_userId_createdAt on users;

/* Composite Index (user_id, created_at) giúp MySQL vừa lọc bài viết theo người dùng, 
vừa trả về kết quả đã được sắp xếp theo thời gian. Nhờ đó giảm số bản ghi phải quét 
và tránh thao tác sắp xếp bổ sung, giúp truy vấn nhanh và tối ưu hơn so với index đơn lẻ. */

-- Bài 7: Thống kê hoạt động bằng Stored Procedure
delimiter $$
create procedure countPost(user_id_in int, out total int)
begin
	select count(*) from posts
    where user_id = user_id_in;
end $$
delimiter ;

call countPost(12, @total);
select @total;

drop procedure countPost;

-- Bài 8:  

-- Bài 9: Quản lý kết bạn bằng Stored Procedure
delimiter $$
create procedure addFriend(user_id_in int, friend_id_in int)
begin
	if user_id_in <> friend_id_in then
		insert into friends(user_id, friend_id, status) values (user_id_in, friend_id_in, "pending");
	end if;
end $$
delimiter ; 

call addFriend(1, 10);

select * from friends;

drop procedure addFriend;

-- Bài 10: Gợi ý bạn bè bằng Procedure nâng cao 

-- Bài 11. Thống kê tương tác nâng cao
select p.content, count(l.post_id) from posts p
join likes l on l.post_id = p.post_id
group by p.post_id
order by count(post_id) desc
limit 5; 

-- Bài 12
delimiter $$
create procedure sp_add_comment(
    in p_user_id int,
    in p_post_id int,
    in p_content text
)
begin
    declare user_exists int default 0;
    declare post_exists int default 0;

    select count(*) into user_exists
    from users
    where user_id = p_user_id;

    select count(*) into post_exists
    from posts
    where post_id = p_post_id;

    if user_exists = 0 then
        select 'lỗi: user không tồn tại' as message;
    elseif post_exists = 0 then
        select 'lỗi: post không tồn tại' as message;
    elseif p_content is null or trim(p_content) = '' then
        select 'lỗi: nội dung bình luận rỗng' as message;
    else
        insert into comments(user_id, post_id, content)
        values(p_user_id, p_post_id, p_content);
        select 'thêm bình luận thành công' as message;
    end if;
end $$
delimiter ;

create or replace view vw_post_comments as
select 
    c.content as comment_content,
    u.username as commenter_name,
    c.created_at
from comments c
join users u on c.user_id = u.user_id
order by c.created_at desc;
call sp_add_comment(1, 2, 'he he he he he he');
select * from vw_post_comments;

-- BÀI 13. QUẢN LÝ LƯỢT THÍCH
delimiter $$
create procedure likePost(user_id_in int, post_id_in int)
begin
	declare isNull int;
    
    select user_id into isNull from likes
    where user_id = user_id_in and post_id = post_id_in;
    
    if isNull is null is not null then
		insert into likes(user_id, post_id) values(user_id_in, post_id_in);
    end if;
end $$
delimiter ;

call likePost(18, 30);

select * from likes;

drop procedure likePost;

-- Bài 14. TÌM KIẾM NGƯỜI DÙNG & BÀI VIẾT
delimiter $$
create procedure searchSocial(
	option_in int, 
	keyword varchar(255), 
    out message varchar(255)
)
begin
	case
		when option_in = 1 then
			select * from users
            where username like concat("%", keyword, "%");
		when option_in = 2 then
			select * from posts
            where content like concat("%", keyword, "%");
		else set message = "Chức năng không hợp lệ";
	end case;
end $$
delimiter ;

call searchSocial(1, "an", @message);
call searchSocial(2, "database", @message);

select @message;

select * from posts;

drop procedure searchSocial;