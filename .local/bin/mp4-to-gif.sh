#!/bin/bash
# Generate a colour palette from MP4 video
ffmpeg -y -i $1 -vf fps=15,scale=448:-1:flags=lanczos,palettegen ./palette.png
# Output to GIF using the palette
ffmpeg -i $1 -i ./palette.png -filter_complex "fps=15,scale=448:-1:flags=lanczos[x];[x][1:v]paletteuse" ./output.gif
