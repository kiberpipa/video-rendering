# Workflow for rendering Kiberpipa videos

## 1. Getting Videos from the camera

- connect camera with mini usb cable (connector on the camera is on the front)
- on camera screen select option "back up"
- camera appears as disk, copy all .TOD files from camera to current folder

## 2. Installing tools

- $ bash <(curl https://nixos.org/nix/install)
- $ source ~/.nix-profile/etc/profile.d/nix.sh
- $ nix-shell

## 3. Converting videos to high-profile mp4/aac

- $ ./encode.sh
   
## 4. Edit Videos

Run kdenlive and do:

- insert introduction clip (intro.mp4) with dissolve transition
- cut start/end of the video
- press ctrl-enter to render (see screenshot for settings)

## 5. Denoise (optional)

- $ ffmpeg -i video.mp4 -acodec pcm_s16le -ac 2 temp.wav
- open audacity temp.wav and remove noise as per instructions on http://www.youtube.com/watch?v=mlKX6p85R2M
- $ ffmpeg -i temp.wav -c:a libfdk_aac -b:a 128k temp.m4a
- $ ffmpeg -i temp.m4a -i video.mp4 -c copy -map 0:0 -map 1:0 -shortest video-denoised.mp4

## 6. Upload to video.kiberpipa.org

- upload files to FTP: curl -T video.mp4 ftp://video.kiberpipa.org --user user:pass
- for each video (if you have a meetup), create a lecture on http://video.kiberpipa.org/site/manage/#lectures/lectures
- add authors
- set event type: POT
- encode first (wait for it to finish)
- make a thumb
- specify intranet ID
- publish