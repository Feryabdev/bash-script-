#!/bin/bash

if [ -z $@ ]
then
       echo "Please give me a file"
exit 1

fi

CHMOD=$@

if [ -x $CHMOD ]
then
       echo "This file has already execute rights"

elif [ -e $CHMOD ]
then
       chmod +x $CHMOD
       echo "this file has now execute rights"

else   echo "this file does not exist"

fi
