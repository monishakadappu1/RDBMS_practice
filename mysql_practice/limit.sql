SELECT 
    title
FROM books
LIMIT 2;

-- most recently released 5 books with title and released year

SELECT
    title,
    released_year
FROM books
ORDER BY released_year DESC
LIMIT 5;

-- from second recent book to...ALTER
SELECT
    title,
    released_year
FROM books
ORDER BY released_year DESC
LIMIT 2,7;   -- starting to ending

SELECT 
    title,
    author_fname
FROM books
WHERE 
    author_fname LIKE '%da%';

SELECT 
    title
FROM books
WHERE 
    title LIKE "%the%";

SELECT   
    title,
    stock_quantity
FROM books
WHERE stock_quantity LIKE '____';

SELECT 
    title
FROM books
WHERE title LIKE '%\%%';
