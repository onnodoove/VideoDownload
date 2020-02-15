#!/bin/bash

listchoice=$(zenity --list --title="Youtube" --column="Maak een keuze" "Youtube-Download" "Video-playback" "Play-all"\
 "Van-video-naar-muziek" "Video-verwijderen" "Update-Youtube" "PC-Updates" 1>&1)
if [ $listchoice == "Youtube-Download" ]; then
	gnome-terminal --window --full-screen -- ./Videodownload.sh
else 
	if [ $listchoice == "Video-playback" ]; then
		./VideoPlayback.sh
	else 
		if [ $listchoice == "Play-all" ]; then
			cvlc -f --random /home/onno/Presentaties/*
		else
			if [ $listchoice == "Van-video-naar-muziek" ]; then
				gnome-terminal --window --full-screen -- ./ConvertToAudio.sh
			else
				if [ $listchoice == "Video-verwijderen" ]; then
					./RemoveVideo.sh
				else 
					if [ $listchoice == "Update-Youtube" ]; then
						gnome-terminal --window --full-screen -- pip3 install --upgrade youtube-dl
						zenity --info --no-wrap --text="Youtube-dl is bijgewerkt"
					else 
						if [ $listchoice == "PC-Updates" ]; then
							gnome-terminal --window --full-screen -- ./Update.sh
						fi
					fi
				fi
			fi
		fi
	fi
fi

