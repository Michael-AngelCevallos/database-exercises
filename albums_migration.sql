USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        artist VARCHAR(50) DEFAULT 'Undefined',
                        name VARCHAR(100) NOT NULL,
                        release_date INT(4) NOT NULL,
                        sales FLOAT NOT NULL,
                        genre VARCHAR(200) DEFAULT 'Undefined',
                        PRIMARY KEY (id)
);