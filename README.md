# 📊 IPL Database Project 

This project analyzes Indian Premier League (IPL) data using PostgreSQL
on macOS.

It loads three datasets:

-   `matches.csv`
-   `deliveries.csv`
-   `umpire_countries.csv`

And creates three tables:

-   `matches`
-   `deliveries`
-   `umpires`

Then it runs SQL analytical queries to generate insights on:

-   Team performance
-   Player batting & bowling stats
-   Toss impact
-   Umpire nationality trends
-   Venue-based patterns

------------------------------------------------------------------------

## 🚀 Features

-   **Database:** `ipl_db`
-   **Tables:** `matches`, `deliveries`, `umpires`
-   **SQL files:** stored inside `/sql`
-   **CSVs:** stored inside `/data` (ignored via `.gitignore`)
-   Fully compatible with **PostgreSQL installed via Homebrew** on
    macOS.

------------------------------------------------------------------------

## 🧰 Prerequisites

Install PostgreSQL via Homebrew:

``` sh
brew install postgresql
brew services start postgresql
```

Verify installation:

``` sh
psql --version
brew services list
```

------------------------------------------------------------------------

## 🗄️ Database Setup (macOS)

### 1️⃣ Login to PostgreSQL

If PostgreSQL user is `postgres`:

``` sh
psql -U postgres
```

If mac auto-login works:

``` sh
psql
```

### 2️⃣ Create Database

``` sql
CREATE DATABASE ipl_db;
```

### 3️⃣ Create User

``` sql
CREATE USER username WITH PASSWORD 'your_password';
```

### 4️⃣ Grant Permissions

``` sql
GRANT ALL PRIVILEGES ON DATABASE ipl_db TO siddharthachauhan;
```

Exit:

``` sql
\q
```

------------------------------------------------------------------------

## 📂 Running SQL Files

Move to project folder:

``` sh
cd data-project-database
```

### ▶️ Run DB + Tables

``` sh
psql -d ipl_db -f sql/create_db.sql
```

### ▶️ Load CSV Data

``` sh
psql -d ipl_db -f sql/load_deliveries.sql
psql -d ipl_db -f sql/load_matches.sql
psql -d ipl_db -f sql/load_umpires.sql

```

### ▶️ Run All Queries

``` sh
psql -d ipl_db -f sql/queries.sql
```

------------------------------------------------------------------------

## 📁 Project Structure

    data-project-database/
    │
    ├── sql/
    │   ├── create_db.sql
    |   |--cleanup.sql
    │   ├── load_deliveries.sql
    │   ├── load_matches.sql
    |   |__ load_umpires.sql
    |   |__ queries.sql
    │
    ├── data/             (ignored in Git)
    │   ├── matches.csv
    │   ├── deliveries.csv
    │   └── umpire_countries.csv
    │
    ├── README.md
    |__requirements.txt
    └── .gitignore

------------------------------------------------------------------------



------------------------------------------------------------------------


