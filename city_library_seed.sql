-- . Select all book titles and authors:
SELECT 
    title AS 'Book Title', 
    author AS 'Author'
FROM books;

--  Return distinct genres 
SELECT DISTINCT genre AS 'Genre'
FROM books;

-- Books published after 2000
SELECT title ,year_published
FROM books
WHERE year_published >2000;

-- Books where copies_on_loan is greater than or equal to copies_total
SELECT *
FROM books
WHERE copies_on_loan >= copies_total;

-- Books that are not currently available
SELECT 
     *
FROM 
     books
WHERE available =0 ;

-- Fiction books published before 1990 that are currently available
SELECT *
FROM books
WHERE genre = 'Fiction' 
  AND year_published < 1990 
  AND available = 1;

-- Books in Science genre OR more than 3 copies total
SELECT *
FROM books
WHERE genre = 'Science' 
   OR copies_total > 3;

-- Titles containing 'war' anywhere
SELECT *
FROM books
WHERE title LIKE '%war%';



