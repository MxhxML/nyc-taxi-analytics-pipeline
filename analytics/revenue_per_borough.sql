-- revenue per borough

with cte as (
select pulocationid, sum(total_amount) as total_amount_zone from staging_trips group by pulocationid)
select sum(total_amount_zone) total_amount_borough, borough from cte
left join dim_location dl on  cte.pulocationid = dl.location_id
group by borough;