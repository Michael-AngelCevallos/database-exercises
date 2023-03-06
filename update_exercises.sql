USE codeup_test_db;

SELECT 'All Albums:' AS ' ';
SELECT name FROM albums;

SELECT 'All albums released before 1980:' AS ' ';
SELECT name FROM albums WHERE release_date < 1980;

SELECT 'All albums by ''Michael Jackson'':' AS ' ';
SELECT name FROM albums WHERE artist = 'Michael Jackson';


-- Multiplying sales
SELECT 'Sales:' AS ' ';
SELECT sales FROM albums;
UPDATE albums
SET sales = sales * 10;
SELECT 'Sales after update:' AS ' ';
SELECT sales FROM albums;


-- Aging albums
SELECT 'Albums before 1980 are now from the 1800s' AS ' ';
UPDATE albums
SET release_date = 1800
WHERE release_date < 1980;
SELECT release_date FROM albums;


-- Messing with Michael
SELECT 'Artists: ' AS ' ';
SELECT artist FROM albums;
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';
SELECT 'Something happened to Michael Jackson... ' AS ' ';
SELECT artist FROM albums;