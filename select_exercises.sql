USE codeup_test_db;

SELECT 'Albums by ''Pink Floyd'':' AS ' ';
SELECT name FROM albums WHERE artist = 'Pink Floyd';

SELECT 'Release Date of Back in Black:' AS ' ';
SELECT release_date FROM albums WHERE name = 'Back in Black';

SELECT 'Albums Released in the 90''s:' AS ' ';
SELECT name FROM albums WHERE release_date >= 1990;

SELECT 'Albums with less than 20 mil. sales:' AS ' ';
SELECT name FROM albums WHERE sales < 20.0;

SELECT 'Albums with genre of: Rock, Soft Rock' AS ' ';
SELECT name FROM albums WHERE genre = 'Rock, Soft Rock';

