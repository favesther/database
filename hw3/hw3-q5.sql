/*5. (15 points)
List all cities that cannot be reached from Seattle though a direct flight
but can be reached with one stop (i.e., with any two flights that go through an intermediate city).
Do not include Seattle as one of these destinations (even though you could get back with two flights).
Name the output column city. Order the output ascending by city.
[Output relation cardinality: 256]*/

select distinct f2.dest_city as city
from Flights as f1,
     Flights as f2
where f1.dest_city = f2.origin_city and
      f1.origin_city='Seattle WA' and
      f2.dest_city!='Seattle WA' and
      f2.dest_city not in (select distinct f1.dest_city from Flights as f1 where f1.origin_city='Seattle WA')
order by city asc;

/*
output
256 rows retrieved starting from 1 in 22 s 677 ms (execution: 22 s 630 ms, fetching: 47 ms)
*/