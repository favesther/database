/*
Q1: Define a city's influx as its number of incoming flights minus its number of outgoing flights.
Find the cities with the least influx among all cities that have an (incoming or outgoing) flight.
Find the cities with the greatest influx among all cities that have an (incoming or outgoing) flight.
Write your answer in a CSV file that includes the city name and the influx of these cities.
*/
with incoming as(select count(*) as num, F1.dest_city as city from Flights F1 group by F1.dest_city),
     outgoing as (select count(*) as num,F2.origin_city as city
from Flights F2 group by F2.origin_city)
SELECT O.city, ISNULL(I.num, 0) - ISNULL(O.num, 0) as influx
FROM incoming I FULL OUTER JOIN outgoing O
ON O.city = I.city
order by influx desc;

-- note the isnull(xx,0) here, it replace null with 0.
-- use full outer join here


/*
Q2:Define the out-degree of a city as the number of flights departing from that city.
Define the out-degree distribution as a function f(d)
where d is an out-degree (minimum 1)
and f(d) is the number of cities that have out-degree d.
Binning is the process of grouping together values, often to reduce the number of data points in preparation for plotting a histogram.
Plot a histogram of the out-degree distribution of cities, binned into buckets of size 100.
Let the x-axis plot the bins, labeled with their minimum
(i.e., the bin at 0 corresponds to out-degrees between 0 and 99; the bin at 100 corresponds to out-degrees between 100 and 199; etc.).
Let the y-axis plot the number of cities that have an out-degree that fall within a given bucket.
Write the data used to plot your histogram in a CSV file that includes the out-degree bucket minimum and the number of cities that have an out-degree that falls within that bucket.
In addition, use your favorite plotting software to plot the histogram. Save an image of your histogram in a PDF or PNG file.
*/

with outdegree as(select F.origin_city as city, count(*) as num from Flights F group by F.origin_city)
select (o.num/100)*100 as d, count(*) as func_d
from outdegree as o
where o.num>=1
group by (o.num/100)*100;



/*Q5:An environmentalist wishes to minimize the number of miles they fly.
Find a path of flights from 'Seattle WA' to 'Twin Falls ID' that has the shortest number of miles flown across all flights in the path.
Write the path and minimum miles flown in a text file.*/

with depart as(select f.origin_city, f.dest_city, f.distance from Flights f where f.origin_city='Seattle WA'),
arrival as(select d.origin_city c1,f2.origin_city c2, f2.dest_city c3,(d.distance+f2.distance) as miles from Flights f2, depart d where d.dest_city=f2.origin_city and f2.dest_city='Twin Falls ID')
select TOP(1) c1 start,c2 trans,c3 destination,miles
from arrival
order by miles;

-- In Azure, should use top(n) other than limit n.


/*Q6: A historian is interested in studying the gender disparity among Nobel Prize categories. Use the data hosted by the Nobel Prize committee at https://nobelprize.readme.io/ to answer this question.
The data is available as JSON and CSV. Decide which of the three datasets (Prize, Laureate, and Country) will help you find an answer. The "Try It Out" tool at the bottom of each page is an easy way to explore and retrieve the data, but you can also query the REST API.
For each nobel prize category, compute the percentage of female laureates out of all human laureates (you can ignore prizes awarded to organizations).
Round your percentage (between 0 and 100) to the nearest whole number.
Write your results in a JSON or CSV file. Include the nobel prize category name and the rounded percentage of female laureates in that category.*/


with total as (select category, count(*) as num from nobel_prize where gender!= 'org' group by category),
     female as (select category, count(*) as num from nobel_prize where gender='female' group by category)
select t.category nobel_prize_category, cast(cast(round((f.num/(t.num*1.0))*100,0) as int) as varchar) + '%' female_percentage
from total t, female f
where t.category=f.category;

-- The round and cast is complicated here.


