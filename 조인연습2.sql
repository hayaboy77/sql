-- SELECT * from stdtbl
-- UNION
-- SELECT * from clubtbl;

-- UNION ALL 은 중복된 열까지 모두 출력

SELECT * from stdtbl
UNION ALL
SELECT * from clubtbl;


-- 서브쿼리 방식_반드시 암기_면접 자주 출제(조인과 함께)
-- 서브 쿼리에서 not in
-- in ~ 에 포함
-- usertbl에서 mobile1이 null인 경우 
-- 그 사람을 제외하고 전화번호를 01000000000로 조회


-- 서브(sub) 쿼리
-- 작은 쿼리(안쪽)를 먼저 짜라
-- usertbl에서 mobile1이 null인 경우 

SELECT name FROM usertbl WHERE mobile1 is null;

-- in( 성시경, 윤종신)

-- not in( 성시경, 윤종신)

-- 바깥쪽쿼리
SELECT name, CONCAT(mobile1,mobile2)
FROM usertbl 
WHERE name not in (SELECT name FROM usertbl WHERE mobile1 is null);

-- 전화번호 없는 사람 이름 나오게

SELECT name, CONCAT(mobile1,mobile2)
FROM usertbl 
WHERE name in (SELECT name FROM usertbl WHERE mobile1 is null);

SELECT name, CONCAT(mobile1,mobile2)
FROM usertbl 
WHERE name not in (SELECT name FROM usertbl WHERE mobile1 is not null);


select * from countrylanguage where CountryCode in (select code from country where Language = 'English');