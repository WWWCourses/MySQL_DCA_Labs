-- Active: 1663945334496@@127.0.0.1@3306@dca
-- select GREATEST(2,3,4);
-- select MAX(2,3,4); -- ERROR

/* ---------------------- Aggregate Functions Overview ---------------------- */
SELECT * FROM t1;

-- SYNTAX:
-- 	function_name(DISTINCT|ALL expression)

SELECT SUM(DISTINCT c2), SUM(c2)+10, SUM(c2+10)
FROM t1;

SELECT MAX(c1), SUM(c2_)
FROM t1;

SELECT COUNT(*), COUNT(c2),COUNT(DISTINCT c2)
FROM t1;

SELECT COUNT(*), COUNT(c2)
FROM t1;

-- let's get the non NULL values in c2:
SELECT c2
FROM t1
WHERE c2 IS NOT NULL;

-- Note the difference
SELECT AVG(c2), SUM(c2)/COUNT(*),SUM(c2)/COUNT(c2),
	AVG(DISTINCT c2),SUM(DISTINCT c2)/COUNT(DISTINCT c2)
FROM t1;

SELECT SUM(c1), SUM(c2) FROM t1;
SELECT MIN(c1), MIN(c2) FROM t1;
SELECT MAX(c1), MAX(c2) FROM t1;

-- TASK: select c2 values which are > AVG(c2)
-- SELECT *
-- FROM t1
-- WHERE c2>=AVG(c2); -- ERROR

-- solution using subquery
SELECT *
FROM t1
WHERE c2>=(
	SELECT AVG(c2) from t1
);

-- solution using custom varibles - just a demo, better to use it in functions/procedures
SET @avg_c2 := (SELECT AVG(c2) from t1);

SELECT @avg_c2 ; -- just check what we have in @avg_c2 variable

SELECT *
FROM t1
WHERE c2>=@avg_c2;


/* -------------------- GROUP BY with Aggregate FUncitons ------------------- */
SELECT * FROM t1;

SELECT MAX(c2)
FROM t1
GROUP BY c1;


SELECT * FROM drinks
ORDER BY continent,country;

-- TASK: select distinct continents
select distinct country from drinks;

-- TASK: find max wine servings in whole table
SELECT MAX(wine_servings) FROM drinks; -- 370

-- TASK: find max wine servings per each continent
SELECT continent, MAX(wine_servings)
FROM drinks
GROUP BY continent;

-- Note the error : In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'dca.drinks.country'; this is incompatible with sql_mode=only_full_group_by
SELECT country, continent, MAX(wine_servings)
FROM drinks;

-- Check if sql_mode=only_full_group_by
SHOW variables like 'sql_mode';

-- IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION


-- TASK: select country_count per each continent, if country_count > 30
SELECT continent, count(country) as country_count
FROM drinks
GROUP BY continent
HAVING country_count>30;


-- TASK:  Find continents which consumes more wine than spirit
SELECT continent, count(country) as country_count, AVG(wine_servings) as avg_wine, AVG(spirit_servings) as avg_spirit
FROM drinks
GROUP BY continent
HAVING avg_wine>avg_spirit;