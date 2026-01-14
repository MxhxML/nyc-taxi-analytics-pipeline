-- anomalie

select trip_id, fare_amount, trip_distance from staging_trips where fare_amount <= 0 or trip_distance >= 100;
