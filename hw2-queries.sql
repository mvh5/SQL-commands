-- Query 1 . Result has 3 rows
select distinct flight_num from Flights, Weekdays, Carriers where day_of_week_id = did and
day_of_week='Monday' and
origin_city = 'Seattle WA' AND
dest_city = 'Boston MA' and
carrier_id = cid and
Carriers.name = 'Alaska Airlines Inc.';

--Query 2, 488 lines
select carrier1.name, flight1.flight_num, flight1.origin_city,
flight1.dest_city, flight1.actual_time, 
flight2.flight_num, flight2.origin_city,
flight2.dest_city, flight2.actual_time,
flight1.actual_time + flight2.actual_time
from Flights flight1, Flights flight2, Carriers carrier1, Months month1
where flight1.origin_city = 'Seattle WA'
and flight1.dest_city = flight2.origin_city
and flight2.dest_city = 'Boston MA'
and flight1.carrier_id = flight2.carrier_id
and carrier1.cid = flight1.carrier_id
and flight1.year = 2015 and flight2.year = 2015 and
flight1.month_id = flight2.month_id
and month1.mid = flight1.month_id
and month1.month = 'July'
and flight1.day_of_month = 15
and flight2.day_of_month = 15
and flight1.actual_time + flight2.actual_time < 420;

--American Airlines Inc.  42          Seattle WA   Chicago IL  228          26          Chicago IL   Boston MA   150          378                                      
--American Airlines Inc.  42          Seattle WA   Chicago IL  228          186         Chicago IL   Boston MA   137          365                                      
--American Airlines Inc.  42          Seattle WA   Chicago IL  228          288         Chicago IL   Boston MA   137          365                                      
--American Airlines Inc.  42          Seattle WA   Chicago IL  228          366         Chicago IL   Boston MA   150          378                                      
--American Airlines Inc.  42          Seattle WA   Chicago IL  228          1205        Chicago IL   Boston MA   128          356                                      
--American Airlines Inc.  42          Seattle WA   Chicago IL  228          1240        Chicago IL   Boston MA   130          358                                      
--American Airlines Inc.  42          Seattle WA   Chicago IL  228          1299        Chicago IL   Boston MA   133          361                                      
--American Airlines Inc.  42          Seattle WA   Chicago IL  228          1435        Chicago IL   Boston MA   133          361                                      
--American Airlines Inc.  42          Seattle WA   Chicago IL  228          1557        Chicago IL   Boston MA   122          350                                      
--American Airlines Inc.  42          Seattle WA   Chicago IL  228          2503        Chicago IL   Boston MA   127          355                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          84          New York NY  Boston MA   74           396                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          199         New York NY  Boston MA   80           402                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          235         New York NY  Boston MA   91           413                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          1443        New York NY  Boston MA   80           402                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          2118        New York NY  Boston MA                322                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          2121        New York NY  Boston MA   74           396                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          2122        New York NY  Boston MA   65           387                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          2126        New York NY  Boston MA   60           382                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          2128        New York NY  Boston MA   83           405                                      
--American Airlines Inc.  44          Seattle WA   New York N  322          2131        New York NY  Boston MA   70           392 



--Query 3, 1 row
select weekday1.day_of_week, avg(flight1.arrival_delay)
from Flights flight1, Weekdays weekday1
where weekday1.did = flight1.day_of_week_id
group by Flight1.day_of_week_id
order by avg(flight1.arrival_delay) DESC
limit 1;    

--Query 4, 11 rows
select distinct carrier1.name from Flights flight1, Carriers carrier1
where flight1.carrier_id = carrier1.cid
group by flight1.carrier_id, flight1.year, flight1.month_id, flight1.day_of_month
having count(*) > 1000;

--query 5, 6 rows
select carrier1.name,100.0*sum(flight1.canceled) / count(flight1.canceled) from Flights flight1, Carriers carrier1 where flight1.carrier_id = carrier1.cid and flight1.origin_city = 'Seattle WA' group by flight1.carrier_id having 1.0*sum(flight1.canceled) / count(flight1.canceled) > .005 order by 1.0*sum(flight1.canceled) / count(flight1.canceled) ;
