SELECT
    title,author_lname
FROM  books
GROUP BY author_lname;

SELECT
    author_lname,
    count(*) AS books_by_author
FROM  books
GROUP BY author_lname;

SELECT
    author_fname,
    author_lname,
    count(*) AS books_by_author
FROM  books
GROUP BY author_lname,author_fname;

SELECT 
    released_year,
    count(*) AS books
FROM books
GROUP BY released_year
ORDER BY released_year DESC;

SELECT 
    CONCAT("In ",released_year,", ",count(*)," was released") AS released
FROM books
GROUP BY released_year
ORDER BY released_year DESC;
    
SELECT 
    MIN(released_year)
FROM books;


SELECT 
    title
FROM  books
WHERE pages = MAX(PAGES);
-- THIS IS WRONG

-- THIS IS THE RIGHT WAY BY USING SUB QUERY 
SELECT 
    title
FROM books
WHERE pages = (
                SELECT 
                    MAX(pages)
                FROM books
                );
    
    
SELECT
    * 
FROM books
ORDER BY pages DESC LIMIT 1;

SELECT
    author_fname,
    author_lname,
    MIN(released_year) AS year_a
FROM books
GROUP BY author_lname,author_fname;
    
    
SELECT
    title,
    author_fname,
    author_lname,
    MAX(pages) AS longest_book
FROM books
GROUP BY author_lname,author_fname;
    
    
SELECT sum(pages) FROM books; 

SELECT
    CONCAT(author_fname," ", author_lname) AS author,
    SUM(pages) AS total_pages
FROM books
GROUP BY author_lname,author_fname;
    
SELECT AVG(released_year) FROM books;

SELECT 
    released_year,
    AVG(stock_quantity)
FROM books
GROUP BY released_year;
    
 SELECT
     COUNT(*) as books
from books;
    
SELECT
    released_year,
    COUNT(*) AS books
FROM books
GROUP BY released_year;
    
SELECT
    SUM(stock_quantity)
FROM books;

SELECT
    author_fname,
    author_lname,
    AVG(released_year)
FROM books
GROUP BY author_lname,author_fname;

 SELECT 
     CONCAT(author_fname," ",author_lname) AS full_name
FROM books
WHERE pages=(SELECT 
                MAX(pages)
            FROM books);
            
SELECT
    released_year as "year",
    COUNT(*) AS "#books",
    AVG(pages) AS "avg pages"
FROM books
GROUP by released_year;   
    
