
SELECT *
FROM MentalHealth.Teen_Mental_Health_Dataset

-- What is the average daily social media usage by age group?

-- Which platform is used the most (Instagram, TikTok, Both)?
SELECT platform_usage ,AVG(daily_social_media_hours) AS most_used
FROM MentalHealth.Teen_Mental_Health_Dataset
GROUP BY platform_usage
ORDER BY most_used DESC

-- Do females or males spend more time on social media?
SELECT gender, SUM(daily_social_media_hours)AS more_spend
FROM MentalHealth.Teen_Mental_Health_Dataset
GROUP BY gender
ORDER BY more_spend DESC 

-- What percentage of users spend more than 5 hours daily?
SELECT AVG(daily_social_media_hours) as more_than5_hours
FROM MentalHealth.Teen_Mental_Health_Dataset
WHERE daily_social_media_hours >5