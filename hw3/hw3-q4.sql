/*3. (15 points)
For each origin city, find the percentage of non-canceled departing flights shorter than 3 hours.
(That is, compute number of non-canceled departing flights shorter than 3 hours / number of non-canceled departing flights * 100%, for each origin city.)
Name the output columns origin_city and percentage
Order by percentage value, ascending.
Be careful to handle cities without any flights shorter than 3 hours.
Please report 0 as the result for those cities.
(Hint: if your solution returns NULL for those cities, find a way to replace NULL with 0.
Consider using a SQL CASE clause.)
Report percentages as percentages not decimals (e.g., report 75.25 rather than 0.7525).
[Output relation cardinality: 327]*/
select f2.origin_city as origin_city, cast((select count(*) as number
                                            from FLIGHTS as f1
                                            where f1.actual_time < 180
                                            and f1.origin_city = f2.origin_city
                                            group by f1.origin_city) as float) * 100 /count(*) as percentage
from FLIGHTS as f2
group by f2.origin_city;

/*
output:
327 rows retrieved starting from 1 in 9 s 949 ms (execution: 9 s 840 ms, fetching: 109 ms)

results:
origin_city/percentage
Aberdeen SD,100
Abilene TX,100
Adak Island AK,88.88888888888889
Aguadilla PR,29.433962264150942
Akron OH,95.06172839506173
Albany GA,99.47916666666667
Albany NY,95.22830111065406
Albuquerque NM,90.64964325948179
Alexandria LA,99.56427015250544
Allentown/Bethlehem/Easton PA,98.98819561551433
Alpena MI,100
Amarillo TX,99.5704467353952
Anchorage AK,32.14603739982191
Appleton WI,99.38144329896907
Arcata/Eureka CA,99.57264957264957
Asheville NC,99.45652173913044
Ashland WV,100
Aspen CO,97.31800766283524
Atlanta GA,88.972274338128
Atlantic City NJ,99.30875576036867
Augusta GA,100
Austin TX,83.24706476454993
Bakersfield CA,82.97546012269939
Baltimore MD,81.28273710018945
Bangor ME,99.33444259567388
Barrow AK,100
Baton Rouge LA,99.74160206718346
Beaumont/Port Arthur TX,100
Bemidji MN,100
Bend/Redmond OR,99.81651376146789
Bethel AK,100
Billings MT,99.88235294117646
Binghamton NY,100
Birmingham AL,96.00257898130239
Bismarck/Mandan ND,99.82547993019197
Bloomington/Normal IL,99.78308026030369
Boise ID,89.36560322698936
Boston MA,69.70839849139914
Bozeman MT,95.39789069990412
Brainerd MN,100
Bristol/Johnson City/Kingsport TN,100
Brownsville TX,99.49622166246851
Brunswick GA,99.40119760479043
Buffalo NY,94.60262441198316
Burbank CA,93.68081180811808
Burlington VT,99.30615784908933
Butte MT,100
Carlsbad CA,100
Casper WY,100
Cedar City UT,100
Cedar Rapids/Iowa City IA,99.7855611150822
Champaign/Urbana IL,99.80392156862744
Charleston SC,98.90688259109312
Charleston/Dunbar WV,98.54838709677419
Charlotte Amalie VI,40
Charlotte NC,86.94054605766777
Charlottesville VA,99.73684210526316
Chattanooga TN,99.87714987714988
Chicago IL,79.76594787020746
Chico CA,100
Christiansted VI,65.33333333333333
Cincinnati OH,92.50974658869396
Cleveland OH,87.91540785498489
Cody WY,99.54954954954955
College Station/Bryan TX,100
Colorado Springs CO,97.87126203750634
Columbia MO,100
Columbia SC,99.21652421652422
Columbus GA,100
Columbus MS,100
Columbus OH,89.3836836480228
Cordova AK,100
Corpus Christi TX,99.42100909842846
Crescent City CA,95.06172839506173
Dallas TX,91.24986259206332
Dallas/Fort Worth TX,81.08892777601018
Dayton OH,98.52451213707758
Daytona Beach FL,97.54601226993866
Deadhorse AK,95.45454545454545
Denver CO,84.21492730558627
Des Moines IA,98.4
Detroit MI,84.89461873542483
Devils Lake ND,100
Dickinson ND,100
Dillingham AK,100
Dothan AL,100
Dubuque IA,100
Duluth MN,100
Durango CO,100
Eagle CO,97.08029197080292
Eau Claire WI,100
El Centro CA,96.7741935483871
El Paso TX,94.61912479740681
Elko NV,100
Elmira/Corning NY,99.0049751243781
Erie PA,100
Escanaba MI,100
Eugene OR,99.54545454545455
Evansville IN,99.46977730646871
Fairbanks AK,50.69124423963134
Fargo ND,99.79695431472081
Fayetteville AR,94.69947941315665
Fayetteville NC,100
Flagstaff AZ,100
Flint MI,96.92737430167598
Florence SC,100
Fort Lauderdale FL,76.52109911678116
Fort Myers FL,86.66289912404635
Fort Smith AR,99.14772727272727
Fort Wayne IN,99.52335557673975
Fresno CA,93.72006386375732
Gainesville FL,100
Garden City KS,100
Gillette WY,100
Grand Forks ND,100
Grand Island NE,100
Grand Junction CO,99.84496124031008
Grand Rapids MI,98.11980760822037
Great Falls MT,100
Green Bay WI,100
Greensboro/High Point NC,97.31512011304757
Greer SC,99.35597189695551
Guam TT,
Gulfport/Biloxi MS,99.88789237668162
Gunnison CO,100
Gustavus AK,100
Hancock/Houghton MI,98.41269841269842
Harlingen/San Benito TX,99.74874371859296
Harrisburg PA,99.38080495356037
Hartford CT,87.05277722870133
Hattiesburg/Laurel MS,100
Hayden CO,96.7741935483871
Hays KS,100
Helena MT,100
Hibbing MN,100
Hickory NC,100
Hilo HI,96.15861214374226
Hobbs NM,100
Honolulu HI,54.908808692277844
Houston TX,78.30604681709434
Huntsville AL,98.97470950102529
Hyannis MA,100
Idaho Falls ID,100
Indianapolis IN,86.47759323096209
International Falls MN,98.11320754716981
Inyokern CA,100
Iron Mountain/Kingsfd MI,100
Islip NY,94.35104236718225
Jackson WY,93.24324324324324
Jackson/Vicksburg MS,99.70308788598575
Jacksonville FL,96.484375
Jacksonville/Camp Lejeune NC,99.04761904761905
Jamestown ND,100
Joplin MO,100
Juneau AK,99.72375690607734
Kahului HI,53.66499852811304
Kalamazoo MI,100
Kalispell MT,92.61538461538461
Kansas City MO,89.92417279411765
Ketchikan AK,100
Key West FL,98.23008849557522
Killeen TX,99.87789987789988
King Salmon AK,100
Kinston NC,98.87640449438203
Knoxville TN,98.87820512820512
Kodiak AK,100
Kona HI,63.282107574094404
Kotzebue AK,98.70967741935483
La Crosse WI,100
Lafayette LA,99.87714987714988
Lake Charles LA,99.63503649635037
Lansing MI,100
Laramie WY,100
Laredo TX,99.78021978021978
Las Vegas NV,65.16300928838398
Latrobe PA,78.76712328767124
Lawton/Fort Sill OK,100
Lewisburg WV,94.73684210526316
Lewiston ID,100
Lexington KY,99.62025316455696
Lihue HI,69.14893617021276
Lincoln NE,99.43502824858757
Little Rock AR,96.15802827111273
Long Beach CA,62.45411641321447
Longview TX,99.35064935064935
Los Angeles CA,56.60410764872521
Louisville KY,94.9901120632828
Lubbock TX,99.28966061562747
Lynchburg VA,100
Macon GA,100
Madison WI,98.5218874360432
Manchester NH,91.79320318148952
Manhattan/Ft. Riley KS,100
Marquette MI,100
Marthas Vineyard MA,100
Medford OR,99.86754966887418
Melbourne FL,99.14529914529915
Memphis TN,93.07720188474084
Meridian MS,100
Miami FL,71.1592525219117
Midland/Odessa TX,99.55223880597015
Milwaukee WI,85.93323535586815
Minneapolis MN,76.73533816327357
Minot ND,99.67845659163987
Mission/McAllen/Edinburg TX,99.33884297520662
Missoula MT,98.76712328767124
Mobile AL,99.66703662597115
Modesto CA,100
Moline IL,98.91008174386921
Monroe LA,99.77220956719817
Monterey CA,99.66367713004485
Montgomery AL,99.83361064891847
Montrose/Delta CO,98.1029810298103
Mosinee WI,100
Muskegon MI,100
Myrtle Beach SC,99.25428784489188
Nantucket MA,99.11504424778761
Naples FL,100
Nashville TN,89.13397031917056
New Bern/Morehead/Beaufort NC,100
New Haven CT,100
New Orleans LA,86.49153386454184
New York NY,63.481519772551046
Newark NJ,67.13735558408216
Newburgh/Poughkeepsie NY,94.70588235294117
Newport News/Williamsburg VA,99.29078014184397
Niagara Falls NY,100
Nome AK,98.70967741935483
Norfolk VA,89.50998185117967
North Bend/Coos Bay OR,100
Oakland CA,81.18639139284676
Oklahoma City OK,94.38775510204081
Omaha NE,96.67132867132867
Ontario CA,88.44147715418319
Orlando FL,85.42189611894189
Oxnard/Ventura CA,100
Paducah KY,100
Pago Pago TT,
Palm Springs CA,97.02602230483271
Panama City FL,99.73787680209699
Pasco/Kennewick/Richland WA,98.67549668874172
Pellston MI,100
Pensacola FL,99.2260917634052
Peoria IL,99.86648865153538
Petersburg AK,100
Philadelphia PA,68.46375143843498
Phoenix AZ,70.17230726985653
Pittsburgh PA,85.58958214081282
Plattsburgh NY,68
Pocatello ID,100
Ponce PR,41.935483870967744
Portland ME,96.67093469910371
Portland OR,68.92789844292373
Providence RI,92.49388088115312
Raleigh/Durham NC,91.42620624408704
Rapid City SD,99.0546218487395
Redding CA,100
Reno NV,87.99273858921161
Rhinelander WI,98.87640449438203
Richmond VA,94.23639555295495
Roanoke VA,100
Rochester MN,99.36305732484077
Rochester NY,99.2722602739726
Rock Springs WY,98.27586206896552
Roswell NM,100
Sacramento CA,81.62229102167183
Saginaw/Bay City/Midland MI,99.7275204359673
Salt Lake City UT,84.99853868314476
San Angelo TX,99.67320261437908
San Antonio TX,89.67215637986763
San Diego CA,68.53728938712493
San Francisco CA,56.30765682656826
San Jose CA,80.9409453116472
San Juan PR,33.89036070919095
San Luis Obispo CA,100
Santa Ana CA,77.45538580048786
Santa Barbara CA,98.75959834613113
Santa Fe NM,99.35897435897436
Santa Maria CA,100
Sarasota/Bradenton FL,97.5093399750934
Sault Ste. Marie MI,100
Savannah GA,98.6723565670934
Scranton/Wilkes-Barre PA,98.80952380952381
Seattle WA,57.755416553349654
Shreveport LA,99.67871485943775
Sioux City IA,100
Sioux Falls SD,99.51749095295537
Sitka AK,99.70674486803519
South Bend IN,100
Spokane WA,96.53720168460458
Springfield IL,100
Springfield MO,99.75288303130148
St. Augustine FL,92.3076923076923
St. George UT,100
St. Louis MO,84.24770198355104
State College PA,99.5850622406639
Sun Valley/Hailey/Ketchum ID,100
Syracuse NY,99.40955448201825
Tallahassee FL,99.22978177150192
Tampa FL,88.19969742813919
Texarkana AR,100
Toledo OH,99.83471074380165
Traverse City MI,99.375
Trenton NJ,97.84946236559139
Tucson AZ,84.03361344537815
Tulsa OK,98.25728770595691
Tupelo MS,100
Twin Falls ID,100
Tyler TX,99.78902953586498
Valdosta GA,100
Valparaiso FL,99.4142259414226
Victoria TX,100
Visalia CA,100
Waco TX,100
Washington DC,78.78877594657719
Waterloo IA,100
West Palm Beach/Palm Beach FL,90.67233590220569
West Yellowstone MT,100
White Plains NY,93.98373983739837
Wichita Falls TX,100
Wichita KS,99.13097454996897
Williston ND,87.55020080321285
Wilmington NC,99.82300884955752
Worcester MA,67.74193548387096
Wrangell AK,100
Yakutat AK,100
Yuma AZ,100

*/