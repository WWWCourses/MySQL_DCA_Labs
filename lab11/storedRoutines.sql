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
WHERE a.fname='Kurt'
AND b.price=(SELECT MAX(price) FROM books);

UPDATE books SET price=45.5 where id=1;
UPDATE books SET price=55.9 where id=2;
UPDATE books SET price=55.9 where id=3;

-- TODO:check why price not inserted as DECIMAL(6)
(IN id_to_update INT, IN new_price DECIMAL(6,2))
BEGIN
  UPDATE books SET price=new_price where id=id_to_update;
END;

CALL spUpdatePrice(2,55.9);
CALL spUpdatePrice(3,12.5);

13.00

