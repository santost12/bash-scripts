#!/bin/bash

dir="/tmp/"
counter=1

while [ $counter -lt 101 ]; do
    touch "$dir$counter.txt"
    ((counter++))
done
