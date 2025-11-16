-- 1. Total runs scored by each team
SELECT
    batting_team AS team,
    SUM(total_runs) AS total_runs
FROM deliveries
GROUP BY batting_team
ORDER BY total_runs DESC;

    batting_team         | total_runs 
-----------------------------+------------
 Mumbai Indians              |      24521
 Royal Challengers Bangalore |      23436
 Kings XI Punjab             |      23068
 Kolkata Knight Riders       |      21965
 Delhi Daredevils            |      21953
 Chennai Super Kings         |      20899
 Rajasthan Royals            |      17703
 Sunrisers Hyderabad         |      11652
 Deccan Chargers             |      11463
 Pune Warriors               |       6358
 Gujarat Lions               |       4862
 Rising Pune Supergiant      |       2470
 Rising Pune Supergiants     |       2063
 Kochi Tuskers Kerala        |       1901
(14 rows)



-- 2. Top 10 batsmen for Royal Challengers Bangalore
SELECT
    batsman,
    SUM(batsman_runs) AS total_runs
FROM deliveries
WHERE batting_team = 'Royal Challengers Bangalore'
GROUP BY batsman
ORDER BY total_runs DESC
LIMIT 10;


-- 3. Foreign umpires (ignore India)
SELECT
    country,
    COUNT(*) AS umpire_count
FROM umpires
WHERE country <> 'India'
GROUP BY country
ORDER BY umpire_count DESC;

-- 4. Matches played by team by season
SELECT
    season,
    team,
    COUNT(*) AS matches_played
FROM (
    SELECT season, team1 AS team FROM matches
    UNION ALL
    SELECT season, team2 FROM matches
) AS all_teams
GROUP BY season, team
ORDER BY season, matches_played DESC;

-- 5. Matches played per year
SELECT
    season,
    COUNT(*) AS matches
FROM matches
GROUP BY season
ORDER BY season;

 season | matches_played 
--------+----------------
   2008 |             58
   2009 |             57
   2010 |             60
   2011 |             73
   2012 |             74
   2013 |             76
   2014 |             60
   2015 |             59
   2016 |             60
   2017 |             59
(10 rows)


-- 6. Matches won per team per year
SELECT
    season,
    winner AS team,
    COUNT(*) AS wins
FROM matches
WHERE winner IS NOT NULL AND winner <> ''
GROUP BY season, winner
ORDER BY season, wins DESC;



-- 7. Extra runs conceded per team in 2016
SELECT
    d.bowling_team,
    SUM(d.extra_runs) AS total_extras
FROM deliveries d
JOIN matches m
    ON d.match_id = m.id
WHERE m.season = 2016
GROUP BY d.bowling_team
ORDER BY total_extras DESC;


bowling_team         | extra_runs_conceded 
-----------------------------+---------------------
 Royal Challengers Bangalore |                 156
 Kolkata Knight Riders       |                 122
 Rising Pune Supergiants     |                 108
 Sunrisers Hyderabad         |                 107
 Delhi Daredevils            |                 106
 Mumbai Indians              |                 102
 Kings XI Punjab             |                 100
 Gujarat Lions               |                  98
(8 rows)



-- 8. Top 10 economical bowlers in 2015
WITH balls AS (
    SELECT
        d.bowler,
        SUM(d.total_runs) AS runs_conceded,
        COUNT(*) AS balls_bowled
    FROM deliveries d
    JOIN matches m ON d.match_id = m.id
    WHERE m.season = 2015
    GROUP BY d.bowler
)
SELECT
    bowler,
    (runs_conceded::DECIMAL / balls_bowled) * 6 AS economy
FROM balls
WHERE balls_bowled > 0
ORDER BY economy
LIMIT 10;

bowler     | economy_rate 
----------------+--------------
 R Ashwin       |         5.73
 Z Khan         |         6.15
 MC Henriques   |         6.27
 MA Starc       |         6.75
 Sandeep Sharma |         6.93
 GB Hogg        |         6.99
 A Nehra        |         7.06
 JP Duminy      |         7.18
 SL Malinga     |         7.19
 S Aravind      |         7.20
(10 rows)

