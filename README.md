# 🎧 Spotify Data Analytics Project

A hands-on SQL project built using a rich dataset from Spotify and YouTube. This project involves **Exploratory Data Analysis (EDA)** and **multi-level data querying** using **advanced SQL techniques**, offering insights into music trends, artist performance, and listener behavior.

---
## Database Schema
![spotify_schema](https://github.com/user-attachments/assets/4f1b6567-8868-43d5-8f0b-28bf4a42d369)


## Dataset Overview

The dataset includes combined attributes from **Spotify** and **YouTube**, such as:

- `artist`, `track`, `album`, `album_type`
- Audio features: `danceability`, `energy`, `loudness`, `acousticness`, etc.
- Engagement metrics: `views`, `likes`, `comments`, `stream`
- `licensed`, `official_video`, and platform-specific flags
---

## Project Structure

### 1. Table Creation & Data Cleaning
- Creates the `spotify` table.
- Removes rows with `duration_min = 0`.
- Checks unique values and distributions for fields like `artist`, `album_type`, `most_played_on`, etc.

### 2. Exploratory Data Analysis (EDA)
- Total number of tracks, unique artists, and albums.
- Maximum and minimum track durations.
- Identify channels and platforms with the most engagement.

### 3. Easy-Level Analysis
- Tracks with over 1 Billion streams.
- Total comments on licensed tracks.
- Tracks that are singles.
- Track counts per artist.

### 4. Medium-Level Analysis
- Average danceability by album.
- Top 5 energetic tracks.
- Total views & likes for official videos.
- Albums ranked by total views.
- Tracks streamed more on Spotify vs YouTube.

### 5. Advanced-Level Analysis
- Top 3 most-viewed tracks per artist using `DENSE_RANK()`.
- Tracks with above-average `liveness`.
- Energy range per album using CTEs.
- Energy-to-liveness ratio filtering.
- Cumulative likes using `SUM() OVER` window function.

---

## Key SQL Concepts Used

- `GROUP BY`, `ORDER BY`, `LIMIT`
- `JOINs`, `WHERE` filtering
- **Aggregate Functions**: `SUM()`, `AVG()`, `MAX()`, `MIN()`
- **Window Functions**: `DENSE_RANK()`, `SUM() OVER`
- **Common Table Expressions (CTEs)**: `WITH` clause

---
