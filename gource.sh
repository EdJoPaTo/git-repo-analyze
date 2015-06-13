#!/bin/bash

gource -1280x720 -c 4 --hide 'bloom,mouse,progress' -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b 10000K gource.webm
