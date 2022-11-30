-- Active: 1663945334496@@127.0.0.1@3306@books_db
-- -----------------------------------Select with group by-------------------------------
-- Show how many books each of the authors has published?

-- select count(*)
-- select COUNT(*) as books_count , lname
-- from authors, books
-- where authors.id=books.author_id
-- group by lname
-- order by count(*) DESC;

SELECT count(author_id)
FROM books
GROUP BY author_id;




