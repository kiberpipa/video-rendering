for i in *.TOD; do
  ffmpeg -i $i -c:v libx264 -crf 18 -s 1280x720 -preset slow -c:a copy $i.mp4
done
