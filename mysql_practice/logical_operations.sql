SELECT
    title,
    released_year
FROM books
WHERE released_year<1980;

SELECT
    title,
    author_lname
FROM books
WHERE author_lname = 'Eggers' OR
author_lname = 'Chabon';

SELECT 
    title
FROM books
WHERE author_lname='Lahiri'
AND released_year>2000;


SELECT
     *
FROM books
WHERE pages BETWEEN 100 AND 200;

SELECT
*
FROM books
WHERE author_lname LIKE 'S%' OR
author_lname LIKE 'C%';

SELECT
    title,
    author_lname,
    CASE
        WHEN title like '%stories%' THEN 'Short stories'
        WHEN title like '%Just Kids%' OR title like '%A heartbreaking work%' THEN 'Memoir'
        ELSE  'Novel'
    END AS TYPE
from books;

SELECT
    title,
    author_lname,
    CASE
        WHEN count(*)>1 THEN CONCAT(COUNT(*)," books")
        ELSE CONCAT(count(*)," book")
    END AS 'COUNT'
FROM books
GROUP BY author_lname,author_fname;
