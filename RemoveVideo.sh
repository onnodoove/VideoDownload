#!/bin/bash

zenity --info --no-wrap --text="Kies in het volgende scherm de video die je wil verwijderen"
FileName=$(zenity --filename=/home/onno/Presentaties/ --file-selection 1>&1)
if [ $FileName != "" ]; then
    rm $FileName
	zenity --info --no-wrap --text="$FileName verwijderd"
fi