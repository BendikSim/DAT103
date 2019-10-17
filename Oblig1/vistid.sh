#!/bin/bash
declare -i tottid=0
read -p "Hva er hendelse? " hendelse

tid=$(grep $hendelse $1 | cut -f 2)
for i in $tid
do
	tottid+=i
done
echo "$tottid"

