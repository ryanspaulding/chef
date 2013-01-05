#!/bin/bash

unlock_file.sh ~/.NASA.enc | grep -v WARNING | grep -v 'Your file'
cat $PWD/.NASA | tr -d "\n" | pbcopy && echo "Password in paste buffer"
rm $PWD/.NASA
