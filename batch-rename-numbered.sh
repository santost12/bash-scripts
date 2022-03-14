#!/bin/bash

# Rename all files in a folder with a certain extension to count up.
# This is useful if your files have really long names and they are already in order.
# This script needs to be modified if you aren't working with .mkv files.

# After running this script, I recommend you preappend a 0 to the files that are numbered under 10.
# Example: rename 1.mkv to 01.mkv and so on..

inputDir="/tmp/test/"

fileExt="*.mkv"
counter=1

for file in $inputDir$fileExt; do
	mv "$file" "$inputDir$counter.mkv"
	counter=$((counter+1))
done
