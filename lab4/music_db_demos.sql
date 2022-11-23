
SELECT 2+3;

SELECT CURDATE();
SELECT NOW();

SELECT ROUND(3.145,2);
SELECT TRUNCATE(3.145,2);


desc artist;

TRUNCATE artist;
-- INSERT INTO artist (lname) VALUES ('Gaham');
-- INSERT INTO artist VALUES (30, 'Robert', 'Smith');

-- INSERT INTO artist (lname, fname)
-- VALUES ('Iva', 'Popova'),
--        ('jddsjk','sdjfkdsd');


INSERT INTO artist( lname, fname ) VALUES
  ( 'Schnittke', 'Alfred' ),
  ( 'Pärt', 'Arvo' ),
  ( 'Shostakovich', 'Dmitri' ),
  ( 'Smith', 'Robert'),
  ( 'Gallup', 'Simon'),
  ( 'O\'Donnell', 'Roger '),
  ( 'Gahan', 'Dave' ),
  ( 'Gore', 'Martin' ),
  ( 'Fletcher', 'Andy' ),
  ( 'Wilder', 'Alan ' );


SELECT CONCAT(fname,' ',lname) AS full_name FROM artist;

SELECT * FROM artist;

SELECT * FROM artist WHERE lname="Smith";
SELECT * FROM artist WHERE artist_id>=5;
SELECT * FROM artist WHERE fname LIKE "A%";

SELECT * FROM artist WHERE fname LIKE "A%" OR artist_id>=5;

SELECT * FROM artist WHERE NOT fname LIKE "A%";

SELECT * FROM artist ORDER BY fname DESC;

SELECT 2>12;
SELECT '2'>'12';

SELECT * FROM artist ORDER BY lname,fname;