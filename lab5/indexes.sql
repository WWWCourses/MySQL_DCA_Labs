-- drop INDEX idx_first_name on employees;

-- ALTER TABLE employees ADD INDEX (first_name);

-- select * from employees limit 10;

-- -- select * from employees where first_name='Parto';
-- select * from employees where last_name='Bamford';

-- CREATE INDEX last_name_idx ON employees(last_name);


-- desc employees;

-- show CREATE TABLE employees;


CREATE TABLE t(
	id INT PRIMARY KEY,
  	c1 SMALLINT CHECK(c1>0),
  	c2 SMALLINT,
  	CHECK (c2-c1>0)
);

desc t;

-- show create TABLE t;

-- INSERT INTO t VALUES (1, 2);

/* ------------------------------- FOREIGN KEY ------------------------------ */
use Tmp;

drop TABLE orders;

-- Define the Parent Table
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Define the Child Table
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

INSERT INTO orders (customer_id,order_date) VALUES
(1,'2020-01-10'),
(1,'2020-02-10'),
(1,'2020-03-10');

select * from orders;
select * from customers;

DROP TABLE customers;
DELETE FROM customers WHERE id=1;




