-- SHOW VARIABLES LIKE 'innodb_file_per_table';

-- --  InnoDB 스토리지 엔진에서 사용하는 파일 확장자  MySQL/InnoDB 개발자들이 "InnoDB data" 또는 **"InnoDB table data"**의 약자로 자연스럽게 붙인 이름입니다.


-- CREATE TABLESPACE ts_a ADD DATAFILE 'ts_a.ibd'; 
-- CREATE TABLESPACE ts_b ADD DATAFILE 'ts_b.ibd'; 
-- CREATE TABLESPACE ts_c ADD DATAFILE 'ts_c.ibd';

create table table_a(
	id int
) tablespace ts_a;



-- 커서 이용해 고객의 평균 키 구하는 스토어드 프로시저
select height from userTbl;

DELIMITER $$
create Procedure cursorProc()
BEGIN
	declare userHeight int;
    declare cnt int default 0;
    declare totalHeight int default 0;
    declare endOfRow boolean default false;
    
    declare userCursor CURSOR FOR
		select height from userTbl;
	
    declare continue handler for not found set endOfRow = True;
    
    open userCursor;
    
    cursor_loop: LOOP
		Fetch userCursor into userHeight;    
		if endOfRow then
			leave cursor_loop;
		end if;
        
        set cnt = cnt +1;
        set totalHeight = totalHeight + userHeight;
	end loop cursor_loop;

	select concat('고객 키의 평균 ==> ', (totalHeight / cnt ));
    
    close userCursor;
end $$

DELIMITER ;










