USE ipl;
-- 3.Extra runs conceded per team in the year 2016
SELECT batting_team, SUM(extra_runs) 
FROM `match` 
RIGHT JOIN delivery 
ON `match`.id = delivery.match_id 
WHERE season LIKE "2016" 
GROUP BY batting_team;