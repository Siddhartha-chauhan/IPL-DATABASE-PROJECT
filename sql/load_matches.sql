-- load_matches.sql
DROP TABLE IF EXISTS matches;

CREATE TABLE matches (
    id                INTEGER PRIMARY KEY,
    season            INTEGER,
    city              TEXT,
    date              DATE,
    team1             TEXT,
    team2             TEXT,
    toss_winner       TEXT,
    toss_decision     TEXT,
    result            TEXT,
    dl_applied        INTEGER,
    winner            TEXT,
    win_by_runs       INTEGER,
    win_by_wickets    INTEGER,
    player_of_match   TEXT,
    venue             TEXT,
    umpire1           TEXT,
    umpire2           TEXT,
    umpire3           TEXT
);
\COPY matches
FROM 'data/matches.csv'
WITH (FORMAT csv, HEADER true);
