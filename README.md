# Workflow for rendering Kiberpipa videos

## Getting Videos from the camera

- connect camera with mini usb cable (connector on the camera is on the front)
- on camera screen select option "back up"
- camera appears as disk, copy all .TOD files from camera to current folder

## Installing tools

- $ bash <(curl https://nixos.org/nix/install)
- $ source ~/.nix-profile/etc/profile.d/nix.sh
- $ nix-shell

## Converting videos to high-profile mp4/aac

   $ ./encode.sh
   
## Edit Videos

Run kdenlive and do:

- insert introduction movie (intro.mp4)
- cut start/end of the video
- render (screenshot)

## Denoise (optional)

- $ ffmpeg -i video.mkv -acodec pcm_s16le -ac 2 temp.wav
- open audacity temp.wav and remove noise as per instructions on http://www.youtube.com/watch?v=mlKX6p85R2M
- $ ffmpeg -i temp.wav -c:a libfdk_aac -b:a 128k temp.m4a
- $ ffmpeg -i temp.m4a -i video.mp4 -c copy -map 0:0 -map 1:0 -shortest video-denoised.mkv

## Upload to video.kiberpipa.org

- upload files to FTP
- for each video (if you have a meetup), make a lecture on http://video.kiberpipa.org/site/manage/#lectures/lectures
- set authors
- set event type: POT
- encode first (wait for it to finish)
- make a thumb
- publish