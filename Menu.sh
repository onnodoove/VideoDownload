#!/bin/bash

listchoice=$(zenity --list --title="Youtube" --column="Maak een keuze" "Youtube-Download" "Video-playback" "Play-all" 1>&1)
if [ $listchoice == "Youtube-Download" ]; then
	gnome-terminal --command="./Videodownload.sh"
else 
	if [ $listchoice == "Video-playback" ]; then
		./VideoPlayback.sh
	else 
		if [ $listchoice == "Play-all" ]; then
			cvlc -f --random /home/onno/Presentaties/*
		fi
	fi
fi

