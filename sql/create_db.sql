-- Create a new user
CREATE USER ipl_user WITH PASSWORD 'iplpassword';

-- Create a database owned by this user
CREATE DATABASE ipl_db OWNER ipl_user;

-- Grant permissions
GRANT ALL PRIVILEGES ON DATABASE ipl_db TO ipl_user;
