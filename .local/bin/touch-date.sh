#!/bin/sh
# 
# Append date and time to all files in list
# 
for filename in $1; do
  mv "$filename" "${filename%.*}_$(stat -f "%SB" -t "%Y-%m-%d-%H%M" "${filename}").${filename##*.}"
done
