#!/bin/bash

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` {directory ...}"
  exit 0
fi

echo "================================"
echo "Assignement 3 - DISK SPACE USAGE"
echo "Group 7 - Authors:"
echo "Doukmak Anna"
echo "Vanoni Davide"
echo "Fischer Marcus"
echo "BFH 2018 - Modern Linux"
echo "================================"

echo "Specify the max number of directories to show:"
read -r MAX_SHOW

#Iterate over arguments
for dir in "$@"; do
	#Simple print
	printf "\nDirectory $dir\n"

	#Formatted print
	printf "Rating\tSize\tLocation\n"

	#Get directory size in human mode (M, K, ...)
	du -h --max-depth=1 $dir 2>/dev/null |

	#Sort the list by directory size in descending mode
	sort -rh |

	#Max number in result list
	sed '{'$(( $MAX_SHOW+1 ))',$D; =}' |

	#All in one line and not new line after the enumerated id
	sed 'N; s/\n/ /' |

	#Print the row (directory) in a formatted mode respecting the header
	awk '{printf $1 "." "\t" $2 "\t" $3 "\n"}'
done

printf "\nGOODBYE!!\n"

exit
