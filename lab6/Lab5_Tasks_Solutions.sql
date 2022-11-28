-- Active: 1663945334496@@127.0.0.1@3306@books_db
USE books_db;

/* ----- Select all books (name and year) sorted by pub_date, ascending ----- */
SELECT book_name,pub_year
FROM books
ORDER BY pub_year;

/* ----------- How many are the books published before 1900 year: ----------- */
SELECT count(*)
FROM books
WHERE pub_year<1900;

/* ------- Select all books (name and year) published in 20th century: ------ */
SELECT *
FROM books
WHERE pub_year>=1900 and pub_year<2000;

/* ------- Select all books (name and year) written by 'Kurt Vonnegut' ------ */
SELECT book_name,pub_year
FROM books
WHERE author_id=(
	SELECT id FROM authors WHERE lname='Vonnegut'
);

SELECT lname, book_name, pub_year
FROM books,authors
WHERE author_id=authors.id AND lname LIKE 'Vonnegut';

SELECT *
FROM authors INNER JOIN books
ON author_id=authors.id
WHERE lname LIKE 'Vonnegut';

/* -Select the last 3 published books (name and year) written by 'Kurt Vonnegut' */
SELECT book_name,pub_year
FROM books
WHERE author_id=(
	SELECT id FROM authors WHERE lname='Vonnegut'
)
ORDER BY books.pub_year DESC
LIMIT 3;

/* --------- Show how many books each of the authors has published? --------- */
SELECT authors.lname AS author, count(*) AS books_count
FROM books,authors
WHERE books.author_id=authors.id
GROUP BY author_id;

/* ----------- Rename author 'Charles Dodgson' to 'Lewis Carroll' ----------- */
UPDATE authors
SET fname='Lewis',lname="Carroll"
WHERE fname='Charles' AND lname='Dodgson';

/* ------------------- Show the author who lived shorter: ------------------- */
SELECT lname, death_year-birth_year AS lived
FROM authors
ORDER BY lived LIMIT 1;

