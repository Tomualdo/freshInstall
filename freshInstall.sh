#!/bin/sh

[ -z "$listFile" ] && listFile="https://raw.githubusercontent.com/Tomualdo/freshInstall/master/list.csv"
curl -Ls "$listFile" > /tmp/listFile.csv

while IFS=, read -r program; do
	sudo apt install -y "$program"
done < /tmp/listFile.csv
