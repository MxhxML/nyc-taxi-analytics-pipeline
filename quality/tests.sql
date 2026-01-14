with cleaned_data as(
select * from staging_trips where fare_amount >= 0 and trip_distance >= 0 and tpep_pickup_datetime < tpep_dropoff_datetime and passenger_count <= 6
)
select * from staging_trips st
where not exists (select 1 from cleaned_data cd WHERE cd.trip_id = st.trip_id);