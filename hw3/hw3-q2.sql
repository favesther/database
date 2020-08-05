/*
2. (10 points)
For each origin city, find the destination city (or cities) with the shortest direct flight for non-canceled flights.
By direct flight, we mean a flight with no intermediate stops.
Judge the shortest flight in time, not distance.
Name the output columns origin_city, dest_city, and time representing the the flight time between them.
Do not include duplicates of the same origin/destination city pair.
Order the result by time ascending and then origin_city ascending (i.e. alphabetically).
[Output relation cardinality: 339 rows]
*/

/*cities that are not direct*/
select distinct f1.origin_city
from Flights f1, Flights f2
where f2.dest_city=f1.origin_city and f1.carrier_id=f2.carrier_id and f1.flight_num=f2.flight_num
/*
run time: 1m40s 849ms*/
with MinTime as (
    select origin_city, min(actual_time) as shortest
    from Flights
    where actual_time>0 /*all non-cancelled flights show actual time equals zero*/
    group by origin_city
)
select distinct F.origin_city, F.dest_city, F.actual_time as time
from MinTime as MT, Flights as F
where MT.origin_city=F.origin_city and
      F.actual_time=MT.shortest
order by time, F.origin_city asc;

/*
output
339 rows retrieved starting from 1 in 9 s 120 ms (execution: 9 s 58 ms, fetching: 62 ms)

Results:
origin_city, dest_city, time
Bend/Redmond OR,Los Angeles CA,10
Burbank CA,New York NY,10
Las Vegas NV,Chicago IL,10
New York NY,Nashville TN,10
Newark NJ,Detroit MI,10
Sacramento CA,Atlanta GA,10
Washington DC,Minneapolis MN,10
Boise ID,Chicago IL,11
Boston MA,Philadelphia PA,11
Buffalo NY,Orlando FL,11
Cincinnati OH,New Haven CT,11
Denver CO,Honolulu HI,11
Denver CO,Orlando FL,11
Denver CO,Philadelphia PA,11
Fort Myers FL,Chicago IL,11
Houston TX,Salt Lake City UT,11
Minneapolis MN,Newark NJ,11
Pittsburgh PA,Dallas/Fort Worth TX,11
Indianapolis IN,Houston TX,12
Phoenix AZ,Dallas/Fort Worth TX,12
Rochester NY,Orlando FL,12
San Jose CA,Atlanta GA,12
Albany NY,Orlando FL,13
Atlanta GA,Detroit MI,13
Fort Lauderdale FL,Atlanta GA,13
Los Angeles CA,Albuquerque NM,13
Nashville TN,Newark NJ,13
Nashville TN,Washington DC,13
Orlando FL,Denver CO,13
Baltimore MD,Nashville TN,14
Des Moines IA,Houston TX,14
Wrangell AK,Petersburg AK,14
Anchorage AK,Kotzebue AK,15
Raleigh/Durham NC,Houston TX,15
Seattle WA,New Orleans LA,15
Seattle WA,Newark NJ,15
Chicago IL,Dallas/Fort Worth TX,16
Chicago IL,Seattle WA,16
Hattiesburg/Laurel MS,Meridian MS,16
Lubbock TX,Houston TX,16
Nantucket MA,Newark NJ,16
Petersburg AK,Wrangell AK,16
San Francisco CA,Newark NJ,16
Arcata/Eureka CA,Crescent City CA,17
Dallas/Fort Worth TX,Atlanta GA,17
Dallas/Fort Worth TX,Washington DC,17
Fresno CA,Visalia CA,17
Meridian MS,Hattiesburg/Laurel MS,17
Miami FL,Charlotte NC,17
Philadelphia PA,Phoenix AZ,17
Visalia CA,Fresno CA,17
Crescent City CA,Arcata/Eureka CA,18
Detroit MI,Las Vegas NV,18
Providence RI,Atlanta GA,18
Charlotte Amalie VI,Atlanta GA,19
Chattanooga TN,Atlanta GA,19
Columbus OH,New York NY,19
Gustavus AK,Juneau AK,19
Ontario CA,Los Angeles CA,19
Salt Lake City UT,Houston TX,19
Santa Ana CA,Los Angeles CA,19
Tampa FL,Denver CO,19
Amarillo TX,Dallas/Fort Worth TX,20
Grand Rapids MI,Atlanta GA,20
Mobile AL,Dallas/Fort Worth TX,20
Richmond VA,Atlanta GA,20
Syracuse NY,Atlanta GA,20
Flint MI,Atlanta GA,21
Newport News/Williamsburg VA,Atlanta GA,21
San Diego CA,Houston TX,21
Dallas TX,Houston TX,22
Lexington KY,Cincinnati OH,22
Monterey CA,San Francisco CA,22
San Antonio TX,Dallas TX,22
Springfield MO,Atlanta GA,22
St. Louis MO,Tulsa OK,22
Lihue HI,Honolulu HI,23
Milwaukee WI,Orlando FL,23
West Palm Beach/Palm Beach FL,Baltimore MD,23
Carlsbad CA,Los Angeles CA,24
El Paso TX,Houston TX,24
Juneau AK,Gustavus AK,24
Kahului HI,Kona HI,24
Kalispell MT,Denver CO,24
Kona HI,Kahului HI,24
Modesto CA,San Francisco CA,24
San Juan PR,Charlotte Amalie VI,24
Charlotte NC,Greensboro/High Point NC,25
Charlottesville VA,Cincinnati OH,25
Louisville KY,Cincinnati OH,25
Dayton OH,Atlanta GA,26
Dubuque IA,Chicago IL,26
Honolulu HI,Kahului HI,26
Honolulu HI,Lihue HI,26
Macon GA,Atlanta GA,26
Marthas Vineyard MA,Boston MA,26
Rhinelander WI,Iron Mountain/Kingsfd MI,26
Bristol/Johnson City/Kingsport TN,Atlanta GA,27
Colorado Springs CO,Denver CO,27
Devils Lake ND,Jamestown ND,27
Greensboro/High Point NC,Charlotte NC,27
Hibbing MN,International Falls MN,27
International Falls MN,Hibbing MN,27
Oxnard/Ventura CA,Los Angeles CA,27
Tulsa OK,Houston TX,27
Columbus GA,Atlanta GA,28
Iron Mountain/Kingsfd MI,Rhinelander WI,28
Ketchikan AK,Wrangell AK,28
Rochester MN,Minneapolis MN,28
Saginaw/Bay City/Midland MI,Detroit MI,28
Birmingham AL,New York NY,29
Corpus Christi TX,Dallas/Fort Worth TX,29
Ashland WV,Cincinnati OH,30
College Station/Bryan TX,Houston TX,30
Eugene OR,Portland OR,30
Hilo HI,Kahului HI,30
Huntsville AL,Atlanta GA,30
Islip NY,Nashville TN,30
Jamestown ND,Devils Lake ND,30
Lansing MI,Detroit MI,30
South Bend IN,Chicago IL,30
Brainerd MN,Minneapolis MN,31
Christiansted VI,San Juan PR,31
Green Bay WI,Marquette MI,31
Marquette MI,Green Bay WI,31
Palm Springs CA,Los Angeles CA,31
Santa Barbara CA,Los Angeles CA,31
Sitka AK,Juneau AK,31
Traverse City MI,Marquette MI,31
Key West FL,Miami FL,32
La Crosse WI,Minneapolis MN,32
Laramie WY,Denver CO,32
Portland OR,Bend/Redmond OR,32
Portland OR,Eugene OR,32
Tyler TX,Dallas/Fort Worth TX,32
Allentown/Bethlehem/Easton PA,Philadelphia PA,33
Aspen CO,Denver CO,33
Bloomington/Normal IL,Chicago IL,33
El Centro CA,San Diego CA,33
Flagstaff AZ,Phoenix AZ,33
Greer SC,Atlanta GA,33
Idaho Falls ID,Salt Lake City UT,33
Kotzebue AK,Nome AK,33
Madison WI,Chicago IL,33
Mission/McAllen/Edinburg TX,Houston TX,33
New Orleans LA,Houston TX,33
Wichita Falls TX,Dallas/Fort Worth TX,33
Augusta GA,Atlanta GA,34
Bakersfield CA,Los Angeles CA,34
Beaumont/Port Arthur TX,Houston TX,34
Cleveland OH,Chicago IL,34
Cleveland OH,Columbus OH,34
Fort Wayne IN,Cincinnati OH,34
Kansas City MO,Atlanta GA,34
Lake Charles LA,Houston TX,34
Medford OR,Eugene OR,34
Nome AK,Kotzebue AK,34
Peoria IL,Chicago IL,34
Pocatello ID,Salt Lake City UT,34
Austin TX,Houston TX,35
Barrow AK,Deadhorse AK,35
Cedar Rapids/Iowa City IA,Atlanta GA,35
Evansville IN,Cincinnati OH,35
Panama City FL,Atlanta GA,35
Portland ME,Boston MA,35
Waco TX,Dallas/Fort Worth TX,35
Albany GA,Atlanta GA,36
Burlington VT,Newark NJ,36
Charleston/Dunbar WV,Cincinnati OH,36
Duluth MN,Minneapolis MN,36
Kalamazoo MI,Chicago IL,36
Killeen TX,Dallas/Fort Worth TX,36
Moline IL,Chicago IL,36
Oklahoma City OK,Houston TX,36
Tucson AZ,Phoenix AZ,36
Champaign/Urbana IL,Chicago IL,37
Knoxville TN,Atlanta GA,37
Little Rock AR,Memphis TN,37
Muskegon MI,Chicago IL,37
Yakutat AK,Juneau AK,37
Abilene TX,Dallas/Fort Worth TX,38
Akron OH,Cincinnati OH,38
Binghamton NY,Cincinnati OH,38
Cordova AK,Anchorage AK,38
Dothan AL,Atlanta GA,38
Lawton/Fort Sill OK,Dallas/Fort Worth TX,38
Memphis TN,Little Rock AR,38
Montgomery AL,Atlanta GA,38
Myrtle Beach SC,Charlotte NC,38
Oakland CA,Reno NV,38
Twin Falls ID,Salt Lake City UT,38
Asheville NC,Atlanta GA,39
Bangor ME,Boston MA,39
Charleston SC,Charlotte NC,39
Inyokern CA,Los Angeles CA,39
Toledo OH,Cincinnati OH,39
Wilmington NC,Charlotte NC,39
Albuquerque NM,El Paso TX,40
Deadhorse AK,Barrow AK,40
Elko NV,Salt Lake City UT,40
Harlingen/San Benito TX,San Antonio TX,40
Hickory NC,Atlanta GA,40
Jacksonville FL,Tampa FL,40
Norfolk VA,Baltimore MD,40
Yuma AZ,Phoenix AZ,40
Bemidji MN,Minneapolis MN,41
Eagle CO,Denver CO,41
Gainesville FL,Atlanta GA,41
San Luis Obispo CA,Los Angeles CA,41
Sun Valley/Hailey/Ketchum ID,Salt Lake City UT,41
Wichita KS,Atlanta GA,41
Alexandria LA,Houston TX,42
Fargo ND,Minneapolis MN,42
Gunnison CO,Denver CO,42
Santa Maria CA,Los Angeles CA,42
Texarkana AR,Dallas/Fort Worth TX,42
Brunswick GA,Atlanta GA,43
Columbia SC,Atlanta GA,43
Fairbanks AK,Anchorage AK,43
Fort Smith AR,Dallas/Fort Worth TX,43
Hartford CT,Newark NJ,43
Hyannis MA,New York NY,43
Kodiak AK,Anchorage AK,43
Midland/Odessa TX,El Paso TX,43
Omaha NE,Atlanta GA,43
Reno NV,Oakland CA,43
Shreveport LA,Houston TX,43
Valparaiso FL,Atlanta GA,43
Cedar City UT,Salt Lake City UT,44
Savannah GA,Atlanta GA,44
Appleton WI,Chicago IL,45
Jackson WY,Salt Lake City UT,45
Jackson/Vicksburg MS,Memphis TN,45
Pasco/Kennewick/Richland WA,Seattle WA,45
Sioux Falls SD,Minneapolis MN,45
Spokane WA,Boise ID,45
Spokane WA,Las Vegas NV,45
Spokane WA,Seattle WA,45
Longview TX,Dallas/Fort Worth TX,46
Tallahassee FL,Orlando FL,46
Alpena MI,Detroit MI,47
Grand Junction CO,Denver CO,47
Harrisburg PA,Atlanta GA,47
King Salmon AK,Anchorage AK,47
Lafayette LA,Houston TX,47
Montrose/Delta CO,Denver CO,47
Valdosta GA,Atlanta GA,47
Columbus MS,Atlanta GA,48
Manchester NH,Atlanta GA,48
Mosinee WI,Chicago IL,48
San Angelo TX,Dallas/Fort Worth TX,48
Springfield IL,Chicago IL,48
Casper WY,Denver CO,49
Chico CA,San Francisco CA,49
Durango CO,Denver CO,50
Grand Forks ND,Minneapolis MN,50
Tupelo MS,Atlanta GA,50
Baton Rouge LA,Atlanta GA,51
Monroe LA,Houston TX,51
Pellston MI,Detroit MI,51
Pensacola FL,Atlanta GA,51
Scranton/Wilkes-Barre PA,Newark NJ,51
Aberdeen SD,Minneapolis MN,52
Dillingham AK,Anchorage AK,52
Long Beach CA,Las Vegas NV,52
Redding CA,San Francisco CA,52
Rock Springs WY,Denver CO,52
Sault Ste. Marie MI,Detroit MI,52
Escanaba MI,Detroit MI,53
Fayetteville AR,Dallas/Fort Worth TX,53
St. George UT,Salt Lake City UT,53
Waterloo IA,Chicago IL,53
West Yellowstone MT,Salt Lake City UT,53
Rapid City SD,Denver CO,54
White Plains NY,Washington DC,54
Roanoke VA,Atlanta GA,55
Roanoke VA,Cincinnati OH,55
Florence SC,Atlanta GA,56
Victoria TX,Houston TX,56
Bozeman MT,Salt Lake City UT,57
Erie PA,Cincinnati OH,57
Bethel AK,Anchorage AK,58
Butte MT,Salt Lake City UT,58
Atlantic City NJ,Boston MA,59
Elmira/Corning NY,Detroit MI,59
Gulfport/Biloxi MS,Atlanta GA,59
Helena MT,Salt Lake City UT,59
State College PA,Detroit MI,59
Daytona Beach FL,Atlanta GA,60
Fayetteville NC,Atlanta GA,61
Joplin MO,Dallas/Fort Worth TX,61
Lynchburg VA,Atlanta GA,61
Melbourne FL,Atlanta GA,61
Newburgh/Poughkeepsie NY,Washington DC,61
Bismarck/Mandan ND,Minneapolis MN,62
Brownsville TX,Houston TX,62
Eau Claire WI,Chicago IL,62
Hays KS,Denver CO,62
Laredo TX,Houston TX,62
Billings MT,Salt Lake City UT,63
Gillette WY,Denver CO,63
Columbia MO,Chicago IL,64
Jacksonville/Camp Lejeune NC,Atlanta GA,64
Lincoln NE,Minneapolis MN,65
Missoula MT,Salt Lake City UT,65
Cody WY,Salt Lake City UT,66
Minot ND,Minneapolis MN,67
Santa Fe NM,Denver CO,67
Lewiston ID,Salt Lake City UT,69
Garden City KS,Dallas/Fort Worth TX,70
Great Falls MT,Salt Lake City UT,70
Latrobe PA,Myrtle Beach SC,70
Trenton NJ,Raleigh/Durham NC,70
Kinston NC,Atlanta GA,72
Lewisburg WV,Atlanta GA,72
Hancock/Houghton MI,Chicago IL,75
Manhattan/Ft. Riley KS,Dallas/Fort Worth TX,75
Paducah KY,Chicago IL,76
Sarasota/Bradenton FL,Atlanta GA,76
New Bern/Morehead/Beaufort NC,Atlanta GA,77
Sioux City IA,Chicago IL,77
Dickinson ND,Minneapolis MN,78
North Bend/Coos Bay OR,San Francisco CA,79
Roswell NM,Dallas/Fort Worth TX,79
Worcester MA,Orlando FL,79
Hobbs NM,Houston TX,85
Naples FL,Atlanta GA,85
Grand Island NE,Dallas/Fort Worth TX,87
Williston ND,Minneapolis MN,87
New Haven CT,Cincinnati OH,97
Niagara Falls NY,Myrtle Beach SC,102
Plattsburgh NY,Myrtle Beach SC,118
Adak Island AK,King Salmon AK,120
St. Augustine FL,Trenton NJ,120
Aguadilla PR,Fort Lauderdale FL,132
Hayden CO,Houston TX,143
Ponce PR,Orlando FL,157
Pago Pago TT,Honolulu HI,317
Guam TT,Honolulu HI,409

*/
