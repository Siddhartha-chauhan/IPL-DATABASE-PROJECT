-- load_umpires.sql

DROP TABLE IF EXISTS umpires;

CREATE TABLE umpires (
    umpire   TEXT,
    country  TEXT
);

COPY umpires
FROM 'data/umpires.csv'
WITH (FORMAT csv, HEADER true);
