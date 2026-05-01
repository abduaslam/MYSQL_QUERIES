
SELECT *
FROM MentalHealth.Teen_Mental_Health_Dataset

-- What is the average daily social media usage by age group?
SELECT age, AVG(daily_social_media_hours) AS avg_usage
FROM MentalHealth.Teen_Mental_Health_Dataset
GROUP BY age
ORDER BY age DESC ;

-- Which platform is used the most (Instagram, TikTok, Both)?
SELECT platform_usage ,AVG(daily_social_media_hours) AS most_used
FROM MentalHealth.Teen_Mental_Health_Dataset
GROUP BY platform_usage
ORDER BY most_used DESC

-- Do females or males spend more time on social media?
SELECT gender, AVG(daily_social_media_hours) AS avg_usage
FROM MentalHealth.Teen_Mental_Health_Dataset
GROUP BY gender
ORDER BY avg_usage DESC;

-- What percentage of users spend more than 5 hours daily?
SELECT 
  (COUNT(CASE WHEN daily_social_media_hours > 5 THEN 1 END) * 100.0 / COUNT(*)) AS percentage_above_5
FROM MentalHealth.Teen_Mental_Health_Dataset;

-- Does sleep hours decrease with higher social media usage?
SELECT 
-- How does screen time before sleep affect sleep hours?
-- Do teens with low physical activity have higher stress?