/*
8. (5 points)
For each day of the week, find cities with the top two highest average number of arriving flights on that day of week.
Report the day of week, city, and the average number of arriving flights into that city on that day of the week.
Warning: the days of the week occur a different number of times in the Flights dataset.
For example, Sunday occurs on 4 days while Friday occurs on 5 days.
Name the output columns day_of_week, dest_city, avg_flights.
Report day of week names (e.g. Sunday) rather than day of week numbers (e.g. 7).
Order the days of the week from Monday to Sunday in order (e.g. Monday, Tuesday, Wednesday, ...), then by avg_flights descending.
[Output relation cardinality: 14]
*/

with frequency as (
    select day_of_week_id, count(distinct day_of_month) as freq
    from Flights
    group by day_of_week_id
    )
, city as (
    select dest_city,day_of_week_id, count(*) as num
    from Flights
    group by day_of_week_id,dest_city
)
, rank as(
    select cast (c.num as float) / f.freq as avg_num, c.day_of_week_id,c.dest_city
    from city as c, frequency as f
    where f.day_of_week_id=c.day_of_week_id
)
, toprows as(
    select r.day_of_week_id, r.dest_city, r.avg_num as avg_flights,
       row_number() over (partition by r.day_of_week_id order by r.avg_num desc ) as row_num
    from rank as r
)
select w.day_of_week, t.dest_city, t.avg_flights
from Weekdays as w, toprows as t
where w.did=t.day_of_week_id and t.row_num<=2
order by w.day_of_week asc, t.avg_flights desc;

/*
output
14 rows retrieved starting from 1 in 7 s 551 ms (execution: 7 s 439 ms, fetching: 112 ms)

results
day_of_week, dest_city, avg_flights
Friday,Chicago IL,2447
Friday,Atlanta GA,2350.6
Monday,Chicago IL,2171.75
Monday,Atlanta GA,2132.75
Saturday,Chicago IL,2308.8
Saturday,Atlanta GA,2286
Sunday,Chicago IL,2320
Sunday,Atlanta GA,2276.6
Thursday,Chicago IL,2452.5
Thursday,Atlanta GA,2348.25
Tuesday,Chicago IL,2400.75
Tuesday,Atlanta GA,2334.5
Wednesday,Chicago IL,2450
Wednesday,Atlanta GA,2372.75

*/