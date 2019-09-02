#!/bin/sh

[ -z "$listFile" ] && listFile="https://raw.githubusercontent.com/Tomualdo/freshInstall/master/list.csv"
curl -Ls "$listFile" > /tmp/listFile.csv

echo -n "Update..."
sudo apt-get -yq update 1>/dev/null
echo "Finished"

echo -n "Upgrade..."
sudo apt-get -yq upgrade 1>/dev/null
echo "Finished"

while IFS=, read -r program; do
	echo -n "installing...$program"
	sudo apt-get install -yq "$program" 1>/dev/null
	if [ $? = 0 ]; then
		echo "...Finished"
	else
		echo "...FAILED"
	fi

done < /home/main1/freshInstaller/list.csv



