#!/bin/sh

NAME=`echo $1 | cut -d "(" -f1`
NUM=`echo $1 | cut -d"(" -f2 | cut -d")" -f1`

if [ $NUM -lt 10 ]; then
    NUM="00$NUM"
elif [ $NUM -lt 100 ]; then
    NUM="0$NUM"
fi

echo $NAME-$NUM
