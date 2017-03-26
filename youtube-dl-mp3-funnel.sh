#!/bin/bash
# Israel Torres
# 20170325
# check iff mp3 exists by ID, if it does, go to next; otherwise download as mp3
# requires youtube-dl
#
listname="$1"
if [[ -z "$listname" ]]
    then
        echo -en "usage:\tyoutube-dl-mp3-tunnel.sh video_id_list.txt\n"
        exit 1
    else
        if [[ -f "$listname" ]]
            then
                : #no-op
            else
                echo -en "usage:\tyoutube-dl-mp3-tunnel.sh video_id_list.txt - file not found\n"
                exit 1
            fi
fi

        echo -en "[mp3 funnel] #--> using $listname for video IDs...\n"

for id in $(cat "$listname")
    do
        echo -en "[mp3 funnel] #--> searching for ID:\t$id\n"
        testmp3=$(find . -name "*-$id.mp3")
        testmp3=$(basename "$testmp3")

if [[ -f "$testmp3" ]]
          then
              echo -en "[mp3 funnel] #--> ID:$id found! skipping...\n"
          else
              echo -en "[mp3 funnel] #--> DOWNLOADING ID:\t$id \n"
              get-mp3.sh https://www.youtube.com/watch?v="$id"
      fi
    done
#
# EOF