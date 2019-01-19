WITH
	rainydays
AS (
	SELECT
		date,
		events
	FROM
		weather
	WHERE events LIKE '%Rain%'
	GROUP BY date, events
)

SELECT
	r.date,
	r.events,
	t.duration
FROM
	rainydays r
	
JOIN
	trips t
ON
	r.date = SUBSTRING(t.start_date,1,10)
ORDER BY
	t.duration DESC;
	
-- The longest trips were 85900 on 2016-04-22, 84393 on 2015-11-15 and 83915 on 2016-05-21 -- 

---------------------------------

SELECT
	station_id,
	(CASE WHEN docks_available = 0 THEN 'full' ELSE 'open' END) stationstatus,
	COUNT(*) as status_count
FROM
	status
WHERE 
	docks_available = 0
GROUP BY 
	docks_available,
	station_id
ORDER BY
	status_count DESC;
	
-- Station 4 is full most often. It was full during 5,788 timestamps -- 

-------------------------------

SELECT
	start_station,
	dockcount,
	COUNT(*)
FROM
	trips
JOIN
	stations
ON
	trips.start_station = stations.name
GROUP BY start_station, dockcount
ORDER BY
	stations.dockcount;

----------------------------------
WITH
	rainydays
AS (
	SELECT
		date,
		events
	FROM
		weather
	WHERE events LIKE '%Rain%'
	GROUP BY date, events
),
datelongesttrip
AS (
	SELECT
		r.date,
		r.events,
		t.duration
	FROM
		rainydays r
	
	JOIN
		trips t
	ON
		r.date = SUBSTRING(t.start_date,1,10)
	ORDER BY
		r.date, t.duration DESC)
SELECT
	d.date,
	MAX(d.duration)
FROM
	datelongesttrip d
GROUP BY
	d.date
ORDER BY
	date;