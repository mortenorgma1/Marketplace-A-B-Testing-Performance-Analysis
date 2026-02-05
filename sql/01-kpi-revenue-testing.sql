-- Compare overall performance between control (A) and test (B) variants
-- Calculates event volume, completion rate, average wait time, and revenue
-- Used to evaluate high-level impact of the experiment

SELECT
	VARIANT,
	COUNT(*) AS EVENTS,
	CONCAT(ROUND(AVG(RIDE_COMPLETED) * 100, 2), '%') AS COMPLETION_RATE_PRCT,
	ROUND(AVG(WAIT_TIME_MINUTES), 2) AS AVERAGE_WAIT_TIME,
	ROUND(AVG(REVENUE), 2) AS AVERAGE_REVENUE_PER_EVENT
FROM
	EXPERIMENT_EVENTS
GROUP BY

	VARIANT
