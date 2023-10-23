#!/bin/bash

echo "Please select the below options:"
echo "1. sign in"
echo "2. sign up"
echo "3. Exit"

echo "Note: Script Exit Timeout is set"
echo "Please choose your option number: "
read optionNumber

if[ $optionNumber -eq 1 ] ; then

echo -e "Enter UserName: "
read username

echo -e "Enter password: "
read -s password

echo -e "Enter password again"
read passwordagain

if [ $username == "admin" -a $password == $passwordagain -a $password == "password"] ; then

echo "Login succeed"

else

echo "Login failed. try again ...."
exit 1



function take_test(){

echo "Please select the below options:"
echo "1. Take a Test"
echo "2. View your Test"
echo "3. Exit"

qbank_lines=`cat questionbank.txt | wc -l`      # store number of lines in question bank file

for i in `seq 5 5 $qbank_lines`                 # loop to iterate through the question set each of five lines
    do
        clear
        cat questionbank.txt | head -$i | tail -5   # display the question
        for j in `seq 10 -1 1` 
        do
            echo -e "\r Enter the choice: \e[31m$j \e[0m \c"
            read -t 1 option

            if [ -z "$option" ]
            then
                option="e"
            else
                break
            fi
        done 
        echo $option >> user_answer.txt{
        echo "------------------------------"
    done
    clear
    user_ans=('cat user_answer.txt')
    crrt_ans=('cat correctanswer.txt')
    uans_lens=${#user_ans[@]}
    count=0
    for i in 'seq 0 $(($uans_len-1))'
    do
        if [ ${user_ans[$i]} = ${crrt_ans[$i]} ]
        then
            echo "correct" >> result.txt
            count=$(($count+1))
        elif [ ${user_ans[$i]} = "e" ]
        then
            echo "timeout" >> result.txt
        else
            echo "wrong" >> result.txt
        fi
    done

}