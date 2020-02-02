#!/bin/bash

listchoice=$(zenity --list --title="Game of platform?" --column="Make a choice" "Youtube-Download" "Video-playback" 1>&1)
if [ $listchoice == "Youtube-Download" ]; then
	gnome-terminal --command="./Videodownload.sh"
else 
	if [ $listchoice == "Video-playback" ]; then
		./VideoPlayback.sh
	fi
fi

