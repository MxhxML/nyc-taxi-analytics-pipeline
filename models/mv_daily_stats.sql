CREATE MATERIALIZED VIEW mv_daily_stats AS
WITH daily AS (
    SELECT
        date(tpep_pickup_datetime) AS trip_date,
        COUNT(*) AS total_trips,
        SUM(total_amount) AS total_revenue,
        AVG(fare_amount) AS avg_fare,
        AVG(trip_distance) AS avg_distance
    FROM staging_trips
    GROUP BY date(tpep_pickup_datetime)
)
SELECT
    trip_date,
    total_trips,
    total_revenue,
    avg_fare,
    avg_distance,
    AVG(avg_fare) OVER (
        ORDER BY trip_date
        RANGE BETWEEN INTERVAL '7' DAY PRECEDING AND CURRENT ROW
    ) AS rolling_avg_7_days
FROM daily
ORDER BY trip_date;
