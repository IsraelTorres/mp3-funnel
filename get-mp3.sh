#!/bin/bash
# Israel Torres
# 20161006
# converts youtube video to mp3, url can be single video, playlist, channel
# requires youtubel-dl, ffmpeg
#
FFLIB="/usr/local/bin"
YT_URL="$1"
if [[ -n "$YT_URL" ]]; then
    youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg --ffmpeg-location "$FFLIB" "$YT_URL"
else
    echo -en "usage:\tget-mp3.sh Youtube_URL\n"
fi
#EOF