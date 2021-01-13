#!/bin/bash

weather_station_link="https://www.aprsdirect.com/details/weather/sid/547787"

mkdir -p /tmp/pager

wget ${weather_station_link} -O /tmp/pager/weather_station_report

temperature=`cat /tmp/pager/weather_station_report | grep -in "Latest recived weather reports" -A 40 | grep 357`
echo $temperature

pressure=`cat /tmp/pager/weather_station_report | grep -in "Latest recived weather reports" -A 40 | grep 363`
echo $pressure

wind_gust=`cat /tmp/pager/weather_station_report | grep -in "Latest recived weather reports" -A 40 | grep 371`
echo $wind_gust

wind=`cat /tmp/pager/weather_station_report | grep -in "Latest recived weather reports" -A 40 | grep 373`
echo $wind
