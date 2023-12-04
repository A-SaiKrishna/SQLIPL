USE ipl;


-- 7.Find the strike rate of a batsman for each season
SELECT season,batsman,ROUND(SUM(batsman_runs) * 100 /
	SUM(CASE
          WHEN noball_runs =0 AND wide_runs =0
          THEN 1
		  ELSE 0 END),2) AS strike_rate
FROM `match` 
JOIN delivery 
ON `match`.id = delivery.match_id
GROUP BY season,batsman;