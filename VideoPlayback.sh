#!/bin/bash

zenity --info --text="Kies in het volgende scherm de video die je wil spelen"
FileName=$(zenity --filename=/home/onno/Presentaties/ --file-selection 1>&1)
if [ $FileName != "" ]; then
    cvlc -f --play-and-exit $FileName
fi