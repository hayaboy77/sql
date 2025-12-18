SELECT * from usertbl, buytbl;

SELECT usertbl.name, buytbl.`prodName` from usertbl, buytbl WHERE usertbl.`userID` = buytbl.`userID`;
-- SELECT * from usertbl right OUTER JOIN buytbl on usertbl.`userID` = buytbl.`userID`;

SELECT U.`userID`, U.name, B.`prodName`, U.addr, CONCAT(U.mobile1, U.mobile2) 
from usertbl U left OUTER JOIN buytbl B on U.`userID` = B.`userID`
WHERE U.addr = '서울';

-- self join
-- use sqldb;

-- create Table emptbl (
--     emp CHAR(3),
--     manager CHAR(3),
--     empTel VARCHAR(8)    
-- );

-- insert into emptbl VALUES ('나사장', NULL, '0000');
SELECT * FROM emptbl;
SELECT count(*) FROM emptbl;

-- insert into emptbl VALUES ('김재무', '나사장', '2222');
-- insert into emptbl VALUES ('김부장', '김재무', '2222-1');
-- insert into emptbl VALUES ('이부장', '김재무', '2222-2');
-- insert into emptbl VALUES ('우대리', '이부장', '2222-2-1');
-- insert into emptbl VALUES ('지사원', '이부장', '2222-2-2');
-- insert into emptbl VALUES ('이영업', '나사장', '1111');
-- insert into emptbl VALUES ('한과장', '이영업', '1111-1');
-- insert into emptbl VALUES ('최정보', '나사장', '3333');
-- insert into emptbl VALUES ('윤차장', '최정보', '3333-1');
-- insert into emptbl VALUES ('이주임', '윤차장', '3333-1-1');

-- self join
-- 우 대리의 직속 상관의 연락처
SELECT * from emptbl A inner JOIN emptbl B on A.manager = B.emp;

SELECT A.emp as '부하직원', B.emp as '직속상관', `B`.`empTel` as '직속상관연락처' 
from emptbl A inner JOIN emptbl B on A.manager = B.emp
WHERE A.emp='우대리';



-- create TABLE stdTbl(
--     stdName VARCHAR(10) not NULL PRIMARY KEY,
--     addr char(4) NOT NULL
-- );

-- create TABLE clubTbl(
--     clubName VARCHAR(10) not NULL PRIMARY KEY,
--     roomNo CHAR(4) NOT NULL
-- );


-- CREATE Table stdclubTbl(

--     num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
--     stdName VARCHAR(10) NOT NULL,
--     clubName VARCHAR(10) NOT NULL,
--     Foreign Key (stdName) REFERENCES stdTbl(stdName),
--     Foreign Key (clubName) REFERENCES clubTbl(clubName)


-- );

SELECT * from stdtbl;
SELECT * from clubtbl;

-- INSERT INTO stdtbl VALUES('김범수', '경남'), ('성시경', '서울 '), ('조용필', '경기'), ('은지원', '경북'), ('바비킴', '서울');

INSERT INTO clubtbl VALUES('수영', '101호'), ('바둑', '102호'), ('축구', '103호'), ('봉사', '104호');

INSERT INTO stdclubtbl VALUES (NULL, '김범수', '바둑'), (NULL, '김범수', '축구'), (NULL, '조용필', '축구'),(NULL, '은지원', '축구'),(NULL, '은지원', '봉사'),(NULL, '바비킴', '봉사');


SELECT * from stdclubtbl;


-- 미션1
-- 학생 테이블, 동아리 테이블, 학생동아리 테이블을 이용해서 학생을 기준으로 학생이름/지역/가입한 동아리/동아리방을 출력


SELECT count(*) from stdtbl;
SELECT count(*) from clubtbl;
SELECT count(*) from stdclubtbl;

SELECT * from stdtbl, clubtbl, stdclubtbl;

SELECT count(*) from stdtbl, clubtbl, stdclubtbl ;

SELECT stdtbl.`stdName`, stdtbl.addr, clubtbl.`clubName`, clubtbl.`roomNo` 
from stdtbl INNER JOIN stdclubTbl on stdtbl.`stdname`= stdclubtbl.`stdname`
            INNER JOIN clubtbl on clubTbl.`clubName`= stdclubtbl.`clubName`;


SELECT stdtbl.`stdName`, stdtbl.addr, clubtbl.`clubName`, clubtbl.`roomNo`  
from stdtbl, clubtbl, stdclubtbl 
WHERE stdtbl.`stdname`= stdclubtbl.`stdname` and clubTbl.`clubName`= stdclubtbl.`clubName` ;

-- 미션2
-- 동아리를 기준으로 가입한 학생의 목록을 출력

