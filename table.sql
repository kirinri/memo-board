drop table if exists users;
drop table if exists todos;


create table users
(
  id integer primary key,
  userName text
);

create table todos
(
  id integer PRIMARY key,
  users_id integer,
  body text,
  created_at,
  foreign key (users_id) references users(id)
);

insert into users
  (id,userName)
values
  (1, "田中");

-- insert into users
--   (id,userName)
-- values
--   (2, "あかり");

-- insert into users
--   (id,userName)
-- values
--   (3, "しゅうと");




-- insert into todos
--   (body)
-- values
--   ("コメントっっっっっ")
-- ;

-- insert into todos
--   (body)
-- values
--   ("お寿司が好きですよ")
-- ;

-- insert into todos
--   (body,created_at)
-- values
--   ("コメントっっっっっ", "2020/01/01")
-- ;

-- insert into todos
--   (body,created_at)
-- values
--   ("お寿司が好きですよ", "2020/03/01")
-- ;
