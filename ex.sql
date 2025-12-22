SELECT * FROM employees;

SELECT * FROM employees WHERE emp_no = 10001;
-- 1)
-- 열에는 입사일이(hire_date) 있는데, 직원번호에 10001번에 해당하는 직원의 입사일이 5년이 넘었는지 확인
-- current_Date()
-- datediff 함수

SELECT current_Date() ;

-- SELECT datediff(current_Date(), 2025-12-22) ;

use employees;

DELIMITER $$
create Procedure ifProc2()
BEGIN
--  변수 선언(입사일 hireDate date, 오늘 curDate date, 근무한 일수 days int)

    DECLARE hireDate date;
    DECLARE curDate date;
    DECLARE days int;


    SELECT hire_date into hireDate FROM employees WHERE emp_no = 10001;

-- 변수 값 할당 set
    set curDate = current_Date();
    set days = datediff(curDate, hiredate);

    IF (days/365)>=5 THEN
        SELECT CONCAT('입사한 지 ', days, '일이 지났습니다. 축하합니다. ');
    ELSE
        SELECT '입사한지 ' + days + '일 밖에 안되었네요, 화이팅.';
    end if;

end $$

DELIMITER ;

call ifProc2();





-- 만약 5년이 지났다면 입사한지 00일이 지났습니다. 축하합니다.
-- 그렇지 않으면 입사한지 00일 밖에 안되었네요, 화이팅.

-- 2)
-- case  when 구문 이용해서
-- 학점 프로그램
-- 90점 이상은 A, 80점 이상은 B,  70점 이상은 C, 60점 이상은 D,  60점 미만은 F
-- 결과값:
-- 취즉점수 --> 77   학점 --> C

DELIMITER $$
create Procedure caseProc()
BEGIN
--  변수 score int, 학점 grade char(1)

    DECLARE score int;
    DECLARE grade char(1);
    set score = 77;

    CASE 
        WHEN score >= 90 THEN  
            set grade = 'A';
        WHEN score >= 80 THEN  
            set grade = 'B';
        WHEN score >= 70 THEN  
            set grade = 'C';
        WHEN score >= 60 THEN  
            set grade = 'D';
        ELSE  
            set grade = 'F';
    END CASE;

    SELECT CONCAT('취즉점수 -->', score), CONCAT('학점 --> ' , grade);

    
end $$

DELIMITER ;

CALL caseProc();



- 3)
-- sqldb의 구매테이블(buytbl)에 구매액이 1500원 이상인 고객은 '최우수'
-- 1000원 이상인 고객은 '우수'
-- 1원 이상인 고객은 '일반'
-- 구매실적인 없는 고객 '유령고객'





-- 4시반 이후 프로젝트-내일까제 제출(개인공유폴더)
-- 개인프로젝트- 교재 338페이지
-- 1) 교재대로
-- 2) 응용(교통관련)
