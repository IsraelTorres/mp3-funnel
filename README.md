# mp3-funnel
kludge for youtube-dl to smartly check if an mp3 version of a video exists prior to converting to mp3
requires: https://github.com/rg3/youtube-dl

Normally you can download a video, playlist, channel using youtube-dl; however at least up to version 2017.03.24 youtube-dl would check to see if only the video file existed prior to attempting to remerge the already merged mp3. mp3-funnel takes the generated video_id_list file and then compares the video ids with the already existing mp3s. If the mp3s exist, it does not attempt to download the video for mp3 conversion, instead moves to the next video id and so on.

This has also been added as a feature/bug fix on youtube-dl: https://github.com/rg3/youtube-dl/issues/12557 ; however this is a temporary kludge which works for me nicely.

#generating video_id_list.txt
# basic
youtube-dl --get-id "https://www.youtube.com/channel/YYYYYYYYYYYYYYYYYYYYYYYY" >> video_id_list.txt
# use 'tail -f video_id_list.txt' to monitor file

# common error:
ERROR: unable to download video info webpage: <urlopen error [Errno 65] No route to host> (caused by URLError(error(65, 'No route to host'),))
# helping below modifications helps

#extract IDs, https://www.youtube.com/watch?v=XXXXXXXXXXX to file
#
youtube-dl --sleep-interval 10 --max-sleep-interval 30 --get-id --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36" "https://www.youtube.com/channel/YYYYYYYYYYYYYYYYYYYYYYYY" >> video_id_list.txt

#add playlist in reverse: --playlist-reverse, helpful for large lists and timeouts
#
youtube-dl --sleep-interval 10 --max-sleep-interval 30 --playlist-reverse --get-id --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36" "https://www.youtube.com/channel/YYYYYYYYYYYYYYYYYYYYYYYY" >> video_id_list.txt
