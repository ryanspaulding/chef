#/bin/bash

if [ -x "$1" ]
then
	echo "Need a file to encrypt!"
	exit
fi

openssl aes-256-cbc -a -salt -in $1 -out $PWD/$1.enc

if [ -e "$PWD/$1.enc" ]
then
	echo "$1 encypted => $PWD/$1.enc"
	echo "Remove original file [y/n]?: "
	read to_remove
	if [ "${to_remove}" == "y" ]
	then
		echo "Removing $PWD/$1"
		rm $PWD/$1
	elif [ "${to_remove}" == "n" ]
	then
		echo "Ok, note $PWD/$1 is not encrypted"
	else
		echo "y or n only, note $PWD/$1 is not encrypted"
	fi	
else
	echo "Bad news bears there was an error :("
fi
