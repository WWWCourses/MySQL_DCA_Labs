-- drop table artist;

-- CREATE TABLE artist (
--   fname CHAR(10) DEFAULT NULL,
--   lname VARCHAR(20) DEFAULT NULL,
--   age TINYINT UNSIGNED DEFAULT 0,
--   salary DECIMAL(4,2),
--   price FLOAT(4,2)
-- );

-- show create table artist;

-- select * from artist;

-- insert into artist (fname) values ('john\'s pub');
-- insert into artist (fname, lname) values ('abc', 'abc');
-- insert into artist (lname) values ('abcjfsfjdskkdsjfkdsjfkdsjfkdsjfkdsjfkjdskjfdkfdkfkdsjkds');

-- insert into artist  values ('john', 'smith', 23);
-- insert into artist (lname) values ('smith2');
-- insert into artist (lname, age) values ('smith3', 256);

-- insert into artist (salary) values (99.99);
-- insert into artist (salary) values (99.991);

-- insert into artist (salary,price) values (99.456,99.456);

CREATE TABLE datetimeDemos(
  dateDemo date,
  dt datetime,
  ts timestamp
);

drop table datetimeDemos;

select * from datetimeDemos;

INSERT INTO datetimeDemos (dt) VALUES ('2022-12-31');

INSERT INTO datetimeDemos (dt,ts) VALUES ('2022.12.31 12:50', '2022.12.31 12:50');


-- INSERT INTO datetimeDemos (dateDemo) VALUES ('2022-12-31');
-- -- INSERT INTO datetimeDemos (dateDemo) VALUES ('2022-13-31'); 

-- INSERT INTO datetimeDemos (dateDemo) VALUES ('20221231');
-- INSERT INTO datetimeDemos (dateDemo) VALUES ('2022/12/31');












