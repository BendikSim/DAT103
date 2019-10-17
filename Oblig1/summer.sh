#!/bin/bash

echo "Skriv inn tall du vil summere og trykk ctrl+d for å få summen"
declare -i sum=0
declare -i tall

while read tall
do
sum+=tall
done
echo "Summen er $sum"

