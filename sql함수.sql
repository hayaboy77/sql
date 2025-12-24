-- 6장 연습문제
SELECT  CONCAT(NAme, ' ', `Continent`, ' ', `Population`) FROM country;

SELECT  name, IFNULL(`IndepYear`, '데이터 없음') 
FROM country
WHERE `IndepYear` is NULL;


SELECT  name, IFNULL(`IndepYear`, '데이터 없음') 
FROM country
WHERE `IndepYear` is NULL;


-- 3)
SELECT  UPPER(name), LOWER(name) 
FROM country;

-- 4)
SELECT  LTRIM(`Name`), RTRIM(`Name`), TRIM(`Name`)
FROM country;


-- 5)
SELECT  `Name`, LENGTH(name) as '나라 이름 길이'
FROM country
WHERE LENGTH(name) >= 20 
ORDER BY LENGTH(name) DESC;


-- 6)
SELECT  `SurfaceArea`
FROM country;

SELECT  ROUND(`SurfaceArea`, 0)
FROM country;

SELECT name, `SurfaceArea`, POSITION('.' in `SurfaceArea`)
FROM country;

-- 7)
SELECT name, SUBSTRING(`Name`,2,4)
FROM country;

-- 8)
SELECT code, REPLACE(`Code`,'A','Z')
FROM country;


-- 9)
SELECT code, REPLACE(`Code`,'A',REPEAT('Z',10))
FROM country;

-- 10)
SELECT now(), DATE_ADD(now(), INTERVAL 24 HOUR) ;
-- SELECT now() from dual ;

-- 11)
SELECT now(), DATE_SUB(now(), INTERVAL 24 HOUR) ;


-- 12)
SELECT DAYNAME('2025-12-25')

-- 13)
SELECT count(*) from country;
-- 14)
SELECT sum(gnp), avg(gnp),max(gnp),min(gnp) from country;

-- 15)
SELECT `Name`, `LifeExpectancy`, ROUND(`LifeExpectancy`,-1) from country;
-- 16
SELECT  `LifeExpectancy`, `Name` from country ORDER BY `LifeExpectancy` DESC , name ASC;

SELECT ROW_NUMBER() OVER (ORDER BY `LifeExpectancy` DESC , name ASC) as 'row_number', `LifeExpectancy`, `Name` from country ;


-- 17
-- SELECT `LifeExpectancy`, `Name`  FROM country ORDER BY `LifeExpectancy`, name ASC;
SELECT RANK() OVER (ORDER BY `LifeExpectancy` DESC) as '순위', `Name`, `LifeExpectancy` FROM country;

-- 18
SELECT DENSE_RANK() OVER (ORDER BY `LifeExpectancy` DESC) as '순위', `Name`, `LifeExpectancy` FROM country;

-- 7장 연습문제 
-- percentage 열이 5보다 크면 '5+'로 표시하고 5보다 작으면 '5-'로 표시
-- select * from countrylanguage;

-- 1)
select `CountryCode`, `Language`, Percentage, if(Percentage>=5,'5+','5-' ) as '--' from countrylanguage;

-- 2)
-- 기대수명 열이 100보다 크면 'Wow' 
-- 기대수명 열이 80보다 크면 'Best' 
-- 기대수명 열이 70보다 크면 'Good' 
-- 기대수명 열이 60보다 크면 'Normal' 
-- 기대수명 열이 60보다 적으면 'Sad' 

select 
    Name,LifeExpectancy,
    CASE 
        WHEN LifeExpectancy >= 100 THEN  'Wow'
        WHEN LifeExpectancy >= 80 THEN  'Best'
        WHEN LifeExpectancy >= 70 THEN  'Good'
        WHEN LifeExpectancy >= 60 THEN  'Normal'
        WHEN LifeExpectancy < 60 THEN  'Sad'        
    END
from country;


-- 3
-- 두 개의 입력값(시작값, 마지막값)을 받아 두 입력 값 범위 사이의 숫자를
-- 순차적으로 더하는 스토어드 프로시저

DELIMITER $$
create Procedure doit_sum(
    num1 int, num2 int
)
begin
    declare tot int;
    set tot=num1;
    mywhile:
        while (num1<=num2) DO
                set tot = tot + num1;  
                set num1=num1+1;
            if(num1>num2) THEN
                leave mywhile;
            end if;        
    end while;
    SELECT tot;
END $$
DELIMITER ;

call doit_sum(0,10);


-- 4)
DROP PROCEDURE IF EXISTS doit_sum;


-- 5

-- 뷰 create view 뷰이름
-- 조인
-- select * from 테이블 inner join  테이블 on

CREATE VIEW v_country_language
as 
SELECT
	a.Name, a.Region, b.Language, b.IsOfficial, b.Percentage
FROM country AS a
	INNER JOIN countrylanguage AS b ON a.Code = b.CountryCode;

-- 뷰 조회
SELECT * FROM v_country_language;

-- 6
DROP VIEW v_country_language;