CREATE TABLE books(
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY(book_id)
);

INSERT INTO books(title,author_fname,author_lname,released_year,stock_quantity,pages)
VALUES 
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT CONCAT(author_fname,author_lname) FROM books;
SELECT 
    CONCAT(author_fname," ",author_lname) AS full_name 
FROM books;


SELECT 
    author_fname as first, author_lname as last,
    CONCAT(author_fname," ",author_lname) as full,
FROM books;

SELECT 
    CONCAT_WS(' - ',title,author_fname,author_lname)
FROM books;

SELECT
    SUBSTRING(title,1,10)
FROM books;

SELECT
    CONCAT(SUBSTRING(title,1,10),'...')
FROM books;

-- SELECT
--    CONCAT(SUBSTRING(title,1,10),'...') AS "short title"
-- FROM books;

-- SELECT
--    REPLACE(title,'e','3') AS "modified"
-- FROM books;

SELECT
    CONCAT(SUBSTRING(REPLACE(title,'e','3'),1,10),'....') AS 'new title'
FROM books;


SELECT REVERSE("HELLO WORLD");
-- CREATING PALINDROME IN SQL

SELECT
    CONCAT("woof",REVERSE("woof")) as Palindrome;
    
SELECT
    CONCAT(author_fname,REVERSE(author_fname)) as Palindrome
FROM books;

SELECT
    author_lname, CHAR_LENGTH(author_lname) AS siz
FROM books;

SELECT
    CONCAT(author_fname," is ",CHAR_LENGTH(author_fname)," characters long") AS INFO
FROM books;

SELECT 
    UPPER('hello world');
    
SELECT 
    LOWER('HELLO WORLD');
    
SELECT
    UPPER(CONCAT("my favourite book is ",title)) AS Favorite
FROM books;


SELECT
    UPPER(REVERSE("why does my cat look at Me with such hatred?")) AS reverse_str;

SELECT
    REPLACE(title," ",'->') AS title
FROM books;


SELECT
    author_lname AS forwards,
    REVERSE(author_lname) AS backwards
FROM books;

SELECT 
    UPPER(CONCAT(author_fname," ",author_lname)) AS "full name in caps"
FROM books;

SELECT
    CONCAT(title," was released in ",released_year) as blurb
FROM BOOKS;

SELECT
    title,
    CHAR_LENGTH(title) AS "character count"
FROM books;

SELECT
    CONCAT(SUBSTRING(title,1,10),". . .") AS "short title",
    CONCAT(author_lname,",",author_fname) AS "author",
    CONCAT(stock_quantity," in stock") AS quantity
FROM books
WHERE
    book_id=3 OR book_id = 9;

