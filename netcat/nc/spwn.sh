#!/bin/bash

DOCK="docker-compose"

if [ "$1" == "down" ]
then
    ${DOCK} down
    exit 0
fi


if [ $# != 0 ] && [ $# -eq 1 ]
then
    ${DOCK} up -d
    echo "###### $1 #######"
    ${DOCK} exec "$1" sh
else
    echo "Require exactly one argument."
fi


exit 0




