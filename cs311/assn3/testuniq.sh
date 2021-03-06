#!/bin/bash
# Runs test on uniqify
# Usage: 
# testuniq.sh subfolder
# if no subfolder, just use "."

function p {
	local STR=""
	STR+=$(du -sk $1 | cut -f 1) #get filesize in kb
	STR+=", "	
	echo $STR
	/usr/bin/time -f "%S" uniqify 10 < $1 > /dev/null
}

echo "Fileize (kilobytes), system time"
for f in $1/*txt
	do 
		p $f
done
