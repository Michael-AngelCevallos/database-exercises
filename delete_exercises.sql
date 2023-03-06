USE codeup_test_db;

SELECT 'Deleting all albums released after 1990:' AS ' ';
DELETE FROM albums WHERE release_date > 1990;

SELECT 'Deleting all albums with the genre of ''Disco'':' AS ' ';
DELETE FROM albums WHERE genre = 'Disco';

SELECT 'Deleting all albums by ''Pink Floyd'':' AS ' ';
DELETE FROM albums WHERE artist = 'Pink Floyd'

