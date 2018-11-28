#!/bin/bash

export studentname=$STUDENTNAME && studentid=$STUDENTID
# Make sure your student name/ID is stored in $STUDENTNAME and $STUDENTID
dir=${PWD##*/}

# $1 = assignment or report, $2 is report/assignment number, $3 is number of questions if assignment
if [ "$#" -gt 4 ]; then 
	echo "Illegal number of arguments\n"
	echo "Usage: maketex report||assignment number [number of assignment questions]"
elif [ "$1" = "report" ]; then # if it's a report
	if [ "$2" -eq "$2" 2> /dev/null ]; then # if it specifies the number
		mkdir "$1$2"
		cd ./"$1$2"
		cp ~/Documents/Projects/latex-assignment-generator/header.tex .
		sed -i -e 's/(class)/'"$dir"'/g' ./header.tex
		sed -i -e 's/(doctype)/Report/g' ./header.tex
		sed -i -e 's/(name)/'"$studentname"'/g' ./header.tex
		sed -i -e 's/(id)/'"$studentid"'/g' ./header.tex
		cat header.tex ~/Documents/Projects/latex-assignment-generator/reportbody.tex ~/Documents/Projects/latex-assignment-generator/footer.tex >> "$dir"-Report"$2".tex
		rm header.tex
		cd ..
	else
		echo "Usage: maketex report||assignment number [number of assignment questions]"
	fi 
elif [ "$1" = "assignment" ]; then # if it's an assignment
	if [ "$2" -eq "$2" 2> /dev/null ]; then # if it specifies the number
		if [ "$3" -eq "$3" 2> /dev/null ]; then # if it specifies the number of questions
			mkdir "$1$2"
			cd ./"$1$2"
			cp ~/Documents/Projects/latex-assignment-generator/header.tex .
			sed -i -e 's/(class)/'"$dir"'/g' ./header.tex
			sed -i -e 's/(doctype)/Assignment '"$2"'/g' ./header.tex
			sed -i -e 's/(name)/'"$studentname"'/g' ./header.tex
			sed -i -e 's/(id)/'"$studentid"'/g' ./header.tex

			for (( i=0; i<"$3"; i++ ))
			do
				cat ~/Documents/Projects/latex-assignment-generator/question.tex >> questions.tex
			done

			cat header.tex ~/Documents/Projects/latex-assignment-generator/qheader.tex questions.tex ~/Documents/Projects/latex-assignment-generator/footer.tex >> "$dir"-Assignment"$2".tex
			rm header.tex
			rm questions.tex
			cd ..
		else
			echo "Usage: maketex report||assignment number [number of assignment questions]"
		fi
	else
		echo "Usage: maketex report||assignment number [number of assignment questions]"
	fi
else
	echo "Usage: maketex report||assignment number [number of assignment questions]"
fi

