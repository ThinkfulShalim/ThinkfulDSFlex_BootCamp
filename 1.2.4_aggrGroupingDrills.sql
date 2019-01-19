
SELECT
	end_station,
	AVG(duration)
FROM
	trips
GROUP BY end_station;

--------------------------------------------------

SELECT
	zip,
	maxtemperaturef
FROM
	weather
ORDER BY maxtemperaturef DESC;

-- max temperature was 134 degrees F in the zip code 94063 (Redwood City, CA) -- 

--------------------------------------------------

SELECT
	*
FROM
	trips
ORDER BY duration ASC;

-- The shortest duration was 60 by a number of trips. --

--------------------------------------------------

SELECT
	start_station,
	COUNT(*)
FROM
	trips
GROUP BY start_station;

--------------------------------------------------