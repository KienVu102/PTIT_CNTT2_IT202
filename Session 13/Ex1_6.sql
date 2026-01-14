create database social_media_announcement;
use social_media_announcement;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at DATE,
    follower_count INT DEFAULT 0,
    post_count INT DEFAULT 0
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    content TEXT,
    created_at DATETIME,
    like_count INT DEFAULT 0,
    CONSTRAINT fk_posts_users FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE
);
 
INSERT INTO users (username, email, created_at) VALUES
('alice', 'alice@example.com', '2025-01-01'),
('bob', 'bob@example.com', '2025-01-02'),
('charlie', 'charlie@example.com', '2025-01-03');

delimiter $$
create trigger trg_after_insert_posts
after insert on posts
for each row
begin
	update users
	set post_count = post_count+1
	where user_id = new.user_id;
end $$
delimiter ;

delimiter $$ 
create trigger trg_after_delete
after delete on posts
for each row
begin
	update users
    set	post_count = post_count - 1
    where user_id = old.user_id;
end $$
delimiter ;

INSERT INTO posts (user_id, content, created_at) VALUES
(1, 'Hello world from Alice!', '2025-01-10 10:00:00'),
(1, 'Second post by Alice', '2025-01-10 12:00:00'),
(2, 'Bob first post', '2025-01-11 09:00:00'),
(3, 'Charlie sharing thoughts', '2025-01-12 15:00:00');

SELECT * FROM users;
delete from posts where post_id = 2;

-- b2
create table likes(
like_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
post_id INT NOT NULL ,
liked_at DATETIME DEFAULT CURRENT_TIMESTAMP,
constraint fk_like_users FOREIGN KEY (user_id)
	REFERENCES users (user_id)
	ON DELETE CASCADE,
constraint fk_like_posts foreign key (post_id)
	references posts(post_id)
    on delete cascade
);
INSERT INTO likes (user_id, post_id, liked_at) VALUES
(2, 1, '2025-01-10 11:00:00'),
(3, 1, '2025-01-10 13:00:00'),
(1, 3, '2025-01-11 10:00:00'),
(3, 4, '2025-01-12 16:00:00');

DELIMITER $$

CREATE TRIGGER trg_after_insert_likes
AFTER INSERT ON likes
FOR EACH ROW
BEGIN
    UPDATE posts
    SET like_count = like_count + 1
    WHERE post_id = NEW.post_id;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_after_delete_likes
AFTER DELETE ON likes
FOR EACH ROW
BEGIN
    UPDATE posts
    SET like_count = GREATEST(like_count - 1, 0)
    WHERE post_id = OLD.post_id;
END $$

DELIMITER ;

CREATE VIEW user_statistics AS
SELECT
    u.user_id,
    u.username,
    u.post_count,
    COALESCE(SUM(p.like_count), 0) AS total_likes
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
GROUP BY u.user_id, u.username, u.post_count;

INSERT INTO likes (user_id, post_id, liked_at) VALUES (2, 4, NOW());

SELECT * FROM posts WHERE post_id = 4;

SELECT * FROM user_statistics;

DELETE FROM likes
WHERE user_id = 2 AND post_id = 4;
-- b3
delimiter $$

create trigger trg_likes_before_insert
before insert on likes
for each row
begin
    declare post_owner int;

    select user_id
    into post_owner
    from posts
    where post_id = new.post_id;

    if post_owner = new.user_id then
        signal sqlstate '45000'
        set message_text = 'khong duoc like bai dang cua chinh minh';
    end if;
end $$

delimiter ;

delimiter $$

create trigger trg_likes_after_insert
after insert on likes
for each row
begin
    update posts
    set like_count = like_count + 1
    where post_id = new.post_id;
end $$

delimiter ;

delimiter $$

create trigger trg_likes_after_delete
after delete on likes
for each row
begin
    update posts
    set like_count = greatest(like_count - 1, 0)
    where post_id = old.post_id;
end $$

delimiter ;

delimiter $$

create trigger trg_likes_after_update
after update on likes
for each row
begin
    if old.post_id <> new.post_id then
        -- giam like o post cu
        update posts
        set like_count = greatest(like_count - 1, 0)
        where post_id = old.post_id;

        -- tang like o post moi
        update posts
        set like_count = like_count + 1
        where post_id = new.post_id;
    end if;
end $$

delimiter ;

