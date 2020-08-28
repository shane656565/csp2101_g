#!/bin/bash

let rep="1"                                                                                         # setting the value for loop

while [ $rep -eq 1 ]; do                                                                            # loop for failed
    read -p "please input two integers:" number1 number2                                            # inputs

    if [[ $number1 =~ ^[0-9]+$ ]] && [[ $number2 =~ ^[0-9]+$ ]]; then                               # making sure the inputs are integers
        if [ $number1 -ge 20 -a $number1 -le 40 ] && [ $number2 -ge 20 -a $number2 -le 40 ]; then   # 20<= X,Y <=40
            echo "$number1 and $number2 are valid numbers"                                          # valid
            let rep="0"                                                                             # end the loop
        else                                                                                        # unvalid
            echo "$number1 and $number2 are invalid inputs, try again."                             
            let rep="1"                                                                             # do the loop again
        fi
    else                                                                                            # inputs are not integers
        echo "$number1 and $number2 are invalid inputs, try again." 
        let rep="1"                                                                                 # do the loop again
    fi
done

exit 0                                                                                              # exit code