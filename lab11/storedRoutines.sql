-- Active: 1663945334496@@127.0.0.1@3306@books_store_db
/* -------------------------- User Defined Variable ------------------------- */
-- SET @x = 1;
-- SET @y = @x + 5;

-- SELECT @x,@y;


-- SELECT @min_pr;

-- SELECT @min_pr:=MIN(price) FROM books;

-- SELECT CONCAT(a.fname," ",a.lname) as quthor ,b.book_name, b.price
-- FROM authors as a
-- JOIN books as b
-- ON a.id=b.author_id
-- WHERE b.price = @min_pr;


-- SELECT CONCAT(a.fname," ",a.lname) as quthor ,b.book_name, b.price
-- FROM authors as a
-- JOIN books as b
-- ON a.id=b.author_id
-- WHERE b.price = (
-- 	SELECT MIN(price) FROM books
-- );

-- SELECT @min_pr;

-- SET @min_pr = 0;

-- SELECT * FROM books
-- GROUP BY author_id;


-- SELECT @@sql_mode;


/* ---------------------------- Stored Procedures --------------------------- */

-- Find the most expensive book of author.fname='Kurt'
-- author, book_name, price
SELECT CONCAT(a.fname," ",a.lname) as author ,b.book_name, b.price
FROM authors as a
JOIN books as b
ON a.id=b.author_id
WHERE a.fname='Kurt';



CREATE PROCEDURE spGetAuthorBooks(IN author_name VARCHAR(50))
BEGIN
	SELECT CONCAT(a.fname," ",a.lname) as author ,b.book_name, b.price
	FROM authors as a
	JOIN books as b
	ON a.id=b.author_id
	WHERE a.fname=author_name;
END;


DELIMITER //
CREATE PROCEDURE spGetMostExpensiveAuthorBook
(IN author_fname VARCHAR(200), OUT max_price DECIMAL(6.2))
BEGIN
	SELECT MAX(b.price) INTO max_price
  	FROM books as b
  	JOIN authors as a
  	ON b.author_id=a.id
  	WHERE a.fname=author_fname;
END //
DELIMITER ;



-- TASK: execute next after 5 minutes
-- CREATE EVENT createTestTable
-- ON SCHEDULE
-- 	-- AT  '2022-12-19 04:49:00'
-- 	AT CURRENT_TIMESTAMP + INTERVAL 5 MINUTE
-- DO
-- 	CALL spGetAuthorBooks('Kurt');

-- CALL spGetAuthorBooks('Douglas');



SET @x = 999;
SELECT @x;


CREATE PROCEDURE spTestVars(INOUT x_seesion INT)
BEGIN
	DECLARE x INT DEFAULT 0;

	SET x = 5;
	SET x = x+1;

	SET x_seesion = x_seesion+1;

	SELECT x, x_seesion;
END;

CALL spTestVars(@x);
CALL spTestVars(@x);

SELECT MAX(price) FROM books INTO @x;

SELECT @x;




