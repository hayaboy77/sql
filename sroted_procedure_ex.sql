-- DROP Procedure if EXISTS doit_proc;


-- -- stored procedure 틀


-- SELECT count(*) FROM customer;

-- DELIMITER $$

-- create Procedure doit_proc()
-- BEGIN
-- -- 변수 선언
--     DECLARE customer_cnt int;
--     DECLARE add_number int;

-- -- 초기값 설정
--     SET customer_cnt = 0;
--     SET add_number = 100;

--     SET customer_cnt= (SELECT count(*) FROM customer);

--     select customer_cnt + add_number;

-- END $$

-- DELIMITER ;


-- call doit_proc();


-- show create PROCEDURE doit_proc;


-- drop Procedure doit_proc;


-- 2시 45분까지 한 번 더 만들고, 삭제까지


-- if
-- store_id가 1이면 변수 s_id_one에 1씩 더하고, store_id가 1이 아니면 변수 s_id_two에 1씩 더하고, 마지막에 select로  결과를 반환

SELECT * FROM customer where customer_id =1;
-- SELECT * FROM customer WHERE customer_id = 3;


SELECT * FROM customer WHERE store_id != 1;

DELIMITER $$

create Procedure doit_if(customer_id_input int)
BEGIN
-- 변수 선언
    DECLARE store_id_i int;
    DECLARE s_id_one int;
    DECLARE s_id_two int;

-- 초기값 설정

    set store_id_i=(SELECT store_id FROM customer WHERE customer_id = customer_id_input);

    IF store_id_i = 1 THEN set s_id_one=1;
    ELSE set s_id_two=2;
    end IF;

    SELECT store_id_i,s_id_one,s_id_two;
  

END $$

DELIMITER ;

CALL doit_if(4);