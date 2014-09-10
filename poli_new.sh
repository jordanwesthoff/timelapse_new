#Check if user is root
#Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

read -p "Current Type (All or Day) ((Enter the directory name to pull from))" TYPE
CURRENT=/home/jordan/Desktop/timelapse_new/$TYPE
CURRENT_home=/home/jordan/Desktop/timelapse_new


#Scrub bad timelapse framez
#ruby /home/jordan/Desktop/timelapse_new/detect-bad-timelapse-frames.rb /home/jordan/Desktop/timelapse_new/enddir /home/jordan/Desktop/timelapse_new/bad_frames /home/jordan/Desktop/timelapse_new/temp2

#Generates a filename for the final video
FILENAME="poli2-timelapse-`date +%Y%m%d`-$TYPE"

#produces a .h264 file from various.png images
#ffmpeg -t "/home/jordan/Desktop/timelapse_new/enddir/SAU2_*/*.png"  type=png:fps=30 -ovc x264 /home/jordan/Desktop/finished_videos/$FILENAME.h264
#ffmpeg -i mf://home/jordan/Desktop/timelapse_new/endir -vcodec mpeg4 /home/jordan/Desktop/timelapse_new/timelapse.avi
cd $CURRENT
ls -1v | grep png > files.txt
mencoder -nosound -ovc x264 -lavcopts vcodec=mpeg4:vbitrate=21600000 -o $CURRENT_home/finished_videos/timelapse_test.mp4 -mf type=png:fps=24 mf://@files.txt -vf scale=1920:1080

#Converts the .h264 file into a .mp4 file
# ffmpeg -i /home/jordan/Desktop/timelapse_new/finished_videos/$FILENAME.h264 /home/jordan/Desktop/timelapse_new/finished_videos/$FILENAME.mp4

#Removes the old .h264 file
#rm /home/jordan/Desktop/timelapse_new/finished_videos/$FILENAME.h264


