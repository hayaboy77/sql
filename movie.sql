-- CREATE DATABASE movieDB;


-- CREATE TABLE movieTBL 
-- ( movie_id INT,
--   movie_title VARCHAR(30), 
--   movie_director VARCHAR(20), 
--   movie_star VARCHAR(20), 
--   movie_script LONGTEXT, 
--   movie_film LONGBLOB ) 
-- DEFAULT CHARSET=utf8mb4;




-- select * from movietbl;

-- -- 기존 행 제거
-- truncate movietbl;

-- INSERT INTO movieTBL VALUES (1, '쉰들러 리스트', '스필버그', '리암 니슨', LOAD_FILE('C:/SQL/Movies/Schindler.txt'), LOAD_FILE('C:/SQL/Movies/Schindler.mp4'));

-- INSERT INTO movieTBL VALUES ( 2, '쇼생크 탈출', '프랭크 다라본트', '팀 로빈스', 
--       LOAD_FILE('C:/SQL/Movies/Shawshank.txt'), LOAD_FILE('C:/SQL/Movies/Shawshank.mp4') );

-- INSERT INTO movieTBL VALUES ( 3, '라스트 모히칸', '마이클 만', '다니엘 데이 루이스', 
--       LOAD_FILE('C:/SQL/Movies/Mohican.txt'), LOAD_FILE('C:/SQL/Movies/Mohican.mp4') );

-- select * from movietbl;


SHOW variables LIKE 'max_allowed_packet';


SHOW variables LIKE 'secure_file_priv';










