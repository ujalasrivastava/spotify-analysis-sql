-- Advanced SQL Project--Spotify Datasets

DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);


--EDA
select count(*) from  spotify;

select count(distinct artist) from  spotify;

select count(distinct album) from  spotify;

select distinct album_type from  spotify;

select max(duration_min) from spotify;

select min(duration_min) from spotify;

SELECT * FROM spotify
WHERE duration_min = 0


DELETE FROM spotify
WHERE duration_min = 0;

SELECT DISTINCT channel FROM spotify;

SELECT DISTINCT most_played_on FROM spotify;

/*
-- ----------------------------------
-- Data Analysis- Easy Category
-- ----------------------------------
*/

-- Retrieve the names of all tracks that have more than 1 billion streams.
SELECT * FROM spotify
WHERE stream > 1000000000;

-- List all albums along with their respective artists.
SELECT
DISTINCT album, artist
FROM spotify
ORDER BY 1;

SELECT
DISTINCT album
FROM spotify
ORDER BY 1;

-- Get the total number of comments for tracks where licensed = TRUE
SELECT 
SUM (comments) AS total_comments
FROM spotify
WHERE licensed = 'true'

-- Find all tracks that belong to the album type single.
select track from spotify
where album_type = 'single';

-- Count the total number of tracks by each artist
select artist,
count(track)as total_songs
from spotify
group by artist;

-- ----------------------------------
-- Data Analysis- Medium Category
-- ----------------------------------

--Calculate the average danceability of tracks in each album.
SELECT album,AVG(danceability) AS average_danceability
FROM spotify
GROUP BY 1;

--Find the top 5 tracks with the highest energy values.
SELECT track, 
MAX(energy)
FROM spotify
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

--List all tracks along with their views and likes where official_video = TRUE
SELECT track, 
sum(views) as total_views,
sum(likes) as total_likes
FROM spotify
where official_video = 'true'
group by track;

--For each album, calculate the total views of all associated tracks.
SELECT album, track,
sum(views)
FROM spotify
group by 1,2
ORDER BY 3 desc;

--Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT track
from spotify
where most_played_on = 'Spotify';


-- ----------------------------------
-- Data Analysis- Advance Category
-- ----------------------------------

--Find the top 3 most-viewed tracks for each artist using window functions.
WITH ranking_artist
AS
(SELECT
artist,
track,
sum(views) as total_view,
dense_rank() over(partition by artist order by sum(views)DESC) as rank
FROM spotify
GROUP by 1,2
order by 1,3 desc
)
SELECT * from ranking_artist
WHERE rank<=3;

--Write a query to find tracks where the liveness score is above the average.
SELECT track,
artist,
liveness
from spotify
WHERE liveness > (select avg(liveness) from spotify);


--Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
WITH energy_level
AS
(select album,
max(energy)as highest_energy,
min(energy)as lowest_energy
from spotify
group by 1
)
SELECT
album,
highest_energy - lowest_energy as energy_difference
FROM energy_level
order by 2 desc;

--Find tracks where the energy-to-liveness ratio is greater than 1.2.
SELECT track, (energy/liveness) as ratio
FROM spotify
where (energy/liveness) > 1.2
order by 2;


--Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
SELECT track, views, likes,
sum(likes) OVER(order by views desc) as cumulative_likes
from spotify;