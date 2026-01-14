CREATE TABLE fact_trips_cleaned AS
WITH cleaned AS (
    SELECT
        trip_id,
        tpep_pickup_datetime,
        tpep_dropoff_datetime,
        passenger_count,
        trip_distance,
        fare_amount,
        total_amount,
        pulocationid,
        dolocationid,
        payment_type,
        ratecodeid,
        store_and_fwd_flag
    FROM staging_trips
    WHERE
        trip_distance >= 0
        AND fare_amount >= 0
        AND tpep_pickup_datetime < tpep_dropoff_datetime
        AND passenger_count <= 6
)
SELECT *
FROM cleaned;
