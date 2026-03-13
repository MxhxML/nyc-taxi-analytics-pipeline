create or replace table dim_location(
location_id int primary key,
borough varchar,
zone varchar,
service_zone varchar
);

insert into dim_location(
SELECT * FROM read_csv('C:/Users/moha0/taxi/taxi_zone_lookup.csv')
);