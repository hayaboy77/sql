-- select  num, groupName, sum(price*amount)
-- from buytbl
-- group by groupName, num
-- with rollup;

with abc(userid, total)
as 
(select userID , sum(price*amount)
from buytbl
group by userID)
select * from abc order by total desc;

-- 각 지역별로 가장 큰 키를 뽑는 쿼리 작성하시고 이 쿼리를 WITH문으로 만드세요.
select * from usertbl;

with abcd(address, maxheight)
as 
(select addr , max(height)
from usertbl
group by addr)
select * from abcd;


set @myVar1 =5;
select @myVar1;


-- 형변환
select * from buytbl;

select amount from buytbl;
select avg(amount) from buytbl;

-- 강제형변환(실수 - 정수)
select cast(avg(amount) as unsigned) as '평균 구매 개수' from buytbl;
select cast(avg(amount) as signed integer) as '평균 구매 개수' from buytbl;

-- 자동형변환
select '100' + '200'; 

select concat('100','200');

select concat(100,'200');

select cast('hi' as unsigned);
-- 문자는 0
select 1 > 'hi';


select if (true, 'hi', 'X');
select if (false, 'hi', 'X');


select case 7
when 1 then '일'
when 5 then '오'
when 10 then '십'
else '모름'
end as '연습';

select ascii('A');
select ascii(char(0));

select concat_ws('/', 2025,01,01);


select insert('abcdefghi', 3, 4, '@@@@'), insert('abcdefghi', 3, 2, '@@@@');

select  concat(trim('    이것이    '), '#');
