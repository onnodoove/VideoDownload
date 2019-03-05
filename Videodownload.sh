#!/bin/bash

# Laatste binaries van youtube-dl binnenhalen
zenity --info --no-wrap --text="Upgrade youtube-dl to latest version"
Passwordstring=$((zenity --password) 1>&1)
echo $Passwordstring | sudo -S apt upgrade youtube-dl

# Link ophalen en in variabele DownLoadLink voegen
DownLoadLink=$((zenity --entry --text="Paste link to video" --entry-text="") 1>&1)

# Bestandsnaam video ophalen en in variabele MovieName voegen
MovieName=$((youtube-dl --get-filename -o '%(id)s' $DownLoadLink) 1>&1)
MovieExt=$((youtube-dl --get-filename -o '%(ext)s' $DownLoadLink) 1>&1)

# Video downloaden naar harde schijf en foutcode afvangen in ErrorCode
echo "Even geduld....."
ErrorCode=$((youtube-dl -o '%(id)s.%(ext)s' $DownLoadLink) 2>&1 > /dev/null)

if [ "$ErrorCode" == "WARNING: Requested formats are incompatible for merge and will be merged into mkv." ]; then
	MovieExt="mkv"
	ErrorCode=""
fi
# ErrorCode checken, script door laten gaan bij ErrorCode 0
if [ "$ErrorCode" == "" ]; then
# Melding en vragen of de naam veranderd moet worden
	cp $MovieName.$MovieExt Videos/$MovieName.$MovieExt
	rm $MovieName.$MovieExt
	cd Presentaties
	zenity --question --text="Stored as $MovieName.$MovieExt, rename?"
	if [ $? -eq 0 ]; then
		NewName=$((zenity --entry --text="Enter a name without spaces" --entry-text="$MovieName") 1>&1)
		cp $MovieName.$MovieExt $NewName.$MovieExt
		rm $MovieName.$MovieExt
		MovieName=$NewName
		zenity --info --text="Renamed to $MovieName.$MovieExt"
	fi
# Vragen om af te spelen	
	zenity --question --text="Play?"
	if [ $? -eq 0 ]; then
		cvlc --play-and-exit $MovieName.$MovieExt
	fi
else
# Bij kriteke fout melden en afsluiten
	zenity --info --no-wrap --text="This video has been protected against downloading"
fi

