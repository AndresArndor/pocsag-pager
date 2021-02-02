#!/bin/bash

sun_rise_set_link="https://dateandtime.info/ru/citysunrisesunset.php?id=498677"

mkdir -p /tmp/pager

wget ${sun_rise_set_link} -O /tmp/pager/sun_report

sunset_time=`cat /tmp/pager/sun_report | grep -in "Восход Солнца" -A 21 | grep 320 | awk -F'[ ,]+' '{print $2}' | awk -F'[><]+' '{print $2}' | cut -f1 -d"&"`

sudo RemoteCommand 7642 page 1234567 "R4CHD, Sunset today: ${sunset_time}"
