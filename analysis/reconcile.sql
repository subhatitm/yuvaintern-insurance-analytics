-- SQLite: import both source CSVs before running these checks.
-- sqlite3 insurance.db
-- .mode csv
-- .import data/history.csv history
-- .import data/simulated_notices.csv notices
SELECT ROUND(SUM(indemnity_source * 1.0 * unit_usd) /
             SUM(ABS(premium_source) * 1.0 * unit_usd), 6) AS pooled_loss_ratio
FROM history WHERE CAST(crop_year AS INTEGER) BETWEEN 2014 AND 2025;

SELECT COUNT(*) AS notices, COUNT(DISTINCT event_id) AS events
FROM notices;