insert into likes (user_id, post_id)
values (1, 1);
insert into likes (user_id, post_id)
values (2, 1);
select post_id, like_count from posts where post_id = 1;
update likes
set post_id = 2
where user_id = 2 and post_id = 1;
select post_id, like_count from posts where post_id in (1, 2);
delete from likes
where user_id = 2 and post_id = 2;
select post_id, like_count from posts where post_id = 2;
select * from posts;
select * from user_statistics;
-- b4
create table post_history (
    history_id int primary key auto_increment,
    post_id int not null,
    old_content text,
    new_content text,
    changed_at datetime,
    changed_by_user_id int,

    constraint fk_post_history_posts
        foreign key (post_id)
        references posts(post_id)
        on delete cascade
);

delimiter $$

create trigger trg_posts_before_update
before update on posts
for each row
begin
    if old.content <> new.content then
        insert into post_history (
            post_id,
            old_content,
            new_content,
            changed_at,
            changed_by_user_id
        )
        values (
            old.post_id,
            old.content,
            new.content,
            now(),
            old.user_id
        );
    end if;
end $$

delimiter ;
update posts
set content = 'noi dung moi sau khi chinh sua'
where post_id = 1;
update posts
set content = 'cap nhat lan 2'
where post_id = 1;
select
    history_id,
    post_id,
    old_content,
    new_content,
    changed_at,
    changed_by_user_id
from post_history
order by changed_at;
select post_id, like_count from posts where post_id = 1;
-- b5
delimiter $$

create procedure add_user(
    in p_username varchar(50),
    in p_email varchar(100),
    in p_created_at datetime
)
begin
    insert into users (username, email, created_at)
    values (p_username, p_email, p_created_at);
end $$

delimiter ;

delimiter $$

create trigger trg_users_before_insert
before insert on users
for each row
begin
    -- kiem tra email
    if new.email not like '%@%.%' then
        signal sqlstate '45000'
        set message_text = 'email khong hop le';
    end if;

    -- kiem tra username (chi chu, so, underscore)
    if new.username not regexp '^[a-zA-Z0-9_]+$' then
        signal sqlstate '45000'
        set message_text = 'username chi duoc chua chu, so va dau gach duoi';
    end if;
end $$

delimiter ;
call add_user('user_01', 'user01@gmail.com', now());
call add_user('user_02', 'user02gmail.com', now());
call add_user('user@03', 'user03@gmail.com', now());
select user_id, username, email, created_at
from users;
-- b6
create table friendships (
    follower_id int not null,
    followee_id int not null,
    status enum('pending', 'accepted') default 'accepted',

    primary key (follower_id, followee_id),

    constraint fk_friendships_follower
        foreign key (follower_id)
        references users(user_id)
        on delete cascade,

    constraint fk_friendships_followee
        foreign key (followee_id)
        references users(user_id)
        on delete cascade
);
delimiter $$

create trigger trg_friendships_after_insert
after insert on friendships
for each row
begin
    if new.status = 'accepted' then
        update users
        set follower_count = follower_count + 1
        where user_id = new.followee_id;
    end if;
end $$

delimiter ;
delimiter $$

create trigger trg_friendships_after_delete
after delete on friendships
for each row
begin
    if old.status = 'accepted' then
        update users
        set follower_count = greatest(follower_count - 1, 0)
        where user_id = old.followee_id;
    end if;
end $$

delimiter ;
delimiter $$

create procedure follow_user(
    in p_follower_id int,
    in p_followee_id int,
    in p_status enum('pending', 'accepted')
)
begin
    -- khong cho tu follow
    if p_follower_id = p_followee_id then
        signal sqlstate '45000'
        set message_text = 'khong duoc tu follow chinh minh';
    end if;

    -- kiem tra trung
    if exists (
        select 1
        from friendships
        where follower_id = p_follower_id
          and followee_id = p_followee_id
    ) then
        signal sqlstate '45000'
        set message_text = 'da ton tai quan he follow';
    end if;

    insert into friendships (follower_id, followee_id, status)
    values (p_follower_id, p_followee_id, p_status);
end $$

delimiter ;
create view user_profile as
select
    u.user_id,
    u.username,
    u.follower_count,
    u.post_count,
    coalesce(sum(p.like_count), 0) as total_likes,
    group_concat(
        concat('[', p.post_id, '] ', left(p.content, 30))
        order by p.created_at desc
        separator ' | '
    ) as recent_posts
from users u
left join posts p on u.user_id = p.user_id
group by u.user_id, u.username, u.follower_count, u.post_count;
call follow_user(1, 1, 'accepted');
call follow_user(2, 1, 'accepted');
call follow_user(3, 1, 'accepted');
call follow_user(4, 1, 'pending');
delete from friendships
where follower_id = 2 and followee_id = 1;
select user_id, follower_count from users where user_id = 1;
select * from user_profile where user_id = 1;