-- Active: 1663945334496@@127.0.0.1@3306@books_db

-- SELECT (lname,book_name) all book writen by Vonnegut:
SELECT a.lname, b.book_name
FROM authors AS a INNER JOIN books AS b
ON a.id = b.author_id
WHERE a.lname = 'Vonnegut';