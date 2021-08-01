I=1
EXIT=0
STRINGA=$*
find ~/ -iname "${STRINGA}*.*" | sort | uniq | nl
find ~/ -iname "${STRINGA}*.*" > temp.txt | sort | uniq
OUT=`find ~/ -iname "${STRINGA}*.*" | wc -l`
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
				echo -e "\t \n--- FILE'S CONTENT--- \t \n"
				cat ${VALUE}
				DIRECTORY=${VALUE%/*}
				echo -e "\t \nYOU ARE NOW IN THE SELECTED FILE'S DIRECTORY \n"
				cd "${DIRECTORY}/"
				echo -n "DIRECTORY : "
				pwd
				echo "FILE : ${VALUE}"
				echo " "
		fi
		(( I=${I}+1 ))
done< ./temp.txt
rm -f temp.txt
