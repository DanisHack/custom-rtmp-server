#! /bin/bash
#
# Diffusion youtube avec ffmpeg
 
# Configure youtube with 720p resolution. The video is not Scaled.
# Configure youtube with 720p resolution. The video is not Scaled.
 
VBR="2500k"                                     # Bitrate Video output
FPS="30"                                        # FPS Video output
QUAL="medium"                                  # Preset de qualité FFMPEG
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"  # URL de base RTMP youtube
 
SOURCE="file1.flv"              # Source UDP (voir les annonces SAP)
KEY="danshu.khan.3hmw-98wy-vcmg-a8zr"                                      # key to retrieve the event on youtube
 
ffmpeg \
    -i "$SOURCE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS*2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$KEY"
