USE ipl;


-- 8.Find the highest number of times one player has been dismissed by another player.
 SELECT total.player_dismissed, total.wicket_taker,maxi_times.max_dismissed 
 FROM 
 (SELECT player_dismissed,CASE 
							WHEN dismissal_kind LIKE "runout"
                            THEN fielder
                            ELSE bowler
                            END AS wicket_taker,
                            COUNT(CASE 
									WHEN dismissal_kind LIKE "runout"
                                    THEN fielder
                                    ELSE bowler
                                    END ) AS times
FROM delivery
WHERE player_dismissed NOT  LIKE "" AND dismissal_kind NOT LIKE "retired hut"
GROUP BY player_dismissed,wicket_taker) AS total
 RIGHT JOIN 
(SELECT player_dismissed , MAX(num_of_times) AS max_dismissed
FROM(
SELECT player_dismissed, CASE
                            WHEN dismissal_kind LIKE "runout"
                            THEN fielder
                            ELSE bowler
                            END AS wicket_taker,COUNT(CASE
                            WHEN dismissal_kind LIKE "runout"
                            THEN fielder
                            ELSE bowler
                            END) AS num_of_times
FROM delivery
WHERE dismissal_kind NOT LIKE "retired hurt" AND player_dismissed NOT LIKE ""
GROUP BY player_dismissed,wicket_taker) AS dissimisal_info
GROUP BY player_dismissed) AS maxi_times
ON total.player_dismissed = maxi_times.player_dismissed AND total.times = maxi_times.max_dismissed;