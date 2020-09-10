
DROP TABLE IF EXISTS Flights;
DROP TABLE IF EXISTS Carriers;
DROP TABLE IF EXISTS Weekdays;
DROP TABLE IF EXISTS Months;



CREATE TABLE Carriers(
    cid varchar(7) PRIMARY KEY,
    name varchar(83)
);

CREATE TABLE Weekdays(
    did int PRIMARY KEY,
    day_of_week varchar(9)
);

CREATE TABLE Months
(
    mid int PRIMARY KEY,
    month varchar(9)
);

CREATE TABLE Flights(
  fid int PRIMARY KEY NOT NULL,
  month_id int,
  day_of_month int,
  day_of_week_id int,
  carrier_id varchar(7),
  flight_num int,
  origin_city varchar(34),
  origin_state varchar(47),
  dest_city varchar(34),
  dest_state varchar(46),
  departure_delay int,
  taxi_out int,
  arrival_delay int,
  canceled int,
  actual_time int,
  distance int,
  capacity int,
  price int
);
