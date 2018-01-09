create table Carriers (cid varchar(10), name varchar(100), PRIMARY KEY(cid));

create table Months(mid INTEGER, month varchar(20), PRIMARY KEY(mid));

create table Weekdays(did INTEGER, day_of_week varchar(20), PRIMARY KEY(did));

create table Flights (fid INTEGER, year INTEGER, month_id INTEGER, day_of_month INTEGER, day_of_week_id INTEGER, carrier_id VARCHAR(20), flight_num INTEGER, origin_city VARCHAR(30), origin_state VARCHAR(30), dest_city VARCHAR(30), dest_state VARCHAR(30), departure_delay int, taxi_out int, arrival_delay int, canceled int, actual_time int, distance int, PRIMARY KEY (fid), FOREIGN KEY (carrier_id) REFERENCES Carriers(cid), FOREIGN KEY (month_id) REFERENCES Months(mid), FOREIGN KEY (day_of_week_id) REFERENCES Weekdays(did));

.import carriers.csv Carriers

.import weekdays.csv Weekdays

.import months.csv Months

.import flights-small.csv Flights
