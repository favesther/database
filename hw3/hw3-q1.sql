/*
1. (10 points)
Between how many distinct pairs of cities (indepdendent of flight direction) do direct flights operate?
By "direct flight", we mean a flight with no intermediate stops.
By "independent of flight direction", we mean that two cities such as ('Seattle WA', 'Boise ID')
should be counted once even if there are both flights from Seattle to Boise and from Boise to Seattle.
Consider both canceled and non-canceled flights.
Name the output column num_connected_cities.
[Output relation cardinality: 1 row]
*/
select count(*) as num_connected_cities
from (select distinct f1.origin_city, f1.dest_city
from Flights as f1
except select distinct f1.origin_city, f1.dest_city
from Flights as f2, Flights as f1
where (f1.origin_city=f2.dest_city and f1.dest_city=f2.origin_city) or (f2.dest_city=f1.origin_city and f1.carrier_id=f2.carrier_id and f1.flight_num=f2.flight_num)) F;

/*
output
1 row retrieved starting from 1 in 4 m 11 s 802 ms (execution: 4 m 11 s 756 ms, fetching: 46 ms)

num_connected_cities
18
*/