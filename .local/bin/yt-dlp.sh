#!/bin/bash
#
# This script downloads YouTube URL as MP4 with embedded thumbnail
#
yt-dlp $1 -S vcodec:h264,fps,res,acodec:m4a --embed-thumbnail