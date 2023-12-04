USE ipl;
-- 4.Top 10 economical bowlers in the year 2015
SELECT bowler,ROUND(SUM(total_runs)/
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
WHERE season LIKE "2015" GROUP BY bowler ORDER BY economy LIMIT 10;