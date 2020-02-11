#!/bin/bash

zenity --info --no-wrap --text="Kies in het volgende scherm de video die je wil converteren"
FileName=$(zenity --filename=/home/onno/Presentaties/ --file-selection 1>&1)
if [ $FileName != "" ]; then
	Name=$(basename $FileName)
	NewName="/home/onno/Muziek/${Name%.*}.mp3"
    ffmpeg -i $FileName $NewName
	zenity --info --no-wrap --text="$FileName geconverteerd naar $NewName"
fi