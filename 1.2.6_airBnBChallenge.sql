SELECT
	*
FROM
	sfo_listings l
JOIN
	sfo_reviews r
ON
	l.id = r.listing_id
ORDER BY l.price DESC;

-- The most expensive listing is priced at $10,000 a night for a minimum of 2 nights stay. 
-- It's a Full House Victorian with 7500 sq ft, 4 floors and a hot tub.
-- The rental includes the entire home and is available 18 days out of the year.
-- It's in the Western Addition neighbourhood.
-- The listing has 3 reviews, all with positive comments.

----------------------------------------------------

SELECT
	l.neighbourhood,
	COUNT(r.listing_id) as list_id_count
FROM
	sfo_listings l
JOIN
	sfo_reviews r
ON
	l.id = r.listing_id
GROUP BY 
	l.neighbourhood
ORDER BY list_id_count DESC;

-- The neighbourhoods of Mission (32,362 reviews) Western Addition (21,294) and Castro/Upper Market (19,324) seem to be the
-- most popular neighbourhoods by how many reviews each neighbourhood has received.

----------------------------------------------------

WITH
	trimmed_prices
AS (
	SELECT
		listing_id,
		EXTRACT(month from calender_date) as months_,
		available,
		REPLACE(REPLACE(price, '$',''), ',','') as price_
	FROM
		sfo_calendar
)
SELECT
	months_,
	AVG(cast(price_ AS float)) AS avg_price
FROM
	trimmed_prices
GROUP BY
	months_
ORDER BY
	avg_price ASC;

---------------------------------------
			 
SELECT
	EXTRACT(month from calender_date) as month_,
	COUNT(available) as count_
FROM
	sfo_calendar
WHERE available = 'f'
GROUP BY
	month_
ORDER BY count_ DESC;

--- The busiest time of year is September -- 