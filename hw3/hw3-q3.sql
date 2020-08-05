/*3.(10 points)
Find origin cities that only serve flights shorter than 3 hours.
Name the output column city and sort them alphabetically. List each city only once in the result.
[Output relation cardinality: 109]


*/
select distinct origin_city as city
from Flights
where origin_city not in (select distinct origin_city
from Flights
where actual_time>=3*60);

/*
output:

109 rows retrieved starting from 1 in 18 s 610 ms (execution: 18 s 469 ms, fetching: 141 ms)

city
Dothan AL
Yuma AZ
Laramie WY
Victoria TX
North Bend/Coos Bay OR
Erie PA
Columbus GA
Wichita Falls TX
Hattiesburg/Laurel MS
Green Bay WI
Santa Maria CA
Muskegon MI
Elko NV
Sioux City IA
Lawton/Fort Sill OK
Iron Mountain/Kingsfd MI
Springfield IL
Waco TX
Lansing MI
Alpena MI
Cedar City UT
Visalia CA
Devils Lake ND
Tupelo MS
King Salmon AK
Aberdeen SD
Kalamazoo MI
Idaho Falls ID
Naples FL
Grand Island NE
Lewiston ID
Butte MT
Inyokern CA
Kodiak AK
Fayetteville NC
Niagara Falls NY
Augusta GA
Valdosta GA
Dubuque IA
Macon GA
Bristol/Johnson City/Kingsport TN
Florence SC
New Bern/Morehead/Beaufort NC
Twin Falls ID
La Crosse WI
Binghamton NY
Dickinson ND
Meridian MS
Waterloo IA
Ashland WV
Bemidji MN
Hyannis MA
Jamestown ND
Carlsbad CA
Columbia MO
Hibbing MN
Pocatello ID
Mosinee WI
Gunnison CO
St. George UT
Joplin MO
Duluth MN
West Yellowstone MT
Petersburg AK
Bethel AK
Garden City KS
Marquette MI
Brainerd MN
Gustavus AK
Hobbs NM
Eau Claire WI
Helena MT
San Luis Obispo CA
Lynchburg VA
Wrangell AK
Dillingham AK
Chico CA
Oxnard/Ventura CA
Roanoke VA
Durango CO
Hays KS
Gainesville FL
Manhattan/Ft. Riley KS
Flagstaff AZ
Barrow AK
Texarkana AR
Marthas Vineyard MA
Sun Valley/Hailey/Ketchum ID
Great Falls MT
Redding CA
Hickory NC
New Haven CT
Gillette WY
Abilene TX
College Station/Bryan TX
Beaumont/Port Arthur TX
Roswell NM
Paducah KY
Columbus MS
Escanaba MI
Casper WY
Grand Forks ND
Ketchikan AK
South Bend IN
Modesto CA
Sault Ste. Marie MI
Yakutat AK
Cordova AK
Pellston MI

*/