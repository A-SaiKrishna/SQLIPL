USE ipl;
-- 9.Find the bowler with the best economy in super overs
SELECT bowler ,ROUND(SUM(total_runs)/
 (SUM(CASE 
		WHEN noball_runs = 0 AND wide_runs = 0 
        THEN 1 
        ELSE 0 
	END)/6+(SUM(CASE 
		WHEN noball_runs = 0 AND wide_runs = 0 
        THEN 1 
        ELSE 0 
	END)%6)),2) AS economy
FROM `match` 
 JOIN delivery 
		ON `match`.id = delivery.match_id 
WHERE is_super_over = 1
GROUP BY bowler
ORDER BY economy LIMIT 1;