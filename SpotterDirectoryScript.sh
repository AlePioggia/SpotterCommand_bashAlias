I=1
EXIT=0
STRINGA=$*
find ~/ -type d -iname "${STRINGA}*" | sort | uniq | nl
find ~/ -type d -iname "${STRINGA}*" > temp.txt | sort | uniq
OUT=`find ~/ -type d -iname "${STRINGA}*" | wc -l`
if (( ${OUT} <= 0 )); then
	echo "I didn't find anything"
	EXIT=1
fi
echo "In which directory would you like to go?(write down the line)"
echo "Type "n" if you wanna exit"
read INPUT
if [[ "${INPUT}"="n" ]]; then
	EXIT=1;
fi
while read VALUE; do
		if ((${INPUT}==${I})); then
				echo -e "\t \n--- FILE'S CONTENT--- \ \t"
				echo -e "\t \nYOU ARE NOW IN THE SELECTED FILE'S DIRECTORY \n"
				echo ${VALUE}
				cd ${VALUE}
				echo -n "DIRECTORY : "
				pwd
		fi
		(( I=${I}+1 ))
done< ./temp.txt
