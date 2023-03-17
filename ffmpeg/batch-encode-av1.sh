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

## See: https://trac.ffmpeg.org/wiki/Encode/AV1
ffmpegArguments="-c:v libaom-av1 -crf 30 -pix_fmt yuv420p10le -b:v 0 -cpu-used 4 -c:a libopus -b:a 128k"

for file in $inputDir; do

    if [ $counter -lt 10 ]; then
        "$ffmpegBinary" -i "$file" $ffmpegArguments "$outputDir"0"$counter.mkv"
    else
        "$ffmpegBinary" -i "$file" $ffmpegArguments "$outputDir$counter.mkv"
    fi

    counter=$((counter+1))
done
