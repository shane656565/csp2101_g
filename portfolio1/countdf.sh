#!/bin/bash

if [ -f $1 ]; then                              #if the input is a file
    if [ -s $1 ]; then                          #if the file is not empty
         echo "files that cantain data"         #output on screen
    else                                        #if the file is empty
        echo "files that are empty"             #output on screen
    fi

elif [ -d $1 ]; then                            #if the input is a directory
    if [ "'ls -a $1'" = "" ]; then              #if the directory is empty
        echo "empty directories"
    else                                        #if the directory is not empty
        echo "non-empty directories"            
    fi

else
    echo "directory is not exit"                #not a correct directory or file name
    exit 1
fi

exit 0                                          #exit code