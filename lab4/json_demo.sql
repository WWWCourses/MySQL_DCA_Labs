-- Active: 1663945334496@@127.0.0.1@3306@dca
use dca;
CREATE TABLE json_demo(
	j JSON
);

drop TABLE json_demo;

INSERT INTO json_demo VALUES
('
	{
		"userName":"Ada",
		"age":23,
		"address":["Sofia","Bulgaria"]
	}
'),
('
	{
		"userName":"Pesho",
		"age":23,
		"address":["Plovdiv","Bulgaria"]
	}
');
-- INSERT INTO json_demo
-- VALUES
-- 	('[4,5,6]'),
-- 	('["a","b","c"]');

SELECT * FROM json_demo;
SELECT j->'$[0].address[0]' FROM json_demo;