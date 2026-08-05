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

-- 7. How many movies are there that are both in the "Thriller" genre and contain the word “love” anywhere in the keywords?
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

-- 8.How many unique awards are there in the Oscars table?
SELECT COUNT(DISTINCT award) AS  quique_awards
FROM oscars ;

-- 9.Which genre has, on average, the lowest movie popularity score?
SELECT gen.genre_name,avg(mov.popularity)as lowest_score
FROM genres AS gen
JOIN genremap AS genm
ON gen.genre_id = genm.genre_id
JOIN movies AS mov
ON mov.movie_id = genm.movie_id
GROUP BY gen.genre_name 
ORDER BY lowest_score;

-- 10.How many female actors (i.e. gender = 1) have a name that starts with the letter "N"?

SELECT COUNT(gender) AS name_startN
FROM  actors
WHERE gender =1
AND actor_name LIKE "%N" ;

/* 11.How many movies are there that were released between 1 August 2006 ('2006-08-01') and 1 October 2009 ('2009-10-01') 
that have a popularity score of more than 40 and a budget of less than 50 000 000?*/
select * from movies ;
SELECT COUNT(movie_id) AS movies_number
FROM movies 
WHERE release_date BETWEEN '2006-08-01' AND '2009-10-01' 
AND popularity >40
AND budget <50000000;

-- 12.What are the three production companies that have the highest movie popularity score on average, as recorded within the database?
SELECT pc.production_company_name,
       AVG(m.popularity) AS avg_popularity
FROM movies AS m
JOIN productioncompanymap AS pcm
    ON m.movie_id = pcm.movie_id
JOIN productioncompanies AS pc
    ON pcm.production_company_id = pc.production_company_id
GROUP BY pc.production_company_name
ORDER BY avg_popularity DESC
LIMIT 3;


















 
 
 
 
 
 
 
 
 
