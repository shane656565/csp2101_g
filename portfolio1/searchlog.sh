#!/bin/bash

let rep="1"                                                         #setting the value for loop

while [ $rep -eq 1 ]; do                                            #loop for searching again
    read -p "Please input the file you want to search:" file        #target file name
    read -p "Please input the words you want to search:" W          #target string
    echo "Please input the type you want to search:"                #type choice
    echo "1:Find all lines starting with the words you input."      #first character searching
    echo "2:Find all lines ending with the words you input."        #last character searching
    echo "3:Find all lines with the words you input."               #all txt searching
    echo "4:Find all lines without the words you input."            #inverting searching
    read type   
    read -p "Please input the file you want to save the data:" pend #backup file name

    case $type in
    1)  if [[ $(cat $file | grep -in "^$W" | wc -l) -ge 1 ]]; then  #first character searching
            echo $(cat $file | grep -in "^$W" | wc -l)              #the number of output
            echo "$(grep -in "^$W" $file)"                          #the content of output
            grep -in "^$W" $file > $pend                            #copy output to backup file
        else
            echo "No results found."                                #no output
        fi;;

    2)  if [[ $(cat $file | grep -in "$W$" | wc -l) -ge 1 ]]; then  #last character searching
            echo $(cat $file | grep -in "$W$" | wc -l)              
            echo "$(grep -in "$W$" $file)" 
            grep -in "$W$" $file > $pend
        else
            echo "No results found."
        fi;;

    3)  if [[ $(cat $file | grep -in "$W" | wc -l) -ge 1 ]]; then   #all txt searching
            echo $(cat $file | grep -in "$W" | wc -l) 
            echo "$(grep -in "$W" $file)" 
            grep -in "$W" $file > $pend
        else
            echo "No results found."
        fi;;

    4)  if [[ $(cat $file | grep -ivn "$W" | wc -l) -ge 1 ]]; then  #inverting searching
            echo $(cat $file | grep -ivn "$W" | wc -l) 
            echo "$(grep -ivn "$W" $file)" 
            grep -ivn "$W" $file > $pend
        else
            echo "No results found."
        fi;;
    esac

    read -p "Do you want to search again? If yes, please press 1:" rep
done

exit 0                                                          #exit code