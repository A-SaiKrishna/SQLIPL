USE ipl;
-- Number of matches played per year for all the years in IPL.
 SELECT season,count(id) AS number_of_matches 
 FROM `match` 
 GROUP BY season 
 ORDER BY season;
