-- Active: 1663945334496@@127.0.0.1@3306@dca
/* -------------------------------- overview -------------------------------- */

-- Find books written by 'Adams' (lname, book_name)

-- Find id of Adams:

-- WHERE lname = 'Adams';

-- find books (book_name) where author_id = 2
SELECT book_name
FROM books
WHERE author_id = (
	SELECT id
	FROM authors
	WHERE lname LIKE 'Adams'
);


/* --------------------- Comparison Operators: Overview --------------------- */

-- compare scalars:
SELECT 3>=3;
SELECT 3>="3";
SELECT "12">9;
SELECT "12">"9"; -- ASCII(1) > ASCII(9)

SELECT 45<=50;

-- compare columns:
-- find all products without profit:

SELECT selling_price <= cost_price FROM sales;
SELECT *
FROM sales
WHERE selling_price <= cost_price;


/* ------------------- Subqueries in comparison operators ------------------- */
-- operand1 comparison_operator (subquery)

SELECT *
FROM t1
WHERE c1 =(
	SELECT SUM(c2)
	FROM t2
);

/* ----------------------------------- ANY ---------------------------------- */
SELECT cost_price FROM sales;

SELECT *
FROM sales
WHERE selling_price < ANY (
	SELECT cost_price FROM sales
);


--example 2
SELECT b.author_id FROM books as b
  WHERE b.pub_year>1950;

-- Find authors who published books after 1950
SELECT *
FROM authors as a
WHERE a.id = ANY(
  SELECT b.author_id FROM books as b
  WHERE b.pub_year>1950
);

-- variant with JOIN
SELECT *
FROM authors AS a
INNER JOIN books AS b
ON a.id = b.author_id
WHERE b.pub_year>1950;


-- find t1.c1 values which are bigger than any value in t2.c2 (expected: 8,16)

/* -------------------------------- ANY vs IN ------------------------------- */
-- SELECT 2 IN (4,5,3,2,1,5);
-- SELECT 2 =ANY (4,5,3,2,1,5);

-- = ANY / IN
SELECT *
FROM t1
WHERE c1 IN (
  SELECT c2 FROM t2
);

SELECT *
FROM t1
WHERE c1 = ANY (
  SELECT c2 FROM t2
);

-- <> ANY / NOT IN
SELECT *
FROM t1
WHERE c1 NOT IN (
  SELECT c2 FROM t2
);

-- this is equivalent as above
SELECT *
FROM t1
WHERE c1 <> ALL (
  SELECT c2 FROM t2
);

SELECT *
FROM t1
WHERE c1 <> SOME (
  SELECT c2 FROM t2
);


-- ROW constructor
SELECT *
FROM books
WHERE (book_name, pub_year) = ('Mother Night',1961);

-- SELECT  what (columns)
-- FROM (from table)
-- WHERE filter;

 /* -------------------------- EXISTS or NOT EXISTS -------------------------- */

SELECT *
FROM t1
WHERE NOT EXISTS (
	SELECT c2 FROM t2
);

--  find authors who have published books after 1950 year:
SELECT a.fname,a.lname
FROM authors AS a
WHERE EXISTS (
  SELECT * FROM books AS b
  WHERE pub_year>1950 AND a.id=b.author_id
);


-- Find users who have address records:

SELECT u.name
FROM users AS u
WHERE EXISTS (
  SELECT * FROM addresses AS a
  WHERE u.id=a.user_id
);


-- Find users who not have address records:
SELECT u.name
FROM users AS u
WHERE NOT EXISTS (
  SELECT * FROM addresses AS a
  WHERE u.id=a.user_id
);