SELECT C.clubName, C.roomNo, S.stdName, S.addr 
   FROM stdTBL S 
      INNER JOIN stdclubTBL SC 
         ON SC.stdName = S.stdName 
      INNER JOIN clubTBL C 
         ON SC.clubName = C.clubName 
   ORDER BY C.clubName;


-- 전체 회원의 구매 기록을 출력하되 구매 기록이 없는 회원도 출력 
SELECT * from usertbl;
SELECT * from buytbl;

SELECT * 
from usertbl, buytbl 
WHERE usertbl.`userID` = buytbl.`userID`;


SELECT usertbl.name, buytbl.`prodName` 
from usertbl LEFT OUTER JOIN buytbl 
on usertbl.`userID` = buytbl.`userID`;

-- 구매 내역이 없는 회원의 목록
SELECT usertbl.name, buytbl.`prodName` 
from usertbl LEFT OUTER JOIN buytbl 
on usertbl.`userID` = buytbl.`userID`
WHERE buytbl.`prodName` is NULL;

-- 1)동아리에 가입하지 않은 학생 출력 - 성시경의 클럽 이름에 null
SELECT S.stdName, S.addr, C.clubName, C.roomNo 
   FROM stdTBL S 
      LEFT OUTER JOIN stdclubTBL SC 
         ON S.stdName = SC.stdName 
      LEFT OUTER JOIN clubTBL C 
         ON SC.clubName = C.clubName ;
-- 2)동아리를 기준으로 가입된 학생 출력하되, 가입 학생이 하나도 없는 동아리도 출력, 수영쪽에 학생이 null
SELECT S.stdName, S.addr, C.clubName, C.roomNo 
   FROM stdTBL S 
      LEFT OUTER JOIN stdclubTBL SC 
         ON SC.stdName = S.stdName 
      RIGHT OUTER JOIN clubTBL C 
         ON SC.clubName = C.clubName;
-- 3) 위의 두 결과를 하나로 합쳐보자(UNION)
-- 즉, 동아리에 가입하지 않은 학생도 출력되고 학생이 한 명도 없는 동아리도 출력되게 하세요
SELECT S.stdName, S.addr, C.clubName, C.roomNo 
   FROM stdTBL S 
      LEFT OUTER JOIN stdclubTBL SC 
         ON S.stdName = SC.stdName 
      LEFT OUTER JOIN clubTBL C 
         ON SC.clubName = C.clubName 
UNION 
SELECT S.stdName, S.addr, C.clubName, C.roomNo 
   FROM stdTBL S 
      LEFT OUTER JOIN stdclubTBL SC 
         ON SC.stdName = S.stdName 
      RIGHT OUTER JOIN clubTBL C 
         ON SC.clubName = C.clubName;


-- 교재 5,6장 연습문제 풀이 후 제출6시 까지


-- 3)

use world;


select *
from countrylanguage A inner join country B on A.CountryCode=B.Code 
where A.Language = 'English';


SELECT * 
FROM country
WHERE code in (select countrycode from countrylanguage WHERE LANGUAGE = 'English');

select countrycode from countrylanguage WHERE LANGUAGE = 'English';


-- 1)

SELECT * 
FROM country c inner JOIN city d on c.code = d.countrycode
WHERE c.name = 'United States';

-- 2)
-- 조인
-- 서브쿼리

-- city 테이블에서 인구가 가장 많은 도시 상위 10개
-- country 테이블이서 해당 도시 국가 이름과 국가 총인구, GNP, 수명 등의 정보를 조회

-- city 테이블에서 인구가 가장 많은 도시 상위 10개
SELECT * 
FROM city
ORDER BY population desc limit 10;

-- 위의 결과가 하나의 테이블

-- SELECT *
-- from 테이블 

-- 테이블 자리에 
(SELECT * 
FROM city
ORDER BY population desc limit 10)


-- SELECT *
-- from 테이블 inner join country on 코드가 같게끔

use world;
SELECT a.name, a.countrycode, a.district, a.population, b.name, b.population, b.lifeExpectancy, b.gnp
from (SELECT name, countrycode, district, population 
FROM city
ORDER BY population desc limit 10) as a
inner join country as b on a.countrycode = b.code;


-- 4)
use sakila;


SELECT a.first_name, a.last_name, c.title, c.release_year, e.name
FROM actor as A
inner JOIN film_actor as b on a.actor_id = b.actor_id
inner JOIN film as c on b.film_id = c.film_id
inner JOIN film_category as d on c.film_id = d.film_id
inner JOIN category as e  on d.category_id = e.category_id

WHERE e.name='ACTION'
order by title;


