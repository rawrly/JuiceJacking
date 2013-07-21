#!/bin/bash

save_file="/mnt/usb/data/phones.txt";
base_count=`/usr/bin/lsusb | wc -l`;

while (sleep 2;) do 
  count=`/usr/bin/lsusb | wc -l`;
  
  if [ $count != $base_count ]
    then
      date>>$save_file;
      /usr/bin/lsusb | grep -v root\ hub | grep -v HUB | grep -v SanDisk>>$save_file;
    else 
      sleep 5;
  fi
done
