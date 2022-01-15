#!/usr/bin/env bash

filename='./ex5.sh'

while read line
do
    echo "$line"
done < $filename