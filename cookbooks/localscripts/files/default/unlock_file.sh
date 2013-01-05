#!/bin/bash

if [ -x "$1" ]
then
	echo "Need a file to decrypt!"
	exit
fi

filename=`basename $1`
output_file=${filename%.enc}
openssl aes-256-cbc -d -a -in $1 -out $PWD/${output_file}

if [ -e "$PWD/${output_file}" ]
then
	echo "Your file => $PWD/${output_file}"
	echo "WARNING! it is no longer encrypted on the filesystem!"
else
	echo "Bad news bears it did not work :("
fi
