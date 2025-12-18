-- use employees;

-- SELECT first_name, last_name, hire_date 
-- FROM employees.employees 
-- LIMIT 500;

-- SELECT count(*) FROM employees.employees; 


-- CREATE TABLE indexTBL (first_name varchar(14), last_name varchar(16), hire_date date);


-- select * from indexTBL;

-- INSERT INTO indexTBL 
-- 	SELECT first_name, last_name, hire_date 
-- 	FROM employees.employees 
-- 	LIMIT 500;

-- select count(*) from indexTBL;

-- SELECT * FROM indexTBL WHERE first_name = 'Mary';

-- CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name);

-- SELECT * FROM indexTBL WHERE first_name = 'Mary';



-- CREATE VIEW uv_memberTBL 
-- AS 
-- SELECT memberName, memberAddress FROM memberTBL;
-- SELECT * FROM uv_memberTBL;

