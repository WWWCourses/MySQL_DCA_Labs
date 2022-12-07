-- Active: 1663945334496@@127.0.0.1@3306@books_store_db

/* --------------------------------- Task 1 --------------------------------- */
-- Select (fname, lname,book_name) for all books published by all authors
SELECT a.fname, a.lname, b.book_name
FROM authors as a
JOIN books as b
	ON a.id = b.author_id
ORDER BY a.fname;

/* --------------------------------- Task 2 --------------------------------- */
-- Select (book_name, pub_year) of the books written by Douglas Adams, sorted by book_name
SELECT b.book_name,b.pub_year
FROM authors as a
JOIN books as b
	ON a.id = b.author_id
WHERE fname='Douglas' AND lname='Adams'
ORDER BY b.book_name;


/* --------------------------------- Task 3 --------------------------------- */
-- Select (fname, lname, book_name, pub_year) for the author who has published the earliest book.


SELECT fname, lname, book_name, pub_year
FROM authors as a
JOIN books as b
	ON a.id = b.author_id
WHERE pub_year = (
	-- you must use non co-related query
	SELECT MIN(pub_year) FROM books
);

/* --------------------------------- Task 4 --------------------------------- */
-- Select (fname, lname, books_count) for authors and the books count each have published, sorted descending by books_count

SELECT a.fname,a.lname, count(*) as books_count
FROM authors as a
JOIN books as b
	ON a.id = b.author_id
GROUP BY a.fname,a.lname;


-- show CREATE TABLE authors;

-- INSERT INTO authors (fname,lname,birth_year,death_year) VALUES ('Georgi', 'Karaslovov', 1904, 1944);

/* --------------------------------- Task 5 --------------------------------- */
-- Select authors.lname for authors who have published books after 1950
SELECT a.lname, count(*)
FROM authors as a
JOIN books as b
	ON a.id = b.author_id
WHERE pub_year>1950
GROUP BY a.lname;

SELECT DISTINCT a.lname
FROM authors as a
JOIN books as b
	ON a.id = b.author_id
WHERE pub_year>1950;


/* --------------------------------- TASK 6: -------------------------------- */
-- Select book_name, authors.lname for books published after 1950
SELECT b.book_name, b.pub_year, a.lname
FROM authors as a
JOIN books as b
	ON a.id = b.author_id
WHERE pub_year>1950;

/* --------------------------------- TASK 7: -------------------------------- */
-- Select fname,lname for the author who had sell most books


-- Variant 1
--   Sub-task:
-- 		Find author_id who have sold most books
SELECT a.fname, a.lname
FROM authors as a
JOIN (
	SELECT b.author_id, count(*) as author_count
	FROM clients_books as a
	inner join books as b
		on a.book_id = b.id
	group by b.author_id
	ORDER BY author_count DESC
	LIMIT 1
) as t
ON a.id=t.author_id;


-- Variant 2
select lname, fname, count(*) as sold
from authors as a
inner join books as b
	on a.id=b.author_id
inner join clients_books as cb
	on b.id=cb.book_id
group by author_id order by sold desc LIMIT 1;

