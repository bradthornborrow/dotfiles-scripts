#!/bin/sh
for filename in *.webp ; do
  convert $filename ${filename%.webp}.jpg
done
