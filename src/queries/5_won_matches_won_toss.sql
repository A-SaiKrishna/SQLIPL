USE ipl;
-- 5.Find the number of times each team won the toss and also won the match
SELECT winner, COUNT(winner) AS winner_cum_toss_winner 
FROM `match` 
WHERE winner 
LIKE toss_winner AND result LIKE "normal" 
GROUP BY winner;