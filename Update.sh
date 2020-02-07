#!/bin/bash

echo "Starten met bijwerksessie..."
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt clean
listchoice=$(zenity --list --column="Maak een keuze" "Herstarten?" "Uitzetten?" 1>&1)
if [ $listchoice == "Herstarten?" ]; then
	sudo reboot now
else
	if [ $listchoice == "Uitzetten?" ]; then
		shutdown now
	fi
fi
zenity --info --text="Alles bijgewerkt"

