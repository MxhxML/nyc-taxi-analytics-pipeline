-- Rolling avg 7 days 
with cte as (
select date(tpep_pickup_datetime) as date , avg(fare_amount) as fare_amount from staging_trips group by date(tpep_pickup_datetime))
select date, avg(fare_amount) over (order by date range between 7 preceding and current row) from cte;
