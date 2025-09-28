#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

FOLDER_LOG="/var/log/shell-practice"
mkdir -p $FOLDER_LOG
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$FOLDER_LOG/$SCRIPT_NAME.log"
export LOG_FILE

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e " $R ERROR $N Please run with root previlege"
    # if -e given echo command will take it as first letter as command, above $R is starting of color Green and $N is for end of color.
    exit 1
fi


VALIDATE(){

    if [ $1 -ne 0 ]; then
    echo -e " $R ERROR $N Installing $2 is failure"
    # if -e given echo command will take it as first letter as command, above $R is starting of color Green and $N is for end of color.
    exit 1
else
    echo -e " $G $2 installation successfully completed $N "
    # if -e given echo command will take it as first letter as command, above $G is starting of color Green and $N is for end of color.
fi

}

for package in $@
do
    #check package is already installed or not
    dnf installed $package &>>LOG_FILE

    #if exist status is 0, already installed. -ne 0 need to install it
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>LOG_FILE
        VALIDATE $? "$package"
else
    echo -e "$package already installed ... $Y SKIPPED $N"
fi

done