USE tmdb ;

SHOW TABLES ;
-- How many movies are there that contain the word “Spider” within their title?
SELECT COUNT(title) AS contian_spider
FROM movies
WHERE title LIKE '%Spider%';


/* Who won the Oscar for “Actor in a Leading Role” in 2015?
(Hint: The winner is indicated as '1.0'.)*/

 SELECT  * FROM oscars;
 
 SELECT  `name`,film ,winner ,award
 FROM oscars
 WHERE year =2015
 AND winner =1.0
 AND award ='Actor in a Leading Role';
 
 
 /*Which award category has the highest number of actor nominations (actors can be male or female)? 
 (Hint Oscars.name contains both actors names and film names)*/
 SELECT award, COUNT(*) AS nominations
FROM oscars
WHERE award LIKE '%Actor%'
   OR award LIKE '%Actress%'
GROUP BY award
ORDER BY nominations DESC
LIMIT 1;

-- How many unique characters has "Vin Diesel" played so far in the database?
SELECT COUNT(cacharacters)
FROM actors
WHERE actor_name LIKE "%Vin Diesel%" ;

-- 6. What are the genres of the movie “The Royal Tenenbaums”?
SELECT gen.genre_name,mov.title
FROM movies AS mov
JOIN genremap AS genm
ON mov.movie_id = genm.movie_id
INNER JOIN genres AS gen 
ON genm.genre_id = gen.genre_id 
WHERE mov.title= 'The Royal Tenenbaums' ;

-- How many movies are there that are both in the "Thriller" genre and contain the word “love” anywhere in the keywords?
SELECT COUNT(DISTINCT m.movie_id) AS total_movies
FROM movies AS m
JOIN genremap AS gm
    ON m.movie_id = gm.movie_id
JOIN genres AS g
    ON gm.genre_id = g.genre_id
JOIN keywordmap AS km
    ON m.movie_id = km.movie_id
JOIN keywords AS k
    ON km.keyword_id = k.keyword_id
WHERE g.genre = 'Thriller'
  AND k.keyword LIKE '%love%';












 
 
 
 
 
 
 
 
 
