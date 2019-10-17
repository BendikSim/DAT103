#!/bin/bash

filnavn="$1"
intervall=$2
fortsett=true

if [ -e "$filnavn" ]
then
	mtime=$(stat -c %y $filnavn)

	while $fortsett
	do
		if [[ ! -e "$filnavn" ]]
		then
         		echo "Filen $filnavn ble slettet"
			fortsett=false
		else
			nymtime=$(stat -c %y $filnavn)

			if [ "$mtime" != "$nymtime" ]
			then
				echo "Filen $filnavn ble endret"
				fortsett=false
			fi
		fi
	sleep "$intervall"

	done
else
	while $fortsett
	do
		if [ -e "$filnavn" ]
		then
			echo "Filen $filnavn ble opprettet"
			fortsett=false
		fi
	sleep "$intervall"
	done
fi

