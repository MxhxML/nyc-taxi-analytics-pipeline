--  top 10 busiest pickup zones 

with cte as (
select pulocationid, count(*) as total_trips from staging_trips group by pulocationid)
select total_trips, zone from cte
left join dim_location dl on  cte.pulocationid = dl.location_id
order by total_trips desc limit 10;