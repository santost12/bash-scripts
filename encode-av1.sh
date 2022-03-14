#!/bin/bash

# See: https://ffmpeg.org/trac/ffmpeg/wiki/CompilationGuide
ffmpegBinary="/home/ffmpeg/bin/ffmpeg"

# Change these for your setup
inputDir="/home/tyler/handbrake-input/"
outputDir="/home/tyler/hrandbrake-output/"

fileExt="*.mkv"
counter=1

# Change the ffmpeg arguments if you want
# See: https://trac.ffmpeg.org/wiki/Encode/AV1
ffmpegArguments="-c:v libaom-av1 -crf 30 -pix_fmt yuv420p10le -b:v 0 -cpu-used 4 -c:a libopus -b:a 128k"

for file in $inputDir$fileExt; do
	"$ffmpegBinary" -i "$file" $ffmpegArguments "$outputDir$counter.mkv"
	counter=$((counter+1))
done
