USE codeup_test_db;

truncate albums;
-- INSERT INTO albums (artist, name , release_date, sales, genre)
-- VALUES ('Michael Jackson', 'Thriller', 1982, 47.3, 'Pop, Funk, Rock');


INSERT INTO albums (artist, name , release_date, sales, genre)

VALUES  ('Michael Jackson', 'Thriller', 1982, 47.3, 'Pop, Funk, Rock'),
        ('AC/DC', 'Back in Black', 1980, 29.4, 'Hard Rock'),
        ('Meat Loaf', 'Bat out of Hell', 1977, 21.5, 'Hard Rock, Glam Rock, Heavy Metal'),
        ('Pink Floyd', 'The Dark Side of The Moon', 1973, 24.2, 'Progressive Disco'),
        ('Whitney Houston', 'The Bodyguard', 1992, 28.4, 'R&B, Soul, Pop, Soundtrack'),
        ('Eagles', 'Their Greatest Hits', 1976, 32.2, 'Rock, Soft Rock'),
        ('Bee Gees', 'Saturday Nights', 1977, 21.6, 'Disco'),
        ('Fleetwood Mac', 'Rumors', 1977, 27.9, 'Soft Rock'),
        ('Various Artists', 'Grease Soundtrack', 1978, 14.4, 'Soundtrack'),
        ('Led Zeppelin', 'Led Zeppelin', 1971, 29, 'Hard Rock, Heavy Metal'),
        ('Michael Jackson', 'Bad', 1987, 19.3, 'Pop, Funk, Rock'),
        ('Eagles', 'Hotel California', 1976, 21.5, 'Rock, Soft Rock'),
        ('Pink Floyd', 'The Wall', 1979, 17.6, 'Progressive Rock');

INSERT  into albums (artist, name, release_date, sales, genre)
Values('Led Zeppelin', 'Led Zeppelin', 1971, 29, 'Hard Rock, Heavy Metal');


select * from albums;