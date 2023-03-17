#!/bin/bash

## Note: This script assumes your videos are:
##  1) in order
##  2) using MKV container

## Download ffmpeg or see: https://ffmpeg.org/trac/ffmpeg/wiki/CompilationGuide
ffmpegBinary="/c/Users/tyler/bin/ffmpeg.exe"

## Change these to match your source and output folders
inputDir="/c/Users/tyler/handbrake-input/*.mkv"
outputDir="/c/Users/tyler/handbrake-output/"
counter=1

## See: https://trac.ffmpeg.org/wiki/Encode/H.265
ffmpegArguments="-c:v libx265 -crf 30 -preset slow -c:a libopus -b:a 128k"

for file in $inputDir; do

    if [ $counter -lt 10 ]; then
        "$ffmpegBinary" -i "$file" $ffmpegArguments "$outputDir"0"$counter.mkv"
    else
        "$ffmpegBinary" -i "$file" $ffmpegArguments "$outputDir$counter.mkv"
    fi

    ((counter++))
done
