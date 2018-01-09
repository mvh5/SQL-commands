{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf470
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;}
\margl1440\margr1440\vieww23420\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 create table Carriers (cid varchar(10), name varchar(100), PRIMARY KEY(cid));\
\
create table Months(mid INTEGER, month varchar(20), PRIMARY KEY(mid));\
\
create table Weekdays(did INTEGER, day_of_week varchar(20), PRIMARY KEY(did));\
\
create table \cf2 \expnd0\expndtw0\kerning0
Flights (fid INTEGER, year INTEGER, month_id INTEGER, day_of_month INTEGER, day_of_week_id INTEGER, carrier_id VARCHAR(20), flight_num INTEGER, origin_city VARCHAR(30), origin_state VARCHAR(30), dest_city VARCHAR(30), dest_state VARCHAR(30), departure_delay int, taxi_out int, arrival_delay int, canceled int, actual_time int, distance int, PRIMARY KEY (fid), FOREIGN KEY (carrier_id) REFERENCES Carriers(cid), FOREIGN KEY (month_id) REFERENCES Months(mid), FOREIGN KEY (day_of_week_id) REFERENCES Weekdays(did));\
\
.import carriers.csv Carriers\
\
.import weekdays.csv Weekdays\
\
.import months.csv Months\
\
.import flights-small.csv Flights
\f1\fs28 \
}