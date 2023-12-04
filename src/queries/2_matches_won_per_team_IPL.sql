USE ipl;
-- 2.Number of matches won per team per year in IPL
SELECT season, winner, COUNT(winner) AS no_of_times
FROM `match`  
WHERE result 
LIKE "normal" 
GROUP BY season,winner 
ORDER BY season;