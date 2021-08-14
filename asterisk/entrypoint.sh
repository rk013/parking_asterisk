#!/bin/bash

default_password_count=$(grep -c 'password=password' configs/pjsip_endpoints.conf)
counter=0
while [ $counter -lt $default_password_count ]
do
  newpassword=$(tr -dc '[:alnum:]' < /dev/urandom | fold -w 10| head -1)
  sed -i "0,/password=password/s/password=password/password=$newpassword/" configs/pjsip_endpoints.conf
  ((counter++))
done

/usr/sbin/asterisk -gcvvv
