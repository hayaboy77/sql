- 3)
-- sqldb의 구매테이블(buytbl)에 구매액이 1500원 이상인 고객은 '최우수'
-- 1000원 이상인 고객은 '우수'
-- 1원 이상인 고객은 '일반'
-- 구매실적인 없는 고객 '유령고객'


use sqldb;

SELECT * FROM buytbl;

SELECT b.`userID`, a.name as '이름', sum(price * amount) as '총 구매액' 
FROM buytbl b INNER JOIN usertbl a on b.`userID`=a.`userID`
GROUP BY b.`userID`, a.name
ORDER BY sum(price * amount) DESC;


SELECT U.userID, U.name, sum(price * amount) as '총 구매액' ,
    CASE 
        WHEN (sum(price * amount)>=1500) THEN  '최우수고객'
        WHEN (sum(price * amount)>=1000) THEN  '우수고객'
        WHEN (sum(price * amount)>=1) THEN  '일반고객'
        ELSE  '유령고객'
    END as '고객등급'
FROM buytbl B RIGHT OUTER JOIN usertbl U on B.userID=U.userID
GROUP BY U.userID, U.name
ORDER BY sum(price * amount) DESC;


-- 반복문(1부터 100까지 누적)
DELIMITER $$
create Procedure whileProc()
BEGIN
--  변수 선언(i, tot)

    DECLARE i int;
    DECLARE tot int;

    set i = 1;
    set tot = 0;
    
    while(i<=100) DO
        set tot = tot +i;
        set i= i+1;
    end WHILE;

    SELECT tot;   

end $$

DELIMITER ;

CALL whileProc();



-- 오류 처리

DELIMITER $$
create Procedure errorProc()
BEGIN

    DECLARE CONTINUE HANDLER for SQLEXCEPTION SELECT '테이블 없음';
    SELECT * FROM djkflsjf;

end $$

DELIMITER ;

call errorProc();

-- 동적 SQL

-- sql문을 미리 만들어 놓고 나중에 실행
SELECT * FROM usertbl WHERE `userID`= 'EJW';

create Table myTable (
    id int AUTO_INCREMENT PRIMARY KEY,
    mDate DATETIME
);


SELECT * from mytable;

set @curDATE = CURRENT_DATE();

SELECT @curDATE;

-- ? 플레이스 홀더

PREPARE myQuery FROM 'insert into myTable values(null,?)';

EXECute myQuery using @curDATE;

DEALLOCATE PREPARE myQuery;



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


call cursorProc();


-- 트리거
