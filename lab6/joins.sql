-- Active: 1663945334496@@127.0.0.1@3306@Tmp

/* ------------------------------- INNER JOIN ------------------------------- */
SELECT *
FROM users
INNER JOIN addresses ON users.id = addresses.user_id


SELECT *
FROM users,addresses
WHERE users.id = addresses.user_id;

/* -------------------------------- LEFT JOIN ------------------------------- */
SELECT name
FROM users AS u
LEFT JOIN addresses AS a ON u.id=a.user_id;

/* -------------------------------- RIGHT JOIN ------------------------------- */
SELECT *
FROM users AS u
RIGHT JOIN addresses AS a ON u.id=a.user_id;

-- show the cities in which nobody lives
SELECT *
FROM users AS u
RIGHT JOIN addresses AS a ON u.id=a.user_id
WHERE u.id IS NULL;

/* ----------------------------- FULL OUTER JOIN ---------------------------- */
SELECT *
FROM users AS u
LEFT JOIN addresses AS a ON u.id=a.user_id
UNION
SELECT *
FROM users AS u
RIGHT JOIN addresses AS a ON u.id=a.user_id;

SELECT *
FROM users AS u
LEFT JOIN addresses AS a ON u.id=a.user_id
WHERE a.user_id IS NULL
UNION
SELECT *
FROM users AS u
RIGHT JOIN addresses AS a ON u.id=a.user_id
WHERE u.id IS NULL;


SELECT *
FROM users AS u INNER JOIN addresses AS a
ON  u.id=a.user_id;

SELECT *
FROM users AS u
WHERE EXISTS (
  SELECT * FROM addresses AS a
  WHERE u.id=a.user_id
);

UPDATE addresses SET user_id=1 WHERE addresses.id=3;

-- left join with exclusion
SELECT *
FROM users AS u
LEFT JOIN addresses AS a ON u.id=a.user_id
WHERE a.user_id IS NULL;

SELECT *
FROM users AS u
WHERE NOT EXISTS (
  SELECT * FROM addresses AS a
  WHERE u.id=a.user_id
);





