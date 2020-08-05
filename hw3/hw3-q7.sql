/*7.(10 points)
List the names of carriers that operate flights from Seattle to San Francisco CA.
Name the output column carrier.
Return each carrier's name once.
Order the output ascending by carrier.
[Output relation cardinality: 4]*/


select c.name as carrier
from (select distinct f1.carrier_id
      from Flights as f1
      where f1.origin_city = 'Seattle WA' and f1.dest_city = 'San Francisco CA') as f
   , Carriers as c
where f.carrier_id=c.cid;

/*
output
4 rows retrieved starting from 1 in 13 s 255 ms (execution: 13 s 98 ms, fetching: 157 ms)

results
carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America

*/