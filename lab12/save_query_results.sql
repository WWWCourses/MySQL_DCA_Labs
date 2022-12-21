/* ------------------ Save query results for later use ------------------ */

### Variant 1: save into file
# not efficient at all
# Pros: none
SELECT * FROM table1 INTO OUTFILE 'big_sub_table.csv';
LOAD DATA INFILE 'big_sub_table.csv' INTO  TABLE big_sub_table_tmp


### Variant 2: save into PHYSICAL TABLE:
# Pros: fast to select from
# Cons: uses drive space for all sessions
CREATE TABLE IF NOT EXISTS big_sub_table_tmp AS (
	SELECT * FROM table1
)

### Variant 3: save into TEMPORARY TABLE
# temporary table are removed when the session closes
# Pros: fast to select from
# Cons: uses drive space while session is active
CREATE TEMPORARY TABLE IF NOT EXISTS big_sub_table_tmp AS (
	SELECT * FROM table1
)

### Variant 4: save into VIEW
# view is persistent across sessions. It do not store data on drive, just the quiry to get them.
# Pros: do not uses drive space
# Cons: slower than tables to select from
CREATE VIEW IF NOT EXISTS big_sub_table_tmp AS (
	SELECT * FROM table1
)
