DROP Procedure if EXISTS doit_proc;


-- stored procedure 틀


DELIMITER $$

create Procedure doit_proc()
BEGIN
-- 변수 선언
    DECLARE customer_cnt int;
    DECLARE add_number int;

-- 초기값 설정
    SET customer_cnt = 0;
    SET add_number = 100;

    SELECT * FROM cus


END
