#!/bin/bash
#Script for mass renaming files and folders by Christoph Pomaska

LIST=$(ls $3)
zero=0
number=1
echo -e $LIST > ~/.namelist.txt
cat ~/.namelist.txt |tr ' ' '\n' |sed s/rename.sh// > ~/.namelist2.txt

if [[ $1 == "-b" ]] #Adds a String before the actual filename
	then
	for file in $(cat ~/.namelist2.txt)
		do
			pnameold=$file
			mv $3$pnameold $3$2$pnameold
		done
		echo -e "\e[32mDone. Have a nice day!\e[0m"
fi
if [[ $1 == "-t" ]] #Adds a String after the actual filename
	then
	for file in $(cat ~/.namelist2.txt)
		do
			pnameold=$file
			mv $3$pnameold $3$pnameold$2
		done
	echo -e "\e[32mDone. Have a nice day!\e[0m"
fi
if [[ $1 == "-bn" ]] #Adds increasing numbers before the actual filename
	then
	for file in $(cat ~/.namelist2.txt)
		do
			pnameold=$file
			mv $2$pnameold $2$zero$number$pnameold
			number=$(expr 01 + $number)
		done
		echo -e "\e[32mDone. Have a nice day!\e[0m"
fi
if [[ $1 == "-tn" ]] #Adds increasing numbers after the actual filename
	then
	for file in $(cat ~/.namelist2.txt)
		do
			pnameold=$file
			mv $2$pnameold $2$pnameold$zero$number
			number=$(expr 01 + $number)
		done
	echo -e "\e[32mDone. Have a nice day!\e[0m"
fi
