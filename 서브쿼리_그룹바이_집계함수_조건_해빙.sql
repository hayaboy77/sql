-- create database sqldb;

-- CREATE TABLE usertbl -- 회원 테이블
-- ( userID  	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
--   name    	VARCHAR(10) NOT NULL, -- 이름
--   birthYear   INT NOT NULL,  -- 출생년도
--   addr	  	CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
--   mobile1	CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
--   mobile2	CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
--   height    	SMALLINT,  -- 키
--   mDate    	DATE  -- 회원 가입일
-- );

-- CREATE TABLE buytbl -- 회원 구매 테이블(Buy Table의 약자)
-- (  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
--    userID  	CHAR(8) NOT NULL, -- 아이디(FK)
--    prodName 	CHAR(6) NOT NULL, --  물품명
--    groupName 	CHAR(4)  , -- 분류
--    price     	INT  NOT NULL, -- 단가
--    amount    	SMALLINT  NOT NULL, -- 수량
--    FOREIGN KEY (userID) REFERENCES usertbl(userID)
-- );





-- INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
-- INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
-- INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
-- INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
-- INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
-- INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
-- INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
-- INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
-- INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
-- INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
-- INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
-- INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
-- INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
-- INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
-- INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
-- INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
-- INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
-- INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
-- INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
-- INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
-- INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
-- INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);


select * from usertbl;
select * from buytbl;


describe usertbl;


select * from usertbl where userID='KKH';

select name, height from usertbl where userID='KKH';

-- 김경호의 키보다 키가 큰사람


select name, height from usertbl  where height > 177;

select name, height from usertbl  where height > (select height from usertbl where userID='KKH');


select addr from usertbl;

select name, height from usertbl where addr='경남';
--  any는 or 연산자
select name, height from usertbl  where height > any (select height from usertbl where addr='경남');

select name, height from usertbl  where height > all (select height from usertbl where addr='경남');

select name, height from usertbl  order by height;

select name, height from usertbl  order by height desc,  name asc;

select name, height from usertbl  order by height desc,  name asc limit 5;

select addr from usertbl;

select  distinct addr from usertbl;

--  테이블 복사
create table buytbl2 (select * from buytbl);


select * from buytbl;


select * from buytbl group by userID;
--  group by와 집계함수
select userID, avg(amount) as '사용자별 평균구매' from buytbl group by userID;
select userID, sum(amount) from buytbl group by userID;
select userID, sum(price) from buytbl group by userID;
select userID, min(price) from buytbl group by userID;
select userID, max(price) from buytbl group by userID;
select userID, count(price) from buytbl group by userID;


-- 가장 큰 키와 가장 작은 키의 회원 이름과 키를 출력하는 1번의 쿼리 실행으로 작성해보세요. 단, 서브쿼리 사용
-- 조용필 166
-- 성시경 186

select max(height) from usertbl;
select min(height) from usertbl;
select name, height from usertbl group by userID;

select name, height 
from usertbl 
where height = (select max(height) from usertbl) or height = (select min(height) from usertbl);

--  휴대폰이 있는 사용자의 수를 카운트해보세요.

select  name, mobile1, mobile2 
from usertbl
where mobile1 is null or mobile2 is null; 

select  name, mobile1, mobile2 
from usertbl
where mobile1 is not null and mobile2 is not null; 

select  count(*) as '휴대폰이 있는 사용자 수'
from usertbl
where mobile1 is not null and mobile2 is not null; 

-- 4시 37분까지
-- 총 구매액이 1,000 이상인 사용자에게만 사은품을 증정하고 싶다면 group by와 having을 이용하여 작성해보세요.

-- 1+1;
select 1+1 from dual;
select 1-1 from dual;
select 1*1 from dual;
select 1/1 from dual;

select * from buytbl;
select price*amount as '총구매액' from buytbl;

select userID, sum(price*amount) as '총구매액' 
from buytbl 
group by userID
having sum(price*amount)>=1000 
order by sum(price*amount);












