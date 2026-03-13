CREATE TABLE staging_trips (
    vendorid                INTEGER,
    tpep_pickup_datetime    TIMESTAMP,
    tpep_dropoff_datetime   TIMESTAMP,
    passenger_count         INTEGER,
    trip_distance           FLOAT,
    ratecodeid              INTEGER,
    store_and_fwd_flag      TEXT,
    pulocationid            INTEGER,
    dolocationid            INTEGER,
    payment_type            INTEGER,
    fare_amount             FLOAT,
    extra                   FLOAT,
    mta_tax                 FLOAT,
    tip_amount              FLOAT,
    tolls_amount            FLOAT,
    improvement_surcharge   FLOAT,
    total_amount            FLOAT,
    congestion_surcharge    FLOAT, 
    Airport_fee 			FLOAT
);

copy staging_trips from 'C:/Users/moha0/taxi/yellow_tripdata_2024-01.csv' CSV Header;

CREATE TABLE staging_trips_new AS
SELECT
    ROW_NUMBER() OVER (ORDER BY tpep_pickup_datetime) AS trip_id,
    *
FROM staging_trips;

drop table staging_trips;

alter table staging_trips_new rename to staging_trips;
