USE ipl;

-- 6.Find a player who has won the highest number of Player of the Match awards for each season
SELECT all_poms.season, all_poms.player_of_match, highest_poms_count.highest
FROM (
    SELECT season, player_of_match, COUNT(player_of_match) AS no_of_times
    FROM `match`
    GROUP BY season, player_of_match
) AS all_poms
RIGHT JOIN (
    SELECT season, MAX(pom) AS highest
    FROM (
        SELECT season, player_of_match, COUNT(player_of_match) AS pom
        FROM `match`
        GROUP BY season, player_of_match
    ) AS subquery
    GROUP BY season
) AS highest_poms_count
ON all_poms.season = highest_poms_count.season AND all_poms.no_of_times = highest_poms_count.highest;
