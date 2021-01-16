#!/bin/bash

weather_station_link="https://www.aprsdirect.com/details/weather/sid/547787"

mkdir -p /tmp/pager

wget ${weather_station_link} -O /tmp/pager/weather_station_report

temperature=`cat /tmp/pager/weather_station_report | grep -in "Latest recived weather reports" -A 40 | grep 357 | awk -F'[ ,]+' '{print $2}' | cut -f1 -d"&"`
export $temperature

pressure=`cat /tmp/pager/weather_station_report | grep -in "Latest recived weather reports" -A 40 | grep 363 | awk -F'[ ,]+' '{print $2}'`
export $pressure

wind_gust=`cat /tmp/pager/weather_station_report | grep -in "Latest recived weather reports" -A 40 | grep 371 | awk -F'[ ,]+' '{print $5}'`
export $wind_gust

wind=`cat /tmp/pager/weather_station_report | grep -in "Latest recived weather reports" -A 40 | grep 373 | awk -F'[ ,]+' '{print $2}'`
export $wind

sudo RemoteCommand 7642 page 1234567 "R4CHD, weather: T: ${temperature}, P: ${pressure}, W: ${wind_gust}"
