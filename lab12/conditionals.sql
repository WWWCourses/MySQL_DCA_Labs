-- Active: 1663945334496@@127.0.0.1@3306@Tmp
create table test(
	status_id  SMALLINT UNSIGNED,
	converted_due_now DECIMAL(5,2) UNSIGNED
);

INSERT INTO test
VALUES
	(1, 1.5),
	(2, 2.5),
	(1, 3.5),
	(2, 4.5);

SELECT * FROM test;

/* ---------------------------------- CASE ---------------------------------- */
-- ### TASK: sum converted_due_now for each row if status_id = 1, else:0
-- (1.5+0+3.5+0)
-- SELECT SUM(CASE WHEN status_id=1 THEN converted_due_now ELSE 0 END)
-- FROM test;

-- CASE Syntax: Variant 1
--     WHEN  @x = 1 THEN CALL task1;
--     WHEN  @x = 2 THEN CALL task2;
--     WHEN  @x = 3 THEN CALL task3;
--     ELSE CALL exit
-- END;

-- CASE Syntax: Variant 2
-- SET @x = 1
-- CASE @x
--     WHEN 1 THEN CALL task1
--     WHEN 2 THEN CALL task2
--     WHEN 3 THEN CALL task3
-- 	   ELSE CALL exit
-- END CASE;

/* ------------------------------- IF Function ------------------------------ */
-- IF(expr1,expr2,expr3)

-- SELECT SUM( IF(status_id=1,converted_due_now,0) )
-- FROM test;

/* ------------------------------ IF Statement ------------------------------ */
-- IF @x = 1 THEN CALL task1
-- 	ELSEIF @x = 2 THEN CALL task2
-- 	ELSEIF @x = 3 THEN CALL task3
-- 	ELSE CALL exit
-- END IF


/* ---------------------------- WITH cte AS name ---------------------------- */
-- CTE: https://chartio.com/resources/tutorials/using-common-table-expressions/


-- WITH Cost_by_Month AS
-- (SELECT campaign_id AS campaign,
--        TO_CHAR(created_date, 'YYYY-MM') AS month,
--        SUM(cost) AS monthly_cost
-- FROM marketing
-- WHERE created_date BETWEEN NOW() - INTERVAL '3 MONTH' AND NOW()
-- GROUP BY 1, 2
-- ORDER BY 1, 2)
-- SELECT * FROM Cost_by_Month;

-- SET @Cost_by_Month = (SELECT campaign_id AS campaign,
--        TO_CHAR(created_date, 'YYYY-MM') AS month,
--        SUM(cost) AS monthly_cost
-- 	FROM marketing
-- 	WHERE created_date BETWEEN NOW() - INTERVAL '3 MONTH' AND NOW()
-- 	GROUP BY 1, 2
-- 	ORDER BY 1, 2
-- );

-- SELECT * FROM @Cost_by_Month; -- error
-- SELECT * FROM @Cost_by_Month;












