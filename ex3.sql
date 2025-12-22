-- create table tbl_trigger_1(
--     col_1 int,
--     col_2 VARCHAR(50)
-- );


-- create table tbl_trigger_2(
--     col_1 int,
--     col_2 VARCHAR(50)
-- );


insert into tbl_trigger_1 VALUES (1, '데이터 1 입력');

 SELECT * FROM tbl_trigger_1;

  SELECT * FROM tbl_trigger_2;

 DELIMITER $$
 create Trigger dot_update_trigger
 after UPDATE
 on tbl_trigger_1 for each row

 BEGIN
    insert into tbl_trigger_2 VALUES (OLD.col_1, OLD.col_2);

end $$
DELIMITER ;

set sql_safe_updates=0;

UPDATE tbl_trigger_1 set col_1=1, col_2='1을 2를 수정';

-- 5시 부터 337  페이지 