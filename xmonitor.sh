#!/bin/bash

base_count=`/sbin/lsusb | wc -l`;
last_count=$base_count;
seconds=2;

/usr/bin/xset -dpms;
/usr/bin/xset s off; 

/usr/bin/jwm &
/usr/bin/xsetroot -solid \#0f88bc;
viewnior --slideshow chargestation.jpg &

while ( sleep $seconds;  ) do 
 count=`/sbin/lsusb | wc -l`;
 
 if [ $last_count != $count ] 
  then
  if [ $count != $base_count ] 
   then 
   /usr/bin/xsetroot -solid \#a30909;
   killall viewnior:
   viewnior --slideshow yourestupid.jpg &
   sleep 5;
   viewnior --slideshow chargestation.jpg &
 else 
   /usr/bin/xsetroot -solid \#0f88bc;
   killall viewnior:
   viewnior --slideshow chargestation.jpg &
  fi
 fi
 last_count=$count;
done
