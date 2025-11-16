-- cleanup.sql
-- Run this script as a superuser (like 'postgres')

-- 1. Terminate active connections to the DB (required before DROP DATABASE)
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'ipl_db';

-- 2. Drop the database
DROP DATABASE IF EXISTS ipl_db;

-- 3. Drop the user
DROP USER IF EXISTS ipl_user;
