-- insert into membertbl(memberid, membername, memberaddress) values ('Dang', '당탕이','경기 부천시 중동');
select * from membertbl;
insert into membertbl(memberid, membername, memberaddress) values ('Jee', '지운이','서울 은평구 증산동');
insert into membertbl(memberid, membername, memberaddress) values ('Han', '한주연','인천 남구 주안동');
insert into membertbl(memberid, membername, memberaddress) values ('Sang', '상길이','경기 성남시 분당구');
insert into membertbl(memberid, membername, memberaddress) values ('Naota', '나오타','주소 불명');

insert into producttbl values('컴퓨터',10,'2021-01-01','삼성',17);
insert into producttbl values('세탁기',20,'2022-09-01','LG',3);
-- insert into producttbl values('냉장고',5,'2023-02-01','대우',22);
-- select memberID,memberName from membertbl where memberID='Dang';
-- select * from membertbl where memberAddress like '경기%';

select * from membertbl where memberAddress like '경기%' and memberID = 'Sang';
select * from membertbl where memberAddress like '경기%' or memberID = 'Sang';
select * from producttbl where cost>10;

select * from producttbl where cost>5 and cost<20;

select * from producttbl where cost between 5 and 20;
select * from producttbl where cost>=5 and cost<=20;

select * from producttbl where company in ('대우','삼성');

select * from membertbl where memberID='Naota';

update membertbl set memberAddress='서울 강서구 화곡동' where memberID='Naota';
select * from membertbl;

delete from membertbl where memberID = 'Naota';


