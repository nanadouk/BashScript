#!/bin/bash

DIRS="/home /var/log"
echo "DISK SPACE USAGE"

for dir in $DIRS; do
	echo "Directory $dir"
	printf "Rating\tSize\tLocation\n"
	du -S -h $dir 2>/dev/null |
	sort -rn |
	sed '{11,$D; =}' |
	sed 'N; s/\n/ /' |
	awk '{printf $1 "." "\t" $2 "\t" $3 "\n"}'
done
exit
